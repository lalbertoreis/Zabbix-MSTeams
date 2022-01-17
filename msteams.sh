#!/bin/bash

#######################################################################
#####           Script de alertas Zabbix para MS Teams            #####
#####                                                             #####
#####           Versao: 1.0                                       #####
#####           Autor: Luiz Reis                                  #####
#####           Github: https://github.com/lalbertoreis           #####
#####                                                             #####
#####                                                             #####
#######################################################################
#####                                                             #####
#####        Valores recebidos neste script como parametro        #####
#####                                                             #####
##### url="$1" 		(URL do Webhook do MS Teams                   #####
##### subject="$2" 	(Assunto do alerta)                           #####
##### message="$3"	(Mensagem de alerta enviada pelo Zabbix)      #####
#####                                                             #####
#######################################################################

#Parametros de envio do CURL
curlheader='-H "Content-Type: application/json"'
agent='-A "ZabbixAlertScript"'
curlmaxtime='-m 60' #Timeout em segundos


#Parametros recebidos do Zabbix
url="$1"
subject="$2"
message="$3"


# Modifica o ThemeColor da mensagem de acordo com o assunto (Resolvido = Verde, Problema = Vermelho, Diferente disso = Cinza)
recoversub='RESOLVIDO'
if [[ "$subject" =~ ${recoversub} ]]; then
        THEMECOLOR='43EA00'
elif [ "$subject" == 'PROBLEMA' ]; then
        THEMECOLOR='EA4300'
else
        THEMECOLOR='555555'
fi


## Construcao do JSON Payload e envio via POST para o URL do Webhook do MS Teams
#
# Voce pode remover o potentialAction e o que et� dentro caso n�o queira do bot�o do Zabbix
# Voc� pode alterar a URL do "abrir Zabbix para o seu Zabbix

payload=\""{
		\\\"@type\\\": \\\"MessageCard\\\",
		\\\"title\\\": \\\"${subject} \\\", 
		\\\"text\\\": \\\"${message} \\\", 
		\\\"themeColor\\\": \\\"${THEMECOLOR}\\\",
		\\\"potentialAction\\\": [
    					{
      					\\\"@type\\\": \\\"OpenUri\\\",
      					\\\"name\\\": \\\"Abrir Zabbix\\\",
      					\\\"targets\\\": [
     						{\\\"os\\\": \\\"default\\\", \\\"uri\\\": \\\"http://zabbix.nice.com.br/zabbix\\\" }
      						]
    					}
  				]
	}"\"

curldata=$(echo -d "$payload")

eval curl $curlmaxtime $curlheader $curldata $url $agent
