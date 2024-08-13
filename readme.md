# MALLET Docker Project

This project sets up the MALLET (Machine Learning for Language Toolkit) tool within a Docker container. It includes a basic test case to ensure that MALLET is functioning correctly after being built. Additionally, it provides scripts to simplify running MALLET commands using Docker.

## Project Structure

```
/mallet-docker-project
├── Dockerfile
├── test-data
│   ├── file1.txt
│   ├── file2.txt
│   └── file3.txt
├── run_mallet.sh
├── run_mallet.bat
└── README.md
```

- **Dockerfile**: Contains instructions for building the Docker image with MALLET installed.
- **test-data/**: Directory containing sample text files for testing MALLET.
- **run_mallet.sh**: Bash script for running Docker commands related to MALLET.
- **run_mallet.bat**: Batch script for running Docker commands related to MALLET on Windows.
- **README.md**: This documentation file.

## Getting Started

### Prerequisites

- Docker installed on your system.
- On Linux or macOS: Bash shell available.
- On Windows: Command Prompt available.

### Building the Docker Image

You can build the Docker image using the provided scripts.

#### Using Bash (Linux/macOS):

```bash
./run_mallet.sh build
```

#### Using Batch (Windows):

```cmd
run_mallet.bat build
```

This command builds the Docker image named `mallet-docker` using the instructions in the `Dockerfile`.

### Running MALLET with Test Data

After building the Docker image, you can import the test data and train a topic model using the provided scripts.

#### Importing Test Data

This command imports the text files in the `test-data` directory:

##### Using Bash (Linux/macOS):

```bash
./run_mallet.sh import
```

##### Using Batch (Windows):

```cmd
run_mallet.bat import
```

This will import the text files and output the processed data to `output.mallet`.

#### Training a Topic Model

After importing the data, you can train a simple topic model:

##### Using Bash (Linux/macOS):

```bash
./run_mallet.sh train
```

##### Using Batch (Windows):

```cmd
run_mallet.bat train
```

This command trains a topic model with 2 topics and generates the output files `topic-keys.txt` and `doc-topics.txt`.

### Verifying the Output

After running the import and train commands, the following files should appear in your project directory:

- **`output.mallet`**: The processed data file generated from the test text files.
- **`topic-keys.txt`**: Contains the top words associated with each topic.
- **`doc-topics.txt`**: Lists the proportion of each topic in each document.

Inspect these files to verify that MALLET has processed the test data correctly.

## Test Data

The `test-data` directory contains three simple text files:

- **file1.txt**:
  ```
  The quick brown fox jumps over the lazy dog.
  The dog barked at the fox.
  ```

- **file2.txt**:
  ```
  The rain in Spain falls mainly on the plain.
  The quick brown fox.
  ```

- **file3.txt**:
  ```
  In the plains of Spain, the rain falls heavily.
  The fox ran quickly.
  ```

These files are used to test the MALLET installation and ensure that the tool is functioning as expected.

## License

This project is open-source and available under the MIT License.
