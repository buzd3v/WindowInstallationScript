Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
iwr -useb get.scoop.sh | iex

echo "install c++ devkit"
scoop install gcc 
scoop install gdb 
scoop install g++ 
scoop install clangd 
scoop install clang-format


echo "install python3, clang format"
scoop install python
pip install clang-format


echo "install required apps: git, vscode"
echo "Vscode"
scoop install git
scoop bucket add extras
scoop install vscode


echo "install jdk"
winget install EclipseAdoptium.Temurin.21.JDK