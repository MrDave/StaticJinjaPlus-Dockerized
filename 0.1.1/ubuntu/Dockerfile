FROM ubuntu:24.04

ADD --checksum=sha256:30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz /tmp/app.tar.gz
RUN mkdir /opt/StaticJinjaPlus && tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/StaticJinjaPlus && rm /tmp/app.tar.gz
RUN apt update && apt install -y python3 python3-pip python3.12-venv && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/StaticJinjaPlus
RUN python3 -m venv venv && \
    venv/bin/pip install -r requirements.txt --no-cache-dir

ENTRYPOINT ["venv/bin/python", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]