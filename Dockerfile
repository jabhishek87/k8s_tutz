FROM python:2.7
COPY app /tmp/app
EXPOSE 5000
WORKDIR /tmp/app/
RUN pip install -r /tmp/app/requirements.txt
CMD [ "python", "app.py" ]
