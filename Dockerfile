FROM ubuntu
ARG SJP_TAG="main"
RUN apt update && apt install -y python3 python3-pip python3.12-venv git

WORKDIR /opt
RUN git clone -b ${SJP_TAG} https://github.com/MrDave/StaticJinjaPlus.git
WORKDIR /opt/StaticJinjaPlus
RUN python3 -m venv venv && \
    venv/bin/pip install -r requirements.txt --no-cache-dir
ENTRYPOINT ["venv/bin/python", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]