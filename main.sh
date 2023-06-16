# Clone Upstream
git clone https://github.com/pop-os/repoman
rm -rvf ./repoman/debian
cp -rvf ./debian ./repoman
cd ./repoman

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p repoman_2.2.0
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
