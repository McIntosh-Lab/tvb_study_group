# Outputs

In past sessions, we've performed parameter search explorations with our sample data. We visualized how one metric, FCDvariance, varies in our parameter space:

<img src="https://github.com/McIntosh-Lab/tvb_study_group/assets/32205576/4767726c-ee39-4486-ae69-707a7b0d1ef0" width="250" height="auto">

<br>

This session, we'll look at other metrics we may want to optimize for in our search for our optimal parameter combinations. Our additional optimization approaches are: minimizing `emp-simFCD_KS` (Kolmogorov–Smirnov distance between the empirical and simulated FCD matrices), maximizing `emp-simFCD_corr` (correlation between the empirical and simulated FCD matrices), and minimizing `emp-simFCDvar_diff` (difference between the empirical and simulated FCD variance).

## Generating empirical functional features
To calculate our new fitting metrics (`emp-simFCD_KS`, `emp-simFC_corr`, `emp-simFCDvar_diff`) we need to generate empirical features to compare our simulated features with. This code can be found in [empirical_functional_features](https://github.com/McIntosh-Lab/tvb_study_group/tree/main/Session_5-Identifying_and_evaluating_optimal_simulations/1_empirical_functional_features) with the [runner here](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_5-Identifying_and_evaluating_optimal_simulations/1_empirical_functional_features/create_emp_funcfeat_runner.sh). 

*Ensure that key variables like timeseries length and FCD window sizes match between empirical and simulated functional data.*

## Editing showcase1_ageing code
We used the Balloon Model in previous sessions to generate simulated fMRI data. However, we were unable to specify our desired echo time (TE) in Balloon Model functions we called from the `showcase1_ageing` package (see `utils.tavg_to_bold` in the [Sesssion 3 Notebook](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session%203%3A%20Simulation/Session3_Single_Simulation.ipynb)). We will edit our local copy of the showcase1_ageing source code and reinstall the package so that we can specify echo time (TE) in our Balloon Model to match our empirical data. If you followed the [tvb-demo setup](https://github.com/McIntosh-Lab/tvb_demo/tree/main#initial-setup-on-compute-canada), this will be found in `~/TVB/virtual_ageing/showcase1_ageing/simulation.py`

## Running PSE with new metrics
We must run a fresh parameter space exploration (PSE) since previous sessions' PSEs 1) did not calculate our new metrics and 2) did not contain our Balloon Model TE specifications. We'll need to edit the relevant scripts to make sure that we are calculating and saving the new metrics. New PSE code can be found in [PSE_all_metrics](https://github.com/McIntosh-Lab/tvb_study_group/tree/main/Session_5-Identifying_and_evaluating_optimal_simulations/2_PSE_all_metrics) with the batch script [here](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_5-Identifying_and_evaluating_optimal_simulations/2_PSE_all_metrics/submit_batch_PSE.sh).

*Ensure that key variables like timeseries length and FCD window sizes match between empirical and simulated functional data.*

## Picking optimal parameter combinations
Depending on which metric(s) we want to optimize with, we pick our optimal parameter combinations. We can generate [heatmaps](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_5-Identifying_and_evaluating_optimal_simulations/3_visualize_and_assess_PSE/heatmap.py) and [files containing all subjects' optimal parameter combinations](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_5-Identifying_and_evaluating_optimal_simulations/3_visualize_and_assess_PSE/optimal_parameters_getter.py) for each fitting metric.

## Rerunning optimal parameter combinations
We will need rerun simulations for our optimal parameter combinations so that we can save out some outputs (e.g. simulation timeseries) that would be too burdensome to save from all simulations in our parameter search exploration. See [rerun_optimal_parameter_combinations](https://github.com/McIntosh-Lab/tvb_study_group/tree/main/Session_5-Identifying_and_evaluating_optimal_simulations/4_rerun_optimal_parameter_combinations) and the [script for batch submitting optimal simulations](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_5-Identifying_and_evaluating_optimal_simulations/4_rerun_optimal_parameter_combinations/submit_batch_optimal_sims.sh).
