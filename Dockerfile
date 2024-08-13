# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jdk

# Set the working directory
WORKDIR /app

# Install wget, git, and ant to download and build MALLET
RUN apt-get update && apt-get install -y wget git ant

# Clone the MALLET repository
RUN git clone https://github.com/mimno/Mallet.git

# Set MALLET_HOME environment variable
ENV MALLET_HOME=/app/Mallet

# Build MALLET using Ant
RUN cd $MALLET_HOME && ant

# Add MALLET to PATH
ENV PATH=$MALLET_HOME/bin:$PATH

# Set the entry point to MALLET
ENTRYPOINT ["mallet"]
