# Hello World Flask App

A simple Flask application that returns "Hello, World!" on the root route.

## Requirements

- Python 3.11+
- Docker (optional)

## Local development

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python helloworld.py
```

By default, the app listens on port `8080`.

To override the port:

```bash
PORT=9090 python helloworld.py
```

## Docker

Build the image:

```bash
docker build -t helloworld .
```

Run the container with the default port:

```bash
docker run -p 8080:8080 helloworld
```

Run the container on a custom port:

```bash
docker run -p 9090:9090 -e PORT=9090 helloworld
```

The app will be available at:

```text
http://localhost:8080
```

or:

```text
http://localhost:9090
```

## Project files

- `helloworld.py` – Flask application
- `requirements.txt` – Python dependencies
- `Dockerfile` – container definition
