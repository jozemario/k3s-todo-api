FROM docker.mghcloud.com/python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 3500

CMD ["gunicorn", "--bind", "0.0.0.0:3500", "--workers", "4", "app:app"]