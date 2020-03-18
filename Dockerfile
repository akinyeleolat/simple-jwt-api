FROM python:stretch


# Create app directory
RUN mkdir /main
COPY . /main
WORKDIR /main
COPY requirements.txt .

# install app dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pytest test_main.py

COPY . .

EXPOSE 8080
ENTRYPOINT ["python", "main.py"]
CMD ["gunicorn", "--bind", ":8080", "main:APP"]