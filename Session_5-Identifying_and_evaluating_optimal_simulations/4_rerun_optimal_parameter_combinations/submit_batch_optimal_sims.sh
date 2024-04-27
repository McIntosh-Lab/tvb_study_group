#!/bin/bash
# This script submits the optimal parameter simulation for each subject.

### START MODIFYING HERE
### ====================================

# Location of your submission script directory
SUBMISSION_SCRIPT_DIR='/path/to/Session_5-Identifying_and_evaluating_optimal_simulations/4_rerun_optimal_parameter_combinations'

# Paths to TSV files for optimal parameters
PARAM_FILE="/path/to/optimal_FCD_var_for_each_subject.tsv" # THIS CAN BE CHANGED TO FCD_KS, FC_corr, or FCDvar_diff

# Path to a subject's weights matrix txt file - the {subject} portion will be replaced dynamically in the python script
weights_file_pattern="/path/to/subs/{subject}/weights.txt"

# Output directory and file for saving simulation results
results_dir="${SUBMISSION_SCRIPT_DIR}/results/simulation_results"
results_file_pattern="${results_dir}/{subject}_simulation_results.txt"

# Output directory and file for saving FCD matrices
FCD_dir="${SUBMISSION_SCRIPT_DIR}/results/FCD_matrices"
FCD_file_pattern="${FCD_dir}/{subject}/{subject}_{noise}_{G}_{dt}_FCD.txt"

# Output directory and file for saving simulation
sim_dir="${SUBMISSION_SCRIPT_DIR}/results/simulation"
sim_file_pattern="${FCD_dir}/{subject}/{subject}_{noise}_{G}_{dt}_sim_"  # not complete - modality will be appended at the end

# Logging directory for saving any printouts from the jobs (e.g., errors)
log_dir="${SUBMISSION_SCRIPT_DIR}/logs"

# Location of empirical functional feature files (FC, FCD, FCDvar) 
empFUNC_dir="/path/to/empFUNC/saves"

# Simulation parameters
dt=0.005

# simulation length (unit depends on model setup) - desired length of simulated time series - not to be confused with time_per_sim
sim_len='30000'

# Number of simulations per job
num_sims_per_job=3

# Time per simulation (seconds) - max amount of time you want your simulation script to run for - not to be confused with sim_len
time_per_sim=1000
### ====================================
### STOP MODIFYING HERE

mkdir -p "${FCD_dir}/"
mkdir -p "${log_dir}/"
mkdir -p "${sim_dir}/"
mkdir -p "${results_dir}/"

total_lines=$(($(wc -l < "$PARAM_FILE") - 1))
num_jobs=$(( (total_lines + num_sims_per_job - 1) / num_sims_per_job ))  # Calculate the number of jobs needed

sbatch -J "optimal_parameters_rerun" --array=1-$num_jobs \
  -o "${log_dir}/optimal_parameters_rerun_job_%a.out" \
  ${SUBMISSION_SCRIPT_DIR}/optimal_sim_job.sh $PARAM_FILE $num_sims_per_job $time_per_sim $weights_file_pattern $results_file_pattern $FCD_file_pattern $empFUNC_dir $dt $sim_len $sim_file_pattern

