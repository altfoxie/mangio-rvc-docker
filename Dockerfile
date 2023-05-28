FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel

# ngrok
RUN apt update && apt install -y curl && curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install -y ngrok

COPY ./mangio /workspace/mangio
WORKDIR /workspace/mangio

RUN make install && make basev1 && make basev2

WORKDIR /workspace