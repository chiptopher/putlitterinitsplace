mkdir out/

cp *.lua out/
cp -r gfx out/

pushd out
     zip -9 -r PutLitterInItsPlace.love .
popd

wget https://github.com/love2d/love/releases/download/11.3/love-11.3-macos.zip
unzip love-11.3-macos.zip

mv love.app PutLitterInItsPlace.app
mv ./out/PutLitterInItsPlace.love PutLitterInItsPlace.app/Contents/Resources/
yes | cp ./static/Info.plist PutLitterInItsPlace.app/Contents/
