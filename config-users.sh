#!/bin/bash

set -e

clear
echo "####################################################################################"
echo "##										##"
echo "##                          Configuração de usuários				##"
echo "##										##"
echo "####################################################################################"
echo ""
echo ""
echo ""
echo "---> Crie uma senha para o root <---"
echo ""
sudo passwd  root
echo ""
echo "---> Criando o usuário do coordenandor do laboratótio <---"
echo ""
sudo adduser renato
echo ""
echo "---> Criandando o usuário do subcoordenandor do laboratótio <---"
echo ""
sudo adduser adriano
echo ""
echo "---> Adicionando o coordenandor do laboratótio ao grupo sudo <---"
echo ""
sudo adduser renato  sudo
echo ""
echo "---> Adicionando o subcoordenandor do laboratótio ao sudo <---"
echo ""
sudo adduser adriano sudo
echo ""
echo "---> Removendo o usuário aluno ao grupo sudo <---"
echo ""
sudo deluser aluno   sudo
