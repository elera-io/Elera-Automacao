*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
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
TC01: lead novo
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC02: lead criado dentro de 3 meses e com status Novo
    Redefinir nome padrão    Teste    Asd Novo
    Redefinir email padrão    testezinho_novo@gmail.com
    Redefinir celular padrão    (11) 97643-9762
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC03: lead criado dentro de 3 meses e com status trabalhando
    Redefinir nome padrão    Teste    Asd Trabalhando
    Redefinir email padrão    testezinho_trabalhando@gmail.com
    Redefinir celular padrão    (11) 97643-9760
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC04: lead criado dentro de 3 meses e com status cultivando
    Redefinir nome padrão    Teste    Asd Cultivando
    Redefinir email padrão    testezinho_cultivando@gmail.com
    Redefinir celular padrão    (11) 97643-9761
    Redefinir Municipio    Bauru
    Redefinir Imóvel    BEM VIVER PALOTINA
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC05: lead criado dentro de 3 meses e com status Convertido
    Definir nome como João Pedro Silva
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Dado que, o usuário escolha horário da tarde
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC06: lead criado a mais de 3 meses e com status Reavaliação
    Redefinir nome padrão    Teste    Reavaliação
    Redefinir celular padrão    (11) 99999-8881
    Redefinir email padrão    teste_reavaliacao@gmail.com
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot deverá exibir a mensagem quando o usuário deseja comprar
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Então o bot deverá exibir a mensagem qual regime de trabalho
    Dado que, o usuário selecione CLT
    Então o bot deverá exibir a mensagem qual a renda familiar
    Dado que, o usuário selecione renda mensal de Até R$2.000
    Então o bot deverá exibir a mensagem se possui FGTS
    Dado que, o usuário não queira Financiamento com o FGTS
    Então o bot deverá exibir a mensagem se possui restrição de crédito
    Dado que, o usuário não tenha Restrição de Crédito
    Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Dado que, o usuário queira Receber Contato
    Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC07: lead criado a mais de 3 meses e com status Cancelado
    Redefinir nome padrão    Teste    Cancelado
    Redefinir celular padrão    (11) 99999-8880
    Redefinir email padrão    teste_cancelado@gmail.com
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Então o bot deverá exibir a mensagem qual regime de trabalho
    Dado que, o usuário selecione CLT
    Então o bot deverá exibir a mensagem qual a renda familiar
    Dado que, o usuário selecione renda mensal de Até R$2.000
    Então o bot deverá exibir a mensagem se possui FGTS
    Dado que, o usuário não queira Financiamento com o FGTS
    Então o bot deverá exibir a mensagem se possui restrição de crédito
    Dado que, o usuário não tenha Restrição de Crédito
    Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Dado que, o usuário queira Receber Contato
    Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC08:lead novo
    Redefinir nome padrão    Teste    Novo
    Redefinir celular padrão    (11) 99999-8884
    Redefinir email padrão    teste_novo@gmail.com
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Então o bot deverá exibir a mensagem qual regime de trabalho
    Dado que, o usuário selecione CLT
    Então o bot deverá exibir a mensagem qual a renda familiar
    Dado que, o usuário selecione renda mensal de Até R$2.000
    Então o bot deverá exibir a mensagem se possui FGTS
    Dado que, o usuário não queira Financiamento com o FGTS
    Então o bot deverá exibir a mensagem se possui restrição de crédito
    Dado que, o usuário não tenha Restrição de Crédito
    Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Dado que, o usuário queira Receber Contato
    Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC09: lead criado a mais de 3 meses e com status Convertido
    Redefinir nome padrão    Teste    Convertido
    Redefinir celular padrão    (11) 99999-8882
    Redefinir email padrão    teste_convertido@gmail.com
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Então o bot deverá exibir a mensagem qual regime de trabalho
    Dado que, o usuário selecione CLT
    Então o bot deverá exibir a mensagem qual a renda familiar
    Dado que, o usuário selecione renda mensal de Até R$2.000
    Então o bot deverá exibir a mensagem se possui FGTS
    Dado que, o usuário não queira Financiamento com o FGTS
    Então o bot deverá exibir a mensagem se possui restrição de crédito
    Dado que, o usuário não tenha Restrição de Crédito
    Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Dado que, o usuário queira Receber Contato
    Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa

TC10: lead criado a mais de 3 meses e com status Cultivando
    Redefinir nome padrão    Teste    Cultivando
    Redefinir celular padrão    (11) 99999-8883
    Redefinir email padrão    teste_cultivando@gmail.com
    Marco Zero | Ramificação ainda não é cliente | Imóveis Residenciais
    Então o bot não identifique o imóvel
    Dado que, o usuário selecione nos próximos 12 meses
    Então o bot deverá exibir a mensagem se deseja morar ou investir
    Dado que, o usuário selecione Investir
    Então o bot deverá exibir a mensagem se está trabalhando no momento
    Dado que, o usuário concorde que trabalha
    Então o bot deverá exibir a mensagem qual regime de trabalho
    Dado que, o usuário selecione CLT
    Então o bot deverá exibir a mensagem qual a renda familiar
    Dado que, o usuário selecione renda mensal de Até R$2.000
    Então o bot deverá exibir a mensagem se possui FGTS
    Dado que, o usuário não queira Financiamento com o FGTS
    Então o bot deverá exibir a mensagem se possui restrição de crédito
    Dado que, o usuário não tenha Restrição de Crédito
    Então o bot deverá exibir a mensagem de qual maneira quer receber contato
    Dado que, o usuário queira Receber Contato
    Então o bot deverá exibir a mensagem de qual horário para entrar em contato
    Dado que, o usuário escolha horário da manhã
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa