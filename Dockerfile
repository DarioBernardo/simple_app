# This is a sample Dockerfile you can modify to deploy your own app based on face_recognition

FROM python:3.7-slim

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    wget \
    curl \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

ENV APP_HOME /app/
WORKDIR $APP_HOME
COPY . .
RUN pip3 install -r requirements.txt

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 web_app:app