#!/bin/bash
# Script para encontrar o ano de nascimento;
b=1;
ano=`date | awk '{print$6}'`;
anoant=$((ano-b));
diahoje=`date | awk '{print$3}'`;
mm=`date +%m`;
mmant=$((mm - b));
mmpro=$((mm + b));
clear
echo "Digite seu nome: "
read nome
if [ -z $nome ]
then
    echo "Você não digitou seu nome."
else
echo "Digite sua idade: "
read idade
fi
echo "Digite o mês que você nasceu:"
read mes
if [ $mes -le $mmant ]
then
	echo $nome. você nasceu em $((ano-idade)).
	exit 1
elif [ $mes -gt 13 ]
then
        echo "Digite um mês válido."
	exit 1
elif [ $mes -gt $mmpro ]
then
	echo $nome, você nasceu em $((anoant-idade)).
	exit 1
else
	echo "Qual o dia que você nasceu? "
	read dia
fi
if [ $diahoje -lt $dia ]
then
	echo $nome, você nasceu em $((anoant-idade)).
	exit 1
else
	echo $nome, você nasceu em $((ano-idade)).
	exit 1

fi
