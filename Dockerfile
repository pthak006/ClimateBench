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

# Download and extract datasets
RUN wget https://zenodo.org/record/7064308/files/train_val.tar.gz?download=1 -O train_val.tar.gz && \
    tar -xzvf train_val.tar.gz && \
    wget https://zenodo.org/record/7064308/files/test.tar.gz?download=1 -O test.tar.gz && \
    tar -xzvf test.tar.gz && \
    wget https://zenodo.org/record/7064308/files/CMIP6.zip?download=1 -O CMIP6.zip && \
    unzip CMIP6.zip

# Create and set appropriate permissions for the output directory
RUN mkdir -p /ClimateBench/baseline_models/output_path && \
    chmod -R 777 /ClimateBench/baseline_models/output_path

# Create a non-root user 'myuser' with no password
# 'myuser' will be used to run commands inside the container
RUN useradd -m myuser

# Switch to 'myuser'
USER myuser

# Set the default command to run when starting the container
# Ensure that the 'conda' environment is activated when starting the container
CMD ["conda", "run", "-n", "newenv", "/bin/bash"]
