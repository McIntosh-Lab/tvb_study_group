# Session 2 - Imaging inputs and post-processing considerations for brain network modelling

&nbsp;&nbsp;&nbsp;&nbsp;Slide deck for this session can be found [here](https://docs.google.com/presentation/d/1D30noTEmEf7WG79DQvx8s5TIpO1v7XMXegMtXps2ouo/edit?usp=drive_link) and the recording can be found [here](https://drive.google.com/file/d/1euKWnCgXBa5VgL0M7E3UNX8w-OBO3-Vz/view?usp=drive_link).

<br>

## GOALS
Participants will able to make appropriate decisions about post-processing of structural connectomes. 
- Create or check appropriateness of inputs
- Understand formatting requirements for inputs

#### Concepts covered: 
- dMRI cleaning & tractography primer
  - Overview of dMRI processing resources, tutorials, and use cases (FSL, MRtrix, TVB-UKBB)
- Pitfalls for dMRI tractography (probabilistic vs deterministic)
- Graph theory fundamentals
- Post-processing choices (normalization within subject (streamlines vs probabilities), types of thresholding, normalization across the sample)
  - Handling NaN values (removing susceptible ROIs or subjects, interpolation, inference from existing literature)
- What makes a good connectome?
  - Weights & tract length distributions
  - Graph metrics (density, degree, centrality)
  - Qualitative features
- Functional features for optimization
  - MRI FC, FCD, FCDvariance
- Required TVB inputs for each simulation output modality
  - File-naming, file content structure

<br> 

## RESOURCES

### Digital Research Alliance (DRA)
The Digital Research Alliance (formerly known as Compute Canada) hosts free high-performance computing resources. For reproducibility and to save time on setting up environments, our tutorials should be run on Digital Research Alliance's [Cedar cluster](https://docs.alliancecan.ca/wiki/Cedar). Instructions for getting started with DRA are detailed in [Homework](#HOMEWORK) below.



#### [CCDB](https://ccdb.alliancecan.ca/)
The Compute Canada Database is essential for setting up and configuring your Digital Research Alliance of Canada (DRA) account. You can also view and edit account, group, usage, and allocation information. You will need to create a DRA account **as soon as possible** in order to follow some of the tutorials in later sessions.



#### [DRA Wiki](https://docs.alliancecan.ca/wiki/Technical_documentation)
The Digital Research Alliance of Canada has provided a detailed technical documentation wiki that should be the "primary source for users with questions on equipment and services of the Alliance".



#### [DRA Training](https://alliancecan.ca/en/services/advanced-research-computing/technical-support/training-calendar)
The Digital Research Alliance of Canada offers free online training sessions for all skill levels, to equip researchers with the skills and knowledge to perform effective computational work and use DRA HPC resources efficiently. Content covers a wide range of topics, including data analysis, parallel computing, machine learning, and version control.


#### [DRA Status Page](https://status.alliancecan.ca/)
If you're having troubles with any of the DRA resources, it's always a good idea to check the Status Page to see if there are any reported outages.

<br>

### The Virtual Brain (TVB)


#### [TVB input specifications](https://docs.thevirtualbrain.org/manuals/UserGuide/DataExchange.html#import-connectivity-from-zip)
The TVB input specifications detail the requirements regarding filenaming, file contents, and file structure for each input file type (e.g. weights, tract lengths, etc).

<br>

### Sample Datasets

#### [Amsterdam Dataset]()
We'll be using connectomes generated from this open dataset to generate some of our examples. A link will be shared shortly!



#### [tvb-data Sample Data](https://zenodo.org/records/10128131)
tvb-data contains "various demonstration datasets for use with The Virtual Brain project". We will not be using this dataset in our notebooks and examples. Download link [here](https://zenodo.org/records/10128131/files/tvb_data.zip?download=1). 



<br>

## HOMEWORK

#### Required:
1. Sign up with DRA by creating a [CCDB account](https://alliancecan.ca/en/services/advanced-research-computing/account-management/apply-account) by **Wed March 27**. Make sure that your PI is registered with CCDB and that you provide your PI's unique identifier in your registration (e.g. abc-123-01). Your PI will have to confirm your application once you've submitted it.
2. Once complete, you should be able to access Cedar through the command-line with `ssh username@cedar.computecanada.ca`. Your username/password will be your CCDB username/password. See [SSH details](https://docs.alliancecan.ca/wiki/SSH) for other options if this command isn't working on your computer.
3. Familiarize yourself with the DRA and Cedar infrastructure, especially pertaining to [File Storage](https://docs.alliancecan.ca/wiki/Storage_and_file_management).
4. Install the TVB environment on your Cedar account, following the Initial Setup installation instructions on [the tvb_demo repository](https://github.com/McIntosh-Lab/tvb_demo/tree/main#initial-setup-on-compute-canada) by **the week of April 1**.
5. Get started with Jupyter on your Cedar account using [JupyterHub](https://jupyterhub.cedar.computecanada.ca/) with documentation [here](https://docs.alliancecan.ca/wiki/JupyterHub) (simpler). Setup the TVB environment for JupyterLab with instructions also on [our tvb_demo repository](https://github.com/McIntosh-Lab/tvb_demo/tree/main#initial-setup-on-compute-canada) (step 14).

<br>

#### Optional:
- Set up a jupyter notebook to explore structural connectome and functional features 
  - Plot a structural connectivity (SC) matrix for your data
  - Check graph metrics of a SC matrix using BCT or other tools
  - Apply thresholding to a sample

<br>

