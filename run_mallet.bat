@echo off
setlocal

:build_image
echo Building the Docker image...
docker build -t mallet-docker .
goto :eof

:import_data
echo Importing data...
docker run --rm -it -v %cd%:/data mallet-docker import-dir --input /data/test-data --output /data/output.mallet --keep-sequence
goto :eof

:train_topics
echo Training topics...
docker run --rm -it -v %cd%:/data mallet-docker train-topics --input /data/output.mallet --num-topics 2 --output-topic-keys /data/topic-keys.txt --output-doc-topics /data/doc-topics.txt
goto :eof

:main
if "%1" == "build" goto build_image
if "%1" == "import" goto import_data
if "%1" == "train" goto train_topics

echo Usage: %0 {build|import|train}

:end
endlocal
