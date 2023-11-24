param (
    [string]$d,
    [string]$app
)


function InstallScoop {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
    Write-Output "Scoop"
}

function InstallCppRelative {
    Write-Output "install c++ devkit"
    scoop install gcc 
    scoop install gdb 
    scoop install g++ 
    scoop install clangd 
    scoop install clang-format
    Write-Output "install python3, clang format"
    scoop install python
    pip install clang-format
    Write-Host "Done!"
    Write-Host "--------------------------------------------"
}


function InstallApps {
    Write-Output "install required apps: git, vscode"
    Write-Output "Vscode"
    scoop install git
    scoop bucket add extras
    scoop install vscode
    Write-Host "Done!"
    Write-Host "--------------------------------------------"

}

function InstallJDK {
    Write-Output "install jdk"
    winget install EclipseAdoptium.Temurin.21.JDK
    Write-Host "Done!"
    Write-Host "--------------------------------------------"
}

switch ($d) {
    "cpp" { InstallCppRelative }
    "scoop" { InstallScoop }
    "apps" { InstallApps }
    "jdk" { InstallJDK }
    "all" {
        InstallScoop
        InstallCppRelative
        InstallApps
        InstallJDK
    }
    Default {
        Write-Output "Command not existed!"
    }
}
switch ($app) {
    "spotify" {
        Write-Host "Installing spotify"
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-Expression "& { $(Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/mrpond/BlockTheSpot/master/install.ps1') } -UninstallSpotifyStoreEdition -UpdateSpotify"
        Write-Host "Done!"
        Write-Host "--------------------------------------------"
    }
    Default {
        Write-Output "Command not existed!"
    }
}