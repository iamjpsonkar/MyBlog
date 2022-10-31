# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim

# comment below for heroku
# EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
# COPY requirements.txt .
COPY requirements.txt /app/requirements.txt

# RUN python -m pip install -r requirements.txt
RUN set -ex \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# comment below for heroku
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "blog_site.wsgi"]
# use below for heroku
CMD gunicorn blog_site.wsgi --bind 0.0.0.0:$PORT 
