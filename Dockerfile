FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel

# ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install -y ngrok

COPY ./mangio /workspace/mangio
WORKDIR /workspace/mangio

RUN pip install --upgrade pip && pip install -r requirements.txt && make install && make basev1 && make basev2

WORKDIR /workspace