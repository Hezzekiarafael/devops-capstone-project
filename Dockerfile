# Gunakan base image Python yang diminta penguji
FROM python:3.9-slim

# Buat working directory
WORKDIR /app

# Salin requirements dulu
COPY requirements.txt .

# Install dependencies aplikasi
RUN pip install --no-cache-dir -r requirements.txt

# Salin semua file aplikasi ke folder /app
COPY . .

# Expose port (biasanya 8080 untuk capstone ini)
EXPOSE 8080

# Jalankan service menggunakan gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "service:app"]
