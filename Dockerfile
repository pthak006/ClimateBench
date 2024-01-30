# Use Miniconda base image
FROM continuumio/miniconda3

# Update package manager and install necessary packages
RUN apt-get update && apt-get install -y wget unzip git

# Set the working directory to /ClimateBench
WORKDIR /ClimateBench

# Clone the ClimateBench repository
RUN git clone https://github.com/pthak006/ClimateBench.git .

# Copy the Conda environment file into the Docker image
COPY environment.yml .

# Create the conda environment
RUN conda env create -f environment.yml

# Activate the conda environment
SHELL ["conda", "run", "-n", "newenv", "/bin/bash", "-c"]

# Download and extract datasets
RUN wget https://zenodo.org/record/7064308/files/train_val.tar.gz?download=1 -O train_val.tar.gz && \
    tar -xzvf train_val.tar.gz && \
    wget https://zenodo.org/record/7064308/files/test.tar.gz?download=1 -O test.tar.gz && \
    tar -xzvf test.tar.gz && \
    wget https://zenodo.org/record/7064308/files/CMIP6.zip?download=1 -O CMIP6.zip && \
    unzip CMIP6.zip

# Set the default command to run when starting the container
CMD [ "conda", "run", "-n", "newenv", "/bin/bash" ]
