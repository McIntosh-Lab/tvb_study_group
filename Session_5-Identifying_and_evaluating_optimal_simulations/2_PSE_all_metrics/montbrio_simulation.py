import sys, os, time
import numpy as np
import showcase1_ageing as utils
from tvb.simulator.lab import *
from tvb.simulator.backend.nb_mpr import NbMPRBackend
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import resource
import time
import fcntl
from scipy.stats import ks_2samp


## TO EDIT - exact filenames of empirical functional files may vary depending on how they were generated. The below filenames follow filenaming pattern defined in empirical_functional_features/create_emp_funcfeat.py
## ==============================
def get_empFUNC(subject,empFUNC_dir):
        empFCD = np.load(os.path.join(empFUNC_dir, subject + "_empFCD.npy"))
        empFC = np.load(os.path.join(empFUNC_dir, subject + "_empFC.npy"))
        empFCDvar = np.load(os.path.join(empFUNC_dir, subject + "_empFCDvar.npy"))
        return empFCD, empFC, empFCDvar

## ==============================
## TO EDIT


def compute_simFC(bold_d):
    rsFC = np.corrcoef(bold_d[:,0,:,0].T)
    rsFC = rsFC - np.diag(np.diagonal(rsFC))
    return rsFC
    
def get_connectivity(scaling_factor,weights_file):
        SC = np.loadtxt(weights_file)
        SC = SC / scaling_factor
        conn = connectivity.Connectivity(
                weights = SC,
                tract_lengths=np.ones_like(SC),
                centres = np.zeros(np.shape(SC)[0]),
                speed = np.r_[np.Inf]
        )
        conn.compute_region_labels()
        return conn


def process_sub(subject, my_noise, G, dt, sim_len, weights_file_pattern, FCD_file_pattern,empFUNC_dir):
    start_time = time.time()

    weights_file=weights_file_pattern.format(subject=subject)
    

    dt      = dt
    nsigma  = my_noise
    G       = G
    sim_len = sim_len
    #30e3 produced 300000 ms, or 300s or 5 min. we get 142 bold timepoints if we have decimate 2000 and remove first eight timepoints

    sim = simulator.Simulator(
        connectivity = get_connectivity(1,weights_file),
        model = models.MontbrioPazoRoxin(
            eta   = np.r_[-4.6],
            J     = np.r_[14.5],
            Delta = np.r_[0.7],
            tau   = np.r_[1.],
        ),
        coupling = coupling.Linear(a=np.r_[G]),
        integrator = integrators.HeunStochastic(
            dt = dt,
            noise = noise.Additive(nsig=np.r_[nsigma, nsigma*2])
        ),
        monitors = [monitors.TemporalAverage(period=0.1)]
    ).configure()

    runner = NbMPRBackend()
    (tavg_t, tavg_d), = runner.run_sim(sim, simulation_length=sim_len)
    tavg_t *= 10
        
    bold_t, bold_d = utils.tavg_to_bold(tavg_t, tavg_d, tavg_period=1.,decimate=2000,TE=0.02763)
    print('tavg_to_bold step')

    # cut the initial transient (16s)
    bold_t = bold_t[8:]
    bold_d = bold_d[8:]
    FCD, _ = utils.compute_fcd(bold_d[:,0,:,0], win_len=20)
    FCDvar_iu = np.triu_indices_from(FCD, k=20)
    FCD_VAR_OV_vect= np.var(FCD[FCDvar_iu])
    print('simFCDvar step')
    
    #CHECK EMPIRICAL vs SIMULATED DATA
    empFCD, empFC, empFCDvar= get_empFUNC(subject,empFUNC_dir)
    print('get empFUNC')

    #FCD KS VALUE
    iu = np.triu_indices_from(empFCD, k=1)
    FCD_KS, _ = ks_2samp(empFCD[iu], FCD[iu])
    print('fcd_ks step:', FCD_KS)

    #FC correlation    
    simFC = compute_simFC(bold_d)
    print('compute_simFC step')
    FC_iu = np.triu_indices_from(simFC, k=1)
    FC_corr = np.corrcoef(empFC[FC_iu], simFC[FC_iu])[0, 1]
    print('fc corr step:',FC_corr)

    #CHECK FCDVAR DIFF VALUE
    FCDvar_diff= abs(empFCDvar - FCD_VAR_OV_vect)
    print('fcdvar_diff step:',FCDvar_diff)

    
    # Calculate time taken
    end_time = time.time()
    time_taken = end_time - start_time

    #save FCD_file
    FCD_file=FCD_file_pattern.format(subject=subject,noise=my_noise,G=G,dt=dt)
    np.save(FCD_file, FCD)

    return([FCD_VAR_OV_vect, FCD_KS, FC_corr, FCDvar_diff, time_taken])
