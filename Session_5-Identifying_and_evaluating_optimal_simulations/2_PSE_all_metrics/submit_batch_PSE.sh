#!/bin/bash
# This script submits the parameter search exploration (PSE) for multiple subjects. Most commonly configured variables that need to be modified should be done so below.


### START MODIFYING HERE
### ====================================

# Location of your submission script directory
SUBMISSION_SCRIPT_DIR='/path/to/Session_5-Identifying_and_evaluating_optimal_simulations/2_PSE_all_metrics'

# List of subjects
sublist="/path/to/subs.tsv"

# Path to a subject's weights matrix txt file - the {subject} portion will be replaced dynamically in the python script
weights_file_pattern="/path/to/subs/{subject}/weights.txt"

# Output file for job parameters
param_file="${SUBMISSION_SCRIPT_DIR}/PSE_job_parameters.txt"
> "$param_file"  # Clear existing file contents

# Output directory and file for saving simulation results
results_dir="${SUBMISSION_SCRIPT_DIR}/results/simulation_results"
results_file_pattern="${results_dir}/{subject}_simulation_results.txt"

# Output directory and file for saving FCD matrices
FCD_dir="${SUBMISSION_SCRIPT_DIR}/results/FCD_matrices"
FCD_file_pattern="${FCD_dir}/{subject}/{subject}_{noise}_{G}_{dt}_FCD.txt"

# Logging directory for saving any printouts from the jobs (e.g. errors)
log_dir="${SUBMISSION_SCRIPT_DIR}/logs"

# Location of empirical functional feature files (FC, FCD, FCDvar) 
empFUNC_dir="/path/to/empFUNC/saves"

# Parameter ranges
G_start=1.65
G_end=2.05
num_G=41

noise_start=0.02
noise_end=0.05
num_noise=7

dt=0.005

# simulation length (unit depends on model setup) - desired length of simulated time series - not to be confused with time_per_sim
sim_len='30e3'

# Number of simulations per job
num_sims_per_job=3

# Time per simulation (seconds) - max amount of time you want your simulation script to run for - not to be confused with sim_len
time_per_sim=1000

### ====================================
### STOP MODIFYING HERE

# Make above directories if they don't exist - FCD and log files also have subject subdirectories - created belwo
mkdir -p $results_dir

# Calculate steps
G_step=$(echo "scale=10; ($G_end - $G_start) / ($num_G - 1)" | bc)
noise_step=$(echo "scale=10; ($noise_end - $noise_start) / ($num_noise - 1)" | bc)

# Generate parameter combinations

for ((i=0; i<num_noise; i++)); do
  noise=$(echo "scale=10; $noise_start + $i * $noise_step" | bc)
  for ((j=0; j<num_G; j++)); do
    G=$(echo "scale=10; $G_start + $j * $G_step" | bc)
    echo "$noise $G $dt $sim_len" >> "$param_file"
  done
done




# Job submission loop
while IFS= read -r subject; do
  echo $subject
  #make required directories
  mkdir -p "${FCD_dir}/${subject}"
  mkdir -p "${log_dir}/${subject}"

  total_lines=$(wc -l < "$param_file")
  num_jobs=$(( (total_lines + num_sims_per_job - 1) / num_sims_per_job ))  # Calculate the number of jobs needed

  sbatch -J "param_search_${subject}" --array=1-$num_jobs \
    -o "${log_dir}/${subject}/${subject}_job_%a.out" \
    ${SUBMISSION_SCRIPT_DIR}/PSE_job.sh $param_file $subject $num_sims_per_job $time_per_sim $weights_file_pattern $results_file_pattern $FCD_file_pattern $empFUNC_dir

done < $sublist
