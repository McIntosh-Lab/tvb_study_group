#!/bin/bash
#SBATCH --account=YOUR_ALLOCATION_HERE(e.g. def-rmcintos)
#SBATCH --mail-user=YOUR_EMAIL_HERE(e.g. hello@gmail.com)
#SBATCH --mail-type=FAIL
#SBATCH --mem=8000MB
#SBATCH --time=0-5:59

# This script submits one or more simulations in a single job for PSE

### START MODIFYING HERE
### ====================================

# Location of your submission script directory
SUBMISSION_SCRIPT_DIR='/path/to/Session_5-Jobs_and_PSE'

# Load in env
module load scipy-stack
. ~/path/to/virtual_aging_brain/env/bin/activate

### STOP MODIFYING HERE
### ====================================


# Parameters from arguments
param_file=$1
num_sims_per_job=$2
time_per_sim=$3
weights_file_pattern=$4
results_file_pattern=$5
FCD_file_pattern=$6
empFUNC_dir=$7
dt=$8 
sim_len=$9
sim_file_pattern=$10

# Calculate the starting and ending line based on the SLURM_ARRAY_TASK_ID
start_line=$(((SLURM_ARRAY_TASK_ID - 1) * num_sims_per_job + 1))
end_line=$((start_line + num_sims_per_job - 1))




# Read the parameters for the current job from start_line to end_line
sed -n "${start_line},${end_line}p" $param_file | while IFS=' ' read -r subject noise G metric_value; do
  python ${SUBMISSION_SCRIPT_DIR}/single_sim_handler.py $subject $noise $G $dt $sim_len $time_per_sim $SLURM_JOB_ID $SLURM_ARRAY_TASK_ID $weights_file_pattern $results_file_pattern $FCD_file_pattern $empFUNC_dir $sim_file_pattern
done
