FROM ubuntu:24.04

WORKDIR /opt/StaticJinjaPlus
RUN apt update && apt install -y python3 python3-pip python3.12-venv && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus.git /opt/StaticJinjaPlus
RUN python3 -m venv venv && \
    venv/bin/pip install -r requirements.txt --no-cache-dir

ENTRYPOINT ["venv/bin/python", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]