#!/bin/bash

#this script is for setting up myelocare project on windows using wsl2 - cuda - pytorch


# >> prerequisites

    #install wsl through followin commands
    #wsl --install -d Ubuntu
    #after installing wsl, open ubuntu and run the following commands (or this script)
    #make sure to install the latest nvidia drivers for windows from nvidia website




# windows terminal commands

# =========================================================

#wsl --install -d Ubuntu

#code -install-extension ms-vscode-remote.remote-wsl


# ==========================================================





sudo apt update -y
sudo apt upgrade -y

echo "y"
#install cuda dependencies
sudo apt install gcc g++ build-essential

#install python
sudo apt install python3 -y

#install cuda toolkit
sudo apt install nvidia-cuda-toolkit -y

#install pip
sudo apt install python3-pip -y

#install python venv
sudo apt install -y python3-venv

mkdir -p ~/myelocare
cd ~/myelocare

#create a virtual environment for the project
python3 -m venv myelocare_env

#activate the virtual environment
source myelocare_env/bin/activate

#install pytorch with cuda support
pip3 install torch torchvision


#install lazygit
sudo apt update && sudo apt install -y curl tar && \
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f 4) && \
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz" && \
tar xf lazygit.tar.gz lazygit && \
sudo install lazygit /usr/local/bin && \
rm -f lazygit lazygit.tar.gz && \
lazygit --version

#test the setup by running a simple pytorch command
python3 -c "import torch; print(torch.cuda.is_available())"

