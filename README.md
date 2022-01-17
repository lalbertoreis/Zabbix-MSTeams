# Manual de configuração para enviar alertas do Zabbix via MS Teams

Primeiramente, devemos obter o Incoming Webhook connector e configura-lo para o seu time no MS Teams.
Acesse o MS Teams do seu computador, selecione o grupo que deseja configurar para receber os alertas.

- Clique no ... (tres pontinhos ao lado do nome) e em seguida em Connectors.

![Connectors](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Conectores.png)

- Procure pelo conector Incoming Webhook e Clique em Adicionar.

![Webhook](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Webhook.png)

- Após adicionado, será necessário pesquisar novamente o conector e clicar em configurar.

![WebhookConfigurar](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/WebhookConfigurar.png)

- Atribua um nome para o mesmo para facilitar de onde está vindo as mensagens. Ex: Zabbix
- Atribua uma imagem de avatar para o conector para facilitar.
- Clique em Criar.

![CriarConector](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Criar%20Conector.png)

Será gerado uma URL do seu Conector Webhook, salve essa URL que usaremos em breve.
- Clique em Concluido para concluir.

![ConectorURL](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/URL%20Webhook.png)

Agora na parte de configuração do Zabbix, devemos copiar o arquivo msteams_alerts.sh para o diretório de alertscripts do seu zabbix.
Normalmente ele fica localizado no caminho: /usr/lib/zabbix/alertscripts

Lembre-se de atibuir permissão de execução para o arquivo (chmod 755 msteams_alerts.sh)

Neste arquivo possui comentado o que cada parametro faz e onde pode ser modificado.

Após copiar o arquivo para seu Zabbix, devemos acessar o FrontEnd para configurar o Tipo de Mídias para o envio da Ação.

Acesse o menu Administração > Tipo de Mídias
- Clique no botão "Criar tipo de mídia"
- Selecione o tipo de midia "Script"
- No Nome coloque um de fácil identificação. Ex: MS Teams
- Em Nome Script, coloque o nome do arquivo que você colocou na sua pasta do Alertscripts do Zabbix. Ex: msteams_alerts.sh
- No Parâmetros do script, adicione 3 linhas:
    - Na primeira adicione: {ALERT.SENDTO}
    - Na segunda adicione: {ALERT.SUBJECT}
    - Na terceira adicione: {ALERT.MESSAGE}
- Clique em Adicionar para adicionar o tipo de mídia cirado.

![ConfiguracaoZabbix](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Configura%C3%A7%C3%A3oZabbix.png)

Agora que temos o tipo de mídia configurado, devemos atribuir a URL do Webhook do MS Teams para um usuário no seu Zabbix que receberá esses alertas.

- Acesse o menu Administração > Usuários
- Clique em "Criar usuário"
- No Apelido, você pode colocar um de fácil entendimento. Ex: MS Teams
- Em Nome, coloque sua preferencia. Ex: MS
- Em Sobrenome, coloque sua preferencia. Ex: Teams
- Atribua o grupo de permissão que desejar
- Digite uma senha
- Clique em atualizar

![ConfiguracaoZabbixUsuario](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Configura%C3%A7%C3%A3o%20Zabbix%20Usuario.png)

Agora devemos acessar a aba Mídia do usuário e atribuir a URL do Webhook do MS Teams para receber os alertas.
- Clique em Adicionar
- No Tipo, selecione a Mídia MS Teams que criamos.
- Em Enviar Para, coloque a URL do Webhook. Ex: https://outlook.office.com/webhook/xxxxx
- Selecionar as severidades de acordo com o seu ambiente
- Clique em Adicionar para adicionar a mídia ao usuário
- Clique em Adicionar para atualizar o usuário

![ConfiguracaoZabbixUsuarioMidia](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Configura%C3%A7%C3%A3o%20Zabbix%20Usu%C3%A1rio%20Midia.png)

Agora que temos o tipo de mídia configurado e o usuário criado para receber os alertas, podemos configurar a Ação como qualquer outra.
Vale alertar que o script modelo, publicado aqui, utiliza o Assunto Padrão PROBLEMA/RESOLVIDO para diferenciar a cor, caso dejese algo diferente, será necessário modificar o script.

![ActionOperation](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Configura%C3%A7%C3%A3o%20Zabbix%20A%C3%A7%C3%A3o%20Opera%C3%A7%C3%A3o.png)

![RecoverOperation](https://github.com/lalbertoreis/Zabbix-MSTeams/blob/main/img/Configura%C3%A7%C3%A3o%20Zabbix%20A%C3%A7%C3%A3o%20Opera%C3%A7%C3%A3o%20de%20Recupera%C3%A7%C3%A3o.png)

Espero que este manual seja util para você e que traga valor para seus projetos.

Luiz Alberto Reis

<div> 
    
  <a href = "mailto:luizalbertonreis@gmail.com"><img src="https://img.shields.io/badge/-Gmail-%23333?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
  <a href="https://www.linkedin.com/in/luiz-alberto-reis-47807a128" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"></a>  
    
</div>
