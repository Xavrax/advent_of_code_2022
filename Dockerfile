FROM ubuntu:22.04

# working dir
ARG DIR=/home/elf

WORKDIR $DIR

# Update and install
RUN apt-get update && apt-get install -y nasm binutils git openssh-server sudo

# Add ssh user
RUN useradd -rm -d $DIR -s /bin/bash -g root -G sudo -u 1000 elf
RUN chown elf $DIR -R

RUN echo 'elf:santa' | chpasswd

RUN service ssh start

# Clone repo
RUN git clone https://github.com/Xavrax/advent_of_code_2022.git

# Start!
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

