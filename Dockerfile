FROM python:3.7-slim

RUN apt-get update \
		&& pip install --upgrade pip

WORKDIR /app
COPY ./app.py ./predict.py ./sentiment2.model.h5 ./requirements.txt /app/

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python"]
CMD ["app.py"]