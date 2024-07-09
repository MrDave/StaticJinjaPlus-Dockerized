# StaticJinjaPlus Dockerized
Docker images for running [StaticJinjaPlus](https://github.com/MrDave/StaticJinjaPlus) from within a container.

## How to use
For each version of StaticJinjaPlus there is an image based on `ubuntu` and `python:3.12-slim` images. Use slim versions as the more lightweight option.

### Supported tags
`latest-ubuntu`, `latest` - latest build based on `ubuntu` image.  
`0.1.1-ubuntu`  
`0.1.0-ubuntu`  
`latest-slim` - latest build based on `python:3.12-slim` image
`0.1.1-slim`  
`0.1.0-slim`

### Running containers
For the easiest use, run container from path containing `templates` folder with Jinja templates.

Example folder tree:
```
$ tree
.
└── templates
    ├── assets
    │   ├── css
    │   │   └── style.css
    │   └── script.js
    ├── _base.html
    ├── _footer.html
    ├── _header.html
    └── index.html

4 directories, 6 files
```

Run the desired image (in this example it is `latest`) with a volume providing the templates (which will also be the place of StaticJinjaPlus's output)
```sh
docker run -v <path to src folder>:/opt/StaticJinjaPlus/src --name sjplus --rm mrdave95/static-jinja-plus:latest
```

If running from source folder (the one containing `templates/`) as recommended use `"$(pwd)"` for the path:
```sh
docker run -v "$(pwd)":/opt/StaticJinjaPlus/src --name sjplus --rm mrdave95/static-jinja-plus:latest
```

After running, `build` folder will appear in source folder:

```
$ tree
.
├── build
│   ├── assets
│   │   ├── css
│   │   │   └── style.css
│   │   └── script.js
│   └── index.html
└── templates
    ├── assets
    │   ├── css
    │   │   └── style.css
    │   └── script.js
    ├── _base.html
    ├── _footer.html
    ├── _header.html
    └── index.html

7 directories, 9 files
```

### Example templates
To quickly see StaticJinjaPlus container in use, run the following to see it build example templates:
```sh
docker run -v "$(pwd)":/opt/StaticJinjaPlus/src --name sjplus --rm mrdave95/static-jinja-plus --srcpath src/templates_example --outpath src/build
```

### StaticJinjaPlus arguments

StaticJinjaPlus supports optional arguments:
- `--srcpath <volume>/<templates_folder_path>/` - alternate path to templates folder inside the container. Default: `src/templates`.
- `--outpath <volume>/<build_folder>/` - alernate build output path. Default: `src/build`.

Note that it is not recommended to change paths as the path must be specified as from inside the container and include volume folder (`src` by default) e.g. `/opt/StaticJinjaPlus/src/more_templates/`.

### Watching for changes

StaticJinjaPlus supports `-w` or `--watch` argument to watch for changes in templates and re-render them.

Due to specifics of StaticJinjaPlus and Dockerfile, if `-w` is specified, `--srcpath` and `--outpath` have to be specified too.

```sh
docker run -v "$(pwd)":/opt/StaticJinjaPlus/src --name sjplus --rm mrdave95/static-jinja-plus -w --srcpath src/templates --outpath src/build
```

## Building custom images

For each version of the image there is a respective Dockerfile (e.g. `/latest/ubuntu/Dockerfile` for `latest-ubuntu` image or `/0.1.1/python-slim/Dockerfile` for `0.1.1-slim`). To build an image from any of those run `docker build` from respective folder or specify a Dockerfile if run from elsewhere:

```sh
docker build -f latest/python-slim/Dockerfile .
```

## Pulling images

To check for image updates and/or to download the latest image release use `docker pull`:
```sh
docker pull mrdave95/static-jinja-plus:latest  # or other tag
```

Example results:

```
$ docker pull mrdave95/static-jinja-plus  # local image is up to date
Using default tag: latest
latest: Pulling from mrdave95/static-jinja-plus
Digest: sha256:9a3cc7272decd44b0c3c4ec47b65835fd397e77277bc661a04cdbd28f873282b
Status: Image is up to date for mrdave95/static-jinja-plus:latest
docker.io/mrdave95/static-jinja-plus:latest

$ docker pull mrdave95/static-jinja-plus  # local image was not up to date 
Using default tag: latest
latest: Pulling from mrdave95/static-jinja-plus
Digest: sha256:9a3cc7272decd44b0c3c4ec47b65835fd397e77277bc661a04cdbd28f873282b
Status: Downloaded newer image for mrdave95/static-jinja-plus:latest
docker.io/library/mrdave95/static-jinja-plus:latest
```
