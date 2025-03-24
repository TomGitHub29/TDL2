FROM python:3.9

# Create a non-root user
RUN useradd -m appuser

WORKDIR /code

COPY ./setup.py /code/setup.py
COPY ./requirements.txt /code/requirements.txt
COPY ./README.md /code/README.md
COPY ./src /code/src

RUN pip install /code

COPY ./controller /code/controller

# Switch to the non-root user
USER appuser

CMD ["uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]
