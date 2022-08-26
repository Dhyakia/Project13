FROM python:3.10
ENV PYTHONBUFFERED 1

EXPOSE 8000

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt

CMD ["python", "manage.py", "runserver"]