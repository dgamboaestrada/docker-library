# Pull base image
FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]

# Install packages
RUN apt update && \
  apt -y upgrade && \
  apt install -y zip htop git zsh curl wget vim tmux net-tools python3 pipx bat jq mysql-client && \
  apt install -y build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev

# Copy and installing provisioning scripts
COPY provisioning/pyenv.sh /provisioning/pyenv.sh
RUN /provisioning/pyenv.sh

COPY /provisioning/pipenv.sh /provisioning/pipenv.sh
RUN /provisioning/pipenv.sh

COPY /provisioning/oh-my-zsh.sh /provisioning/oh-my-zsh.sh
RUN /provisioning/oh-my-zsh.sh

COPY /provisioning/aws-cli.sh /provisioning/aws-cli.sh
RUN /provisioning/aws-cli.sh

COPY /provisioning/aws-sam-cli.sh /provisioning/aws-sam-cli.sh
RUN /provisioning/aws-sam-cli.sh

COPY /provisioning/tfswitch.sh /provisioning/tfswitch.sh
RUN /provisioning/tfswitch.sh

COPY /provisioning/nvm.sh /provisioning/nvm.sh
RUN /provisioning/nvm.sh

COPY /provisioning/ansible-2.9.sh /provisioning/ansible-2.9.sh
RUN /provisioning/ansible-2.9.sh

COPY /provisioning/trans.sh /provisioning/trans.sh
RUN /provisioning/trans.sh

COPY /provisioning/docker.sh /provisioning/
RUN /provisioning/docker.sh

COPY /provisioning/misc.sh /provisioning/
RUN /provisioning/misc.sh

# Copy zsh custom files
COPY /provisioning/zsh/*.zsh /root/.oh-my-zsh/custom/

# Install tmux plugins via tpm
COPY /provisioning/.tmux.conf /root/
RUN ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Set the working directory
RUN mkdir /workspace
WORKDIR /workspace

# Set the entrypoint
ENTRYPOINT ["/bin/zsh"]
