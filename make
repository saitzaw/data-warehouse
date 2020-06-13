# to install the required dependencies for python 
# Note this will useful for Ubuntu 

echo "This make will install the pyenv and create the virtualenv by in your home directory" 
echo "close your virtualenv by deactivate" 
echo "for next time please use 'source ~/data_warehouse/bin/activate'" 
echo "to activate your virtualenv" 
echo "please use this make file for one time"  

# install the git 

if [ "dpkg -l | awk '/git/ {print }' | wc -l" -eq 0]; then 
    sudo apt install git 
fi 

if [ ! -d "~/.pyenv/" ]; then 
# install required dependencies for pyenv 
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# Download the pyenv 
 curl https://pyenv.run | bash

 # insert these lines of codes in the bashrc 

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc 
ehco 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

exec "$SHELL" 

# install  python 3.8.3 
pyenv install 3.8.3 

# setup the python version 
pyenv global 3.8.3 

# create virtualenv 
# Note this will create virtualenv 

python -m venv ~/.data_warehouse 

# activate the virtualenv 
source ~/data_warehouse/bin/activate 
fi 

# install python dependencies 
pip install requirements.txt 

bash .start 