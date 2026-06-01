import pandas as pd
import numpy as np
import os
import sys
import showcase1_ageing as utils

### TO EDIT HERE
## =============================

save_dir="/path/to/empFUNC/saves"
ts_file_pattern = '/path/to/{sub}/rfMRI_0.ica_time_series.txt'
# NUM OF TIMEPOINTS we want to look at and WINDOW SIZES will need to be manually edited below - THEY MUST MATCH OUR SIMULATED DATA's NUM OF TIMEPOINTS and WINDOW SIZES

## =============================
### TO EDIT HERE


def read_time_series(file_path):
    if os.path.exists(file_path):
        # Assuming the file is space-separated
        return pd.read_csv(file_path, sep=" ", header=None)
    else:
        print(f"File not found: {file_path}")
        return None

def compute_fc_matrix(ts):
    ts_transposed = ts.T
    rsFC = np.corrcoef(ts_transposed)
    rsFC = rsFC - np.diag(np.diagonal(rsFC))

    return rsFC

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <subject_id>")
        sys.exit(1)

    sub = sys.argv[1]
    ts_file_path=ts_file_pattern.format(sub=sub)
    ts = read_time_series(ts_file_path)
    if ts is not None:
        ts = ts.iloc[:142, :]  # Keep only the first 142 rows (timepoints)
        ts = ts.to_numpy()
        rsFC = compute_fc_matrix(ts)
        
        # Define path for saving the FC matrix
        save_path = f'{save_dir}/{sub}_empFC.npy'
        np.save(save_path, rsFC)

        FCD, _ = utils.compute_fcd(ts, win_len=20)
        save_path = f'{save_dir}/{sub}_empFCD.npy'
        np.save(save_path, FCD)
        
        FCDvar_iu = np.triu_indices_from(FCD, k=20)
        FCD_VAR_OV_vect= np.var(FCD[FCDvar_iu])
        save_path = f'{save_dir}/{sub}_empFCDvar.npy'
        np.save(save_path, FCD_VAR_OV_vect)
