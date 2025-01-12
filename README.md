# ClimateBench

ClimateBench is a benchmark dataset for climate model emulation inspired by [WeatherBench](https://github.com/pangeo-data/WeatherBench). It consists of NorESM2 simulation outputs with associated forcing data processed in to a consistent format from a variety of experiments performed for CMIP6. Multiple ensemble members are included where available. 

The processed training, validation and test data can be obtained from Zenodo: [10.5281/zenodo.5196512](https://doi.org/10.5281/zenodo.5196512).

The ClimateBench Paper was published in [AGU JAMES](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2021MS002954) on September 2022.

## Leaderboard

The spatial, global and total NRMSE of the different baseline emulators for the years 2080-2100 against the ClimateBench task of estimating key climate variables under future scenario SSP245. The models  are ranked in order of the mean of the total NRMSE across all tasks. 

|                  |   ('tas', 'Spatial') |   ('tas', 'Global') |   ('tas', 'Total') |   ('diurnal_temperature_range', 'Spatial') |   ('diurnal_temperature_range', 'Global') |   ('diurnal_temperature_range', 'Total') |   ('pr', 'Spatial') |   ('pr', 'Global') |   ('pr', 'Total') |   ('pr90', 'Spatial') |   ('pr90', 'Global') |   ('pr90', 'Total') |
|------------------|----------------------|---------------------|--------------------|--------------------------------------------|-------------------------------------------|------------------------------------------|---------------------|--------------------|-------------------|-----------------------|----------------------|---------------------|
| Neural Network   |             0.107294 |           0.0440271 |           0.327429 |                                    9.91735 |                                   1.37219 |                                  16.7783 |             2.1281  |           0.2093   |           3.1746  |               2.61022 |             0.345709 |             4.33876 |
| Gaussian Process |             0.109106 |           0.0738238 |           0.478225 |                                    9.20713 |                                   2.67495 |                                  22.5819 |             2.34092 |           0.341453 |           4.04818 |               2.5559  |             0.429154 |             4.70167 |
| Random Forest    |             0.107574 |           0.0584057 |           0.399602 |                                    9.19503 |                                   2.65241 |                                  22.4571 |             2.52431 |           0.502126 |           5.03494 |               2.68209 |             0.543375 |             5.39896 |


## Installation
The example scripts provided here require [ESEm](https://github.com/duncanwp/ESEm) and a few other packages. Below is the whole process of setting up the environment described for a standard Ubuntu distribution. The same can be done for other Linux variants with equivalent commands.


1.   First upgrade your Linux environment using the following command:  
```
sudo apt update
```

2.   Make sure that python3 is present in your local environment by typing the following command:
```
python3 --version
```
In case it's not available install python3 using the following command:
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

Or you can follow the following command line steps:



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
*   Make Sure the conda environment called newenv is now present in the local environment by using the following command:
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
* Download the CMIP6 datasets using the following command:
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


After doing all the operations finally the emulator notebooks present in the baseline_models folder can be run and their outputs can be used to run the notebooks present in the analysis_notebooks.



## Using Docker to Run ClimateBench

For ease of use, ClimateBench can be run using Docker, which simplifies the setup process. This method avoids the need for manual installation and configuration.

### Prerequisites
- Docker installed on your system. For installation instructions, visit the [Docker website](https://docs.docker.com/get-docker/).

### Running ClimateBench with Docker

1. **Pull the ClimateBench Docker Image**
   
   Pull the Docker image from Docker Hub using the following command:
   ```bash
   docker pull pthak006/climatebench
   ```

2. **Run the ClimateBench Docker Container**

   After pulling the image, you can start a container with the ClimateBench environment. Run:
   ```bash
   docker run -it pthak006/climatebench
   ```
   If you are running the docker container inside a remote server or a cloud infrastructure like google cloud then port forwarding is needed.In that case run the following command:
   ```bash
   ddocker run -it -p 8888:8888 --platform linux/amd64 pthak006/climatebench /bin/bash
   ```
   Sometimes you might need to run the above command with root priviledge that is with sudo prefix in order for it to work. 

   This command starts a container and provides you with an interactive terminal inside it.
   
3. **Activate the conda environment and run jupyter notebook**

   After running the image, you have to first acitvate the conda environment. Run:
   ```bash
   conda activate newenv
   ```

   After that jupyter notebook can be started. Simple command to start jupyter notebook is the following:

   ```bash
   jupyter notebbok
   ```
   However if you are running it inside a remote environment or cloud infrastructure then run the command with port forwarding and if it is run with root priviledge then add the allow-root flag. This can be acheived by running the following command:

   ```bash
   jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
   ```   

   Once jupyter client starts running copy the url link that is one starting with https:127.0.0.... and paste it in your browseer. The project can be now run inside the jupyter environment. 
4. **Accessing ClimateBench**

   Once this is done you'll have access to the ClimateBench environment with all the necessary dependencies and datasets pre-loaded. You can navigate to the `baseline_models` folder to run the emulator notebooks and use the outputs to run the notebooks present in the `analysis_notebooks` folder.
