FROM python:3.11.1-alpine3.17

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN addgroup -g 10001 pydemo  && adduser -s /bin/false -G pydemo -u 10001 -D pydemo && chown pydemo:pydemo /usr/src/app

USER pydemo
COPY main.py .

CMD [ "python", "./main.py" ]
