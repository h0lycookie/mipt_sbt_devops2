FROM ubuntu:latest

WORKDIR /app
COPY ./../app/. .

RUN apt-get install -y python3-pip python3-dev build-essential
RUN pip3 install --no-cache-dir --break-system-packages "fastapi[standard]"

RUN mkdir -p /app/logs && touch /app/logs/app.log

ENV APP_PORT=5252

EXPOSE 5252

CMD ["sh", "-c", "fastapi run main.py --host 0.0.0.0 --port ${APP_PORT}"]
