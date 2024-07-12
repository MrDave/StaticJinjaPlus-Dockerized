FROM python:3.12-slim

WORKDIR /opt/StaticJinjaPlus
ADD --checksum=sha256:30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz /tmp/app.tar.gz
RUN tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/StaticJinjaPlus && rm /tmp/app.tar.gz

RUN pip install -r requirements.txt --no-cache-dir
ENTRYPOINT ["python3", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]