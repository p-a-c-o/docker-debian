FROM pl31/debian:buster
MAINTAINER Patrick Büch <dh@paco.pl31.de>

# install services
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
        python3-pip \
        jupyter-notebook jupyter-client jupyter-core \
        jupyter-nbconvert jupyter-nbformat \
        jupyter-nbextension-jupyter-js-widgets python3-ipywidgets

# install pgcontents and run it once to test dependencies
RUN apt-get -y install python3-requests python3-alembic python3-psycopg2 python3-click \
    tox python3-nose && \
    pip3 install --no-cache-dir pgcontents && \
    pgcontents --help

# runtime configuration
CMD jupyter -m notebook --no-browser --no-mathjax --ip=* --port=8888

# expose ports
EXPOSE 8888
