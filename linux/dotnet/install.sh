# nginx if not install
sudo apt-get update
sudo apt-get install -y nginx

# font install
sudo apt install ttf-mscorefonts-installer
sudo apt-get install fontforge
sudo apt-get install cabextract
wget https://gist.githubusercontent.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash


# Supervisor
sudo apt-get install supervisor

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-7.0
sudo apt-get install -y dotnet-sdk-3.1
sudo apt-get install libgdiplus

dotnet publish -c Release -o publish
