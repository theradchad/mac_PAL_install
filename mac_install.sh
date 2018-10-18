#!/usr/bin/env bash

mkdir -p ~/workspace ~/Downloads

if [ ! -f /usr/local/bin/brew ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/versions
brew cask list java8 &>/dev/null || brew cask install java8
brew cask list intellij-idea-ce &>/dev/null || brew cask install intellij-idea-ce
brew cask list iterm2 &>/dev/null || brew cask install iterm2
brew list git &>/dev/null || brew install git
brew list cf-cli &>/dev/null || brew install cloudfoundry/tap/cf-cli
brew list mysql &>/dev/null || brew install mysql
brew list gradle &>/dev/null || brew install gradle
brew list flyway &>/dev/null || brew install flyway
brew list graphviz &>/dev/null || brew install graphviz
brew list rabbitmq &>/dev/null || brew install rabbitmq
brew list curl &>/dev/null || brew install curl

if [ ! -d ~/dev/tomee ]; then
    cd ~/Downloads
    wget http://repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.2/apache-tomee-7.0.2-plume.zip
    unzip apache-tomee-7.0.2-plume.zip
    mv apache-tomee-plume-7.0.2 ~/dev/tomee
fi


if [ ! -f ~/dev/minio ]; then
    cd ~/dev
    wget https://dl.minio.io/server/minio/release/linux-amd64/minio
    chmod u+x minio
fi

PATH_GREP_RESULT=`grep "/dev:" ~/.bashrc; echo $?`
if [ "$PATH_GREP_RESULT" == "1" ]; then
    echo "export PATH=\$PATH:\$HOME/dev" >> ~/.bashrc
fi
