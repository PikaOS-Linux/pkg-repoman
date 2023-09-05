# Clone Upstream
git clone https://github.com/PikaOS-Linux/repoman
rm -rvf ./repoman/debian
cp -rvf ./debian ./repoman
cd ./repoman

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
