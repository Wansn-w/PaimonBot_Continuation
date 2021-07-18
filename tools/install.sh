#!/bin/bash
LANG=zh_CN.UTF-8

echo -E "
______     _                      ______       _   
| ___ \   (_)                     | ___ \     | |  
| |_/ /_ _ _ _ __ ___   ___  _ __ | |_/ / ___ | |_ 
|  __/ _\` | | '_ \` _ \ / _ \| '_ \| ___ \/ _ \| __|
| | | (_| | | | | | | | (_) | | | | |_/ / (_) | |_ 
\_|  \__,_|_|_| |_| |_|\___/|_| |_\____/ \___/ \__|
"

set -e

get_os() {
    command=$(uname -v)
    case "$command" in
        *"Ubuntu"*)
            echo "Ubuntu"
        ;;
        *"Centos"*)
            echo "Centos"
        ;;
        *"Debian"*)
            echo "Debian"
        ;;
        *"Deepin"*)
            echo "Deepin"
        ;;
        *"RedHat"*)
            echo "RedHat"
        ;;
        *)
            echo "Others"
        ;;
    esac
    return 0
}


install_jq() {
    if [[ $(get_os) == "Ubuntu" ]]
    then
        sudo apt-get install jq
    fi
}



test_jq() {
    {
        jq -V
    } || {
        echo 1
        return 1
    }
}


get_architecture(){
    architecture=$(uname -p)
    case "$architecture" in
        "x86_64"|"amd64"|"x64")
            echo "amd64"
        ;;
        "x86"|"i686"|"i386")
            echo "386"
        ;;
        "arm")
            echo "arm"
        ;;
        "arm64")
            echo "arm64"
        ;;
        "armv7")
            echo "armv7"
    esac
    return 0
}


get_suffix_name(){
    case "$1" in
        "Debian"|"Ubuntu"|"Deepin")
            echo ".deb"
        ;;
        "Centos"|"RedHat")
            echo ".rpm"
        ;;
        *)
            echo ".tar.gz"
        ;;
    esac
    return 0
}


test_python(){
    {
        python3 -V
    } || {
        echo 1
        return 1
    }
}


test_pip(){
    {
        pip -V
    } || {
        echo 1
        return 1
    }
}

test_git(){
    {
        git --version
    } || {
        echo 1
        return 1
    }
}

os=$(get_os)
echo "系统：$os"
if [[ $(test_jq) == 1 ]]
then
	echo "未检测到jq，将安装jq"
    sudo apt install jq
    echo "jq安装成功"
else
	jq_version=$(test_jq | cut -b 4-)
	echo "找到jq，jq版本：$jq_version"
fi

echo "开始从Github API获取最新的go-cqhttp版本"
release=$(curl -s "https://api.github.com/repos/Mrs4s/go-cqhttp/releases")
version=$(echo "$release" | jq ".[0].tag_name" | cut -b 2- | rev | cut -b 2- | rev)
echo "go-cqhttp版本：$version"

echo "下载go-cqhttp $version"
if [ ! -d "go-cqhttp" ]
then
    mkdir go-cqhttp
fi
unite_architecture=$(get_architecture)
suffix=$(get_suffix_name "$os")
number_version=$(echo "$version" | cut -b 2-)
linux_="_linux_"
wget -P go-cqhttp "https://download.fastgit.org/Mrs4s/go-cqhttp/releases/download/$version/go-cqhttp_$number_version$linux_$unite_architecture$suffix" -q --show-progress

echo "安装go-cqhttp"
sudo dpkg -i "go-cqhttp/go-cqhttp_$number_version$linux_$unite_architecture$suffix"
rm "go-cqhttp/go-cqhttp_$number_version$linux_$unite_architecture$suffix"

if [[ $(test_python) == 1 ]]
then
	echo "未检测到Python，将安装Python"
    sudo apt install python3
    sudo apt install python3-pip
    echo "Python安装成功"
else
	python_version=$(test_python | cut -b 8-)
	echo "找到Python，Python版本：$python_version"
fi
if [[ $(test_pip) == 1 ]]
then
	echo "未检测到pip，将安装pip"
    sudo apt install python3-pip
    echo "pip安装成功"
else
	pip_version=$(test_pip | cut -b 5-11)
	echo "找到pip，pip版本：$pip_version"
fi

if [[ $(test_git) == 1 ]]
then
	echo "未检测到git，将安装git"
    sudo apt install git
    echo "git安装成功"
else
	git_version=$(test_git | cut -b 13-)
	echo "找到git，git版本：$git_version"
fi

if [ -d "bot" ]
then
    rm -rf bot
fi
echo "从Github克隆PaimonBot"
git clone https://hub.fastgit.org/MingxuanGame/PaimonBot_Continuation.git bot

echo "补全Python包"
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r bot/requirements.txt

echo "配置go-cqhttp"
cd go-cqhttp
echo "开始配置，请在选择通信方式时选择3（反向 Websocket 通信），然后按回车"
go-cqhttp
cd ..

echo "替换go-cqhttp配置文件"
rm "go-cqhttp/config.yml"
cp "bot/tools/config.yml" "go-cqhttp/config.yml"

echo "配置已经完成"
echo "启动时，先切换到go-cqhttp文件夹输入go-cqhttp启动"
echo "然后回到父目录的bot文件夹，输入python3 bot.py启动PaimonBot"