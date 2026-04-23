## Set the base image
FROM python:3.12-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y libgomp1

# Set the working directory 
WORKDIR /app

## copy the requirements file into the container
COPY requirements-dockers.txt ./


# Install the dependencies
RUN pip install -r requirements-dockers.txt

# Copy the app contents into the container
COPY app.py ./
COPY models/preprocessor.joblib ./models/preprocessor.joblib
COPY ./scripts/data_clean_utils.py ./scripts/data_clean_utils.py
COPY ./run_information.json ./ 


# Expose the part 
EXPOSE 8000

# RUN the file using command
CMD ["python" , "./app.py"]


