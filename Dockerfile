# gunicorn-flask

FROM ubuntu:12.04
MAINTAINER Daniel Riti <dmriti@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python python-pip python-virtualenv gunicorn

# Setup flask application
RUN mkdir -p /deploy/app
COPY gunicorn_config.py /deploy/gunicorn_config.py
COPY app /deploy/app
RUN pip install --index-url=https://pypi.python.org/simple/ -r /deploy/app/requirements.txt
WORKDIR /deploy/app

EXPOSE 5000

# Start gunicorn
CMD ["/usr/bin/gunicorn", "run_sample_app:app", "-b 0.0.0.0:5000"]
#CMD ["ls", "/deploy/"]
