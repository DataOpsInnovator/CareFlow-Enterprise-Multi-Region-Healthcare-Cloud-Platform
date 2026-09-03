FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && useradd -r -u 10001 app
COPY app.py .
USER 10001
CMD ["gunicorn","-b","0.0.0.0:8080","app:app"]
