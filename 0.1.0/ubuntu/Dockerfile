FROM ubuntu:24.04

ADD --checksum=sha256:3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444 https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.0.tar.gz /tmp/app.tar.gz
RUN mkdir /opt/StaticJinjaPlus && tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/StaticJinjaPlus && rm /tmp/app.tar.gz
RUN apt update && apt install -y python3 python3-pip python3.12-venv && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/StaticJinjaPlus
RUN python3 -m venv venv && \
    venv/bin/pip install -r requirements.txt --no-cache-dir

ENTRYPOINT ["venv/bin/python", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]