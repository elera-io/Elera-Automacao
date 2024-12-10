*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot

Test Setup    Efetuar login
Test Teardown    Close Browser

*** Keywords ***
Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    E exibir os botões "Sim, sou" e "Ainda não"
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha o municipio
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe seu email
    
  
*** Test Cases ***
CT01:Horario de preferencia "Manhã" sem mais duvidas
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

CT02:Horario de preferencia "Tarde" sem mais duvidas
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

CT03:Horario de preferencia "Noite" sem mais duvidas
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da noite
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

CT04:Horario de preferencia "Qualquer horário" sem mais duvidas
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha qualquer horário
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

CT05:Horario de preferencia "Noite" com duvida
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da noite
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu

CT06:Horario de preferencia "Qualquer Horário" com duvida
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha qualquer horário
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu

CT07:Horario de preferencia "Tarde" com duvida
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu

CT08:Horario de preferencia "Manhã" com duvida
    Redefinir nome padrão    Teste    Asd
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot identifique o imóvel
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu