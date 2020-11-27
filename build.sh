rm -rf out/
mkdir out/

cp *.lua out/
cp -r gfx out/

pushd out
     zip -9 -r PutLitterInItsPlace.love .
popd

rm -rf *.zip*

function build_macos {
    rm -rf *.app*
    wget https://github.com/love2d/love/releases/download/11.3/love-11.3-macos.zip
    unzip love-11.3-macos.zip
    cp love.app PutLitterInItsPlace.app
    mv ./out/PutLitterInItsPlace.love PutLitterInItsPlace.app/Contents/Resources/
    yes | cp ./static/Info.plist PutLitterInItsPlace.app/Contents/

    zip -r PutLitterInItsPlace_macos.zip PutLitterInItsPlace.app

}

function build_windows {
    rm *.exe*
    rm -rf love-11.3-win64
    wget https://github.com/love2d/love/releases/download/11.3/love-11.3-win64.zip
    unzip love-11.3-win64.zip
    mkdir PutLitterInItsPlace_win64
    pushd love-11.3-win64
        cat love.exe ../out/PutLitterInItsPlace.love > ../PutLitterInItsPlace_win64/PutLitterInItsPlace.exe
        cp *.dll ../PutLitterInItsPlace_win64
        cp ./license.txt ../PutLitterInItsPlace_win64/
    popd
    zip -r PutLitterInItsPlace_win64.zip PutLitterInItsPlace_win64
}

if [[ $* == *--macOs* ]]
then
    build_macos
fi

if [[ $* == *--win* ]]
then
    build_windows
fi
