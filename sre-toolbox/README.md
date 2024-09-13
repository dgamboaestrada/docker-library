# Docker Library
## Description
Create an ubuntu image with some tools for SRE/DevOps tools.
- zip
- htop
- git
- zsh + oh-my-zsh
- curl
- wget
- vim
- tmux
- net-tools
- python3
- python3-pip
- bat
- jq
- mysql-client
- NVM
- Pyenv
- Pipenv
- Docker
- Docker Compose
- AWS CLI
- Terraform (TFSwitch)
- AWS SAM CLI
- Ansible (2.9)
- trans (translate-shell)

## Build
To build the image, you can run the following command:
```bash
docker build -t jefecito/sre-toolbox .
docker build -t jefecito/sre-toolbox:ubuntu-24.04 .
```

## Push
To push the image to Docker Hub, you can run the following command:
```bash
docker push jefecito/sre-toolbox:latest
```

## Usage
To use the image, you can pull it from Docker Hub:
```bash
docker pull jefecito/sre-toolbox:latest
```

Then, you can run the image:
```bash
docker run -it jefecito/sre-toolbox:latest
```

To name the container, you can run the following command:
```bash
docker run -it --name workspace jefecito/sre-toolbox
```

To remove the container after it stops, you can run the following command:
```bash
docker run -it --rm --name workspace jefecito/sre-toolbox
```

To mount the current directory to the container, you can run the following command:
```bash
docker run -it -v $(pwd):/workspace --name workspace jefecito/sre-toolbox
```
To mount docker.sock to the container, you can run the following command (docker in docker):
```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock --name workspace jefecito/sre-toolbox
```

To remove the container, you can run the following command:
```bash
docker rm workspace
```

To remove the image, you can run the following command:
```bash
docker rmi jefecito/sre-toolbox
```
