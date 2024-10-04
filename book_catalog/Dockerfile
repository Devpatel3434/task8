FROM python:3.11-alpine

WORKDIR /book_catalog
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ ./app/
EXPOSE 9494
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "9494"]
