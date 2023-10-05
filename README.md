# ClimateBench

ClimateBench is a benchmark dataset for climate model emulation inspired by [WeatherBench](https://github.com/pangeo-data/WeatherBench). It consists of NorESM2 simulation outputs with associated forcing data processed in to a consistent format from a variety of experiments performed for CMIP6. Multiple ensemble members are included where available. 

The processed training, validation and test data can be obtained from Zenodo: [10.5281/zenodo.5196512](https://doi.org/10.5281/zenodo.5196512).

A pre-print of the paper describing ClimateBench and the baseline models can be found here: <https://www.essoar.org/doi/10.1002/essoar.10509765.2>

## Leaderboard

The spatial, global and total NRMSE of the different baseline emulators for the years 2080-2100 against the ClimateBench task of estimating key climate variables under future scenario SSP245. The models  are ranked in order of the mean of the total NRMSE across all tasks. 

|                  |   ('tas', 'Spatial') |   ('tas', 'Global') |   ('tas', 'Total') |   ('diurnal_temperature_range', 'Spatial') |   ('diurnal_temperature_range', 'Global') |   ('diurnal_temperature_range', 'Total') |   ('pr', 'Spatial') |   ('pr', 'Global') |   ('pr', 'Total') |   ('pr90', 'Spatial') |   ('pr90', 'Global') |   ('pr90', 'Total') |
|------------------|----------------------|---------------------|--------------------|--------------------------------------------|-------------------------------------------|------------------------------------------|---------------------|--------------------|-------------------|-----------------------|----------------------|---------------------|
| Neural Network   |             0.107294 |           0.0440271 |           0.327429 |                                    9.91735 |                                   1.37219 |                                  16.7783 |             2.1281  |           0.2093   |           3.1746  |               2.61022 |             0.345709 |             4.33876 |
| Gaussian Process |             0.109106 |           0.0738238 |           0.478225 |                                    9.20713 |                                   2.67495 |                                  22.5819 |             2.34092 |           0.341453 |           4.04818 |               2.5559  |             0.429154 |             4.70167 |
| Random Forest    |             0.107574 |           0.0584057 |           0.399602 |                                    9.19503 |                                   2.65241 |                                  22.4571 |             2.52431 |           0.502126 |           5.03494 |               2.68209 |             0.543375 |             5.39896 |


## Installation
The example scripts provided here require [ESEm](https://github.com/duncanwp/ESEm) and a few other packages. Below the whole process of setting up the environment in described for a standard Ubuntu distribution. Same can be done for other linux variants with equivalent commands.


1.   First upgrade your linux environment using the following command:  
```
sudo apt update
```

2.   Make sure that python3 is present in your local environment by typing the following command:
```
python3 --version
```
In case its not available install python3 using the following command:
```
sudo apt-get install python3
```
3. Make sure pip is installed on your system by using the following command:
```
pip --version
```
In case it is not available download it using the following command:
```
sudo apt-get install python3-pip
```

### Conda Installation
Follow the instructions on the official conda page to install conda. It can be found [here](https://conda.io/projects/conda/en/latest/user-guide/install/index.html)

Or you can follow the following commandline steps:



*   Download the Miniconda installer for Linux:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
*  Make the installer script executable:
```
chmod +x Miniconda3-latest-Linux-x86_64.sh
```



*   Run the installer script:
```
./Miniconda3-latest-Linux-x86_64.sh
```

*   After the installation completes, either open a new terminal or source your .bashrc (or the appropriate shell configuration file) to ensure the conda command is available:
```
source ~/.bashrc
```

*   Verify the installation by checking the version of Conda:
```
conda --version
```

###Cloning the repository
*   Clone the repository using the following command:
```
git clone https://github.com/pthak006/ClimateBench.git
```

###Setting up Conda Environment


*   Change the directory to the ClimateBench repository using the command
```
cd ClimateBench
```
*   Create the conda environment using the following command:
```
conda env create -f environment.yml
```
*   Make Sure conda environment called newenv is now present in the local environment by using the following command:
```
conda env list
```
*   Activate the newenv conda environment using the following command:
```
conda activate newenv
```

###Downloading the datasets:
*  Download the train and validation datasets using the following command:
```
wget https://zenodo.org/record/7064308/files/train_val.tar.gz?download=1 -O train_val.tar.gz
```
* Extract the train and validation datasets using the following command:
```
tar -xzvf train_val.tar.gz
```
* Download the test dataset using the following command:
```
wget https://zenodo.org/record/7064308/files/test.tar.gz?download=1 -O test.tar.gz
```
* Extract the test dataset using the following command:
```
tar -xzvf test.tar.gz
```
* Download the CMIP6 datasets using the following comand:
```
wget https://zenodo.org/record/7064308/files/CMIP6.zip?download=1 -O CMIP6.zip
```
* Extract the CMIP6 datasets using the following command:
```
unzip CMIP6.zip
```
* In case unzip is not present in the environment use the following command to install it:
```
sudo apt-get install unzip
```


After doing all the operatins finally the emulator notebooks present in the baseline_models folder can be run and their outputs can be used to run the notebooks present in the analysis_notebooks.
