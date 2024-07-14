FROM python:3.12-slim

WORKDIR /opt/StaticJinjaPlus
ADD https://github.com/MrDave/StaticJinjaPlus.git /opt/StaticJinjaPlus

RUN pip install -r requirements.txt --no-cache-dir
ENTRYPOINT ["python3", "main.py"]
CMD ["--srcpath=src/templates/", "--outpath=src/build/"]