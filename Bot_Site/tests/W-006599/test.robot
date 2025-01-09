*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
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

*** Test Cases ***

TC01:Validando a criação dos leads
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
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

TC02:Validando a identificação de numero de celular incorreto (11) 99999-8b88
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número com letras
    Então o bot deverá exibir a mensagem de confusão

TC03:Validando a identificação dos leads criados a menos de três meses
    Redefinir nome padrão    Macieudo    Brasil Dos Santos
    Redefinir email padrão    macieudo.br@gmail.com
    Redefinir celular padrão    (12) 99723-7790
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
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
    Então é exibido a mensagem de usuário já cadastrado

TC04:Validando a identificação de numero de celular incorreto (11) 99999-88
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe um número faltando digitos
    Então o bot deverá exibir a mensagem de confusão

TC05:Validando a identificação dos leads com mais de três meses
    ${NAME}    FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email
    Redefinir nome padrão    ${NAME}    Teste
    Redefinir email padrão    ${EMAIL}
    Redefinir celular padrão    (11) 96879-1305
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
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
    Então o bot deverá exibir a mensagem quando o usuário deseja comprar

TC06:Validando a identificação de numero de celular incorreto (99) 99999-88888
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número incorreto
    Então o bot deverá exibir a mensagem de confusão

TC08:Validando a identificação de E-mails inválidos Teste@@gmail.com
        Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido com @@
    Então o bot deverá exibir a mensagem de confusão

TC09:Validando a identificação de números validos 11999998888
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email

TC11:Validando a identificação de E-mail inválidos @gmail.com
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem UserName
    Então o bot deverá exibir a mensagem de confusão

TC12:Validando a identificação de E-mail inválidos Teste@gmailcom
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem .
    Então o bot deverá exibir a mensagem de confusão

TC13:Validando a identificação de E-mail inválidos Teste@gmail.
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem .com
    Então o bot deverá exibir a mensagem de confusão

TC13:Validando a identificação de E-mail inválidos Teste@gmail
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais

    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "SP" no menu
    Então o bot deve exibir a mensagem "Agora escolha a cidade"
    Dado que o usuário escolha "Taubaté" no menu
    Então o bot deverá responder com a mensagem de imóveis disponíveis
    Dado que o usuário escolha um imóvel no menu
    Então o bot deverá responder com uma mensagem e solicitar o número de celular
    Dado que o usuário informe seu número
    Então o bot deverá solicitar seu email
    Dado que o usuário informe um email inválido sem o final .com
    Então o bot deverá exibir a mensagem de confusão