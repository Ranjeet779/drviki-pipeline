# Dockerfile - production friendly (non-root)
FROM python:3.11-slim

# Create non-root user
RUN useradd --create-home appuser
WORKDIR /home/appuser
COPY requirements.txt .

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# change to non-root
 USER appuser

 ENV PORT=8080
 EXPOSE 8080

 CMD ["python", "app.py"]
 
