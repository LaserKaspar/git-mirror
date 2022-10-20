git clone --mirror git@github.com:LaserKaspar/Snowboards.git project-clone

mkdir project-modified
cp -u -R project-clone/. project-modified

cd project-modified
git remote set-url origin --push git@gameprojects.spengergasse.at:KAS19559/5ahmng_2223_snowboards.git
