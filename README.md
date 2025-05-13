# The Virtual Brain (TVB) Study Group

This is the repository for The Virtual Brain (TVB) Study Group, a introductory course to running TVB simulations with Python. Resources (documentation, notebooks, tutorials) for each session can be found within each session's folders above or by clicking the links below.

If you're looking for our TVB modelling workflow, see the Notebooks and Homework for each session. A Quick-start Guide featuring our entire TVB workflow in a single document will also be released shortly! 

<br>

## REQUIREMENTS 

In order to execute the Notebooks in this repository, you will need to 1) install TVB and 2) have access to high-performance computing resources, specifically the [Digital Research Alliance of Canada (DRA)](https://www.alliancecan.ca/en) compute clusters. 

1. Install TVB with these [Installation Instructions](https://github.com/McIntosh-Lab/tvb_demo/tree/main). If you encounter different _installation_ instructions in a notebook or recording, always follow the steps provided in the tvb_demo instead as it is more up-to-date. If you encounter different _simulation_ instructions, follow the steps provided in this tvb_study_group repo instead.

3. See points 1 through 3 [here](https://github.com/McIntosh-Lab/tvb_study_group/blob/main/Session_2-Post-processing/Session%202%3A%20Post-processing.md#homework) for information about access to DRA computing resources.

<br>

## QUICKSTART SIMULATION

We strongly recommend going through all the course material in this repository before using the quickstart simulation code for [a single interactive simulation](https://github.com/McIntosh-Lab/tvb_demo/tree/main#tvb-demo-quickstart-simulation---interactive-sessionjob-single-simulation) or [multiple simulations](https://github.com/McIntosh-Lab/tvb_demo/tree/main#tvb-demo-quickstart-simulation---multiple-job-submission-multiple-simulations).



<br>

## COURSE OVERVIEW

## Session 1: Theory

_Some of the foundational theory - an introduction to the what, why, and how of modelling with The Virtual Brain._

&nbsp;&nbsp;&nbsp;&nbsp;[Slides](https://docs.google.com/presentation/d/1m162HYdZUSFA2WCnUa9mi3SdtjetL12cw4RU8mI_GLk/edit?usp=drive_link) - [Recording](https://1sfu-my.sharepoint.com/:v:/g/personal/jwa415_sfu_ca/EfPr6L_q7qhMnKndRV4BMIEB8UuRWvn7iyoz1XNix1yJww?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=nVWeiK) - [Notes](Session_1-Theory/Session%201%3A%20Theory.md)

<br>

## Session 2: Post-processing

_What needs to be done with our neuroimaging data before we can start creating our TVB models?_

&nbsp;&nbsp;&nbsp;&nbsp;[Slides](https://docs.google.com/presentation/d/1D30noTEmEf7WG79DQvx8s5TIpO1v7XMXegMtXps2ouo/edit?usp=drive_link) - [Recording](https://1sfu-my.sharepoint.com/:v:/g/personal/jwa415_sfu_ca/EVdHkycGT_VBscB6KE7Z4F0BNmcmErMSRIpNWQ_SkF5sPQ?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=aA0YLz) - [Notes](Session_2-Post-processing/Session%202%3A%20Post-processing.md)

<br>

## Session 3: Simulation

_Example simulation code for a single set of parameter combinations._

&nbsp;&nbsp;&nbsp;&nbsp;No Slides - [Recording](https://1sfu-my.sharepoint.com/:v:/g/personal/jwa415_sfu_ca/EVU7MR6JeIpKn8nb44BiD9IBtWGRIv4o2o3lPM-JHcS27w?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=QeCJTl) - [Notebook](Session_3-Simulation/Session3_Single_Simulation.ipynb)

<br>

## Session 4: Jobs & PSE

_Parameter sweeps. How to submit multiple simulations as jobs on a HPC cluster._

&nbsp;&nbsp;&nbsp;&nbsp;[Slides](https://docs.google.com/presentation/d/19SKdmSUgU53EFdFqIxvTQMlsPrS7PcvaE6op9ZtRY8E/edit?usp=share_link) - [Recording](https://1sfu-my.sharepoint.com/:v:/g/personal/jwa415_sfu_ca/EYDUUvjf-wtNocPzvwJDj1IBStEKTyTIQGLifi1CD1xkeg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=mlcLtO) - [Scripts](Session_4-Jobs_and_PSE)

<br>

## Session 5: Outputs

_Taking a look at some of our parameter sweep and simulation outputs. What are our optimal simulations and parameter combinations?_

&nbsp;&nbsp;&nbsp;&nbsp;[Slides](https://docs.google.com/presentation/d/19SKdmSUgU53EFdFqIxvTQMlsPrS7PcvaE6op9ZtRY8E/edit?usp=share_link) - [Recording](https://1sfu-my.sharepoint.com/:v:/g/personal/jwa415_sfu_ca/EYgkdHbSpZhBsUh0rvB6xgkBC8rgz1r7-1R3TXx0oZ5wGA?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=0VP5XX) - [Notes](Session_5-Identifying_and_evaluating_optimal_simulations/Session_5-Identifying_and_evaluating_optimal_simulations.md)
	
<br>

## Session 6: Analyses

_Exploring some validation approaches and other analyses._

&nbsp;&nbsp;&nbsp;&nbsp;[Slides](https://docs.google.com/presentation/d/19SKdmSUgU53EFdFqIxvTQMlsPrS7PcvaE6op9ZtRY8E/edit?usp=share_link) - No Recording - [Notebook](Session_6-Analyses/Session6_Investigating_Noise_Seeds.ipynb)
