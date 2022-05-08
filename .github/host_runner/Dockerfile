FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install python3 -y
RUN apt-get install curl -y
RUN apt-get install tar -y
RUN apt-get install wget -y

# Install Dotnet Core 3.0
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get -y update -y
RUN apt-get install -y apt-transport-https -y
RUN apt-get update -y
RUN apt-get install -y dotnet-sdk-5.0

# Copy setup_runner.sh
COPY ./setup_runner.sh /tmp/
RUN chmod +x /tmp/setup_runner.sh

# Add user
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

RUN ["/bin/bash"]