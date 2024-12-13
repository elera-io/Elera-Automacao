*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Imoveis_Residenciais/keywords.robot
Test Setup    Efetuar Login
Test Teardown    Close Browser

*** Test Cases ***

TC01:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC02:Compra de imóvel|6 meses|Morar|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC03:Compra de imóvel|12 meses|Morar|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC04:Compra de imóvel|sem previ|Morar|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC05:Compra de imóvel|3meses|Investir|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC06:Compra de imóvel|6meses|Investir|Trabalhando|CLT|até R$2.000,00|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC07:Compra de imóvel|12 meses|Investir|Trabalhando|CLT|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC08:Compra de imóvel|indefinid|Investir|Trabalhando|CLT|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC09:Compra de imóvel|indefinid|Investir|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC10:Compra de imóvel|12Meses|Investir|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC11:Compra de imóvel|3 meses|Investir|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC12:Compra de imóvel|6 meses|Investir|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC13:Compra de imóvel|12 meses|Investir|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC14:Compra de imóvel|3meses|Investir|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC15:Compra de imóvel|6meses|Investir|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC16:Compra de imóvel|12meses|Investir|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC17:Compra de imóvel|indefinid|Morar|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC18:Compra de imóvel|6meses|Morar|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC19:Compra de imóvel|12meses|Morar|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC20:Compra de imóvel|3meses|Morar|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC21:Compra de imóvel|indefinid|Morar|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC22:Compra de imóvel|12Meses|Morar|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC23:Compra de imóvel|3 meses|Morar|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho Autônomo
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC24:Compra de imóvel|6 meses|Investir|Trabalhando|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC25:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|Menor R$2.640|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda menor que R$2.640
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC26:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|menos R$4.400,0|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda menor que R$4.400,0
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC27:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|Acima R$4.400,1|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda maior que R$4.400,0
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC28:Compra de imóvel|6 meses|Morar|Trabalhando|CLT|ate R$2.640|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC29:Compra de imóvel|6 meses|Morar|Trabalhando|CLT|ate R$4.400|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda menor que R$4.400,0
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC30:Compra de imóvel|6 meses|Morar|Trabalhando|CLT|Acima R$.4.400|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda maior que R$4.400,0
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC31:Compra de imóvel|12 meses|Morar|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC32:Compra de imóvel|3meses|Investir|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC33:Compra de imóvel|6 meses|Morar|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC34:Compra de imóvel|6 meses|Investir|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC35:Compra de imóvel|3meses|Morar|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC36:Compra de imóvel|12 meses|Investir|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC37:Compra de imóvelIndefinido|Investir|sem trabalho|Com composição de renda
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead desempregado
    Imóveis residênciais | Com composição de renda
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC38:Compra de imóvel|12Meses|Morar|Trabalhando|até R$2.000|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 12 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Dado que, o usuário clique no botão "Autônomo"
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC39:Compra de imóvel|6 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 6 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC40:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC41:Compra de imóvel|sem previ|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC42:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC43:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Com restrição de crédito
    Imóveis residênciais | Restrição de R$1 a R$500
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC44:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Com restrição de crédito
    Imóveis residênciais | Restrição de R$500,1 a R$ 1.000
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC45:Lead morno | Receber contato | Manhã | sem duvidas
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Com restrição de crédito
    Imóveis residênciais | Restrição acima de R$ 1.000
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC46:Compra de imóvel|3 meses|Morar|Trabalhando|CLT|até R$2.000,00|com reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Prefere não informar a restrição
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Manhã"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC47:Lead morno | Receber contato | Tarde | sem duvidas
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Compra nos próximos 3 meses
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Com FGTS ou reserva
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Tarde"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC48:Compra de imóvel|indefinid|Investir|Trabalhando|PJ|até R$2.000|sem reserva
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Noite"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC49: Lead morno | Receber contato | Noite | sem duvidas
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Noite"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC50:Lead morno | Receber contato | qualquer horário | sem duvidas
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Qualquer horário"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que, o usuário clique no botão "Não"
    Então o bot deverá apresentar a mensagem de encerramento

TC51:Lead morno | Receber contato | qualquer horário| com duvidas
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho PJ
    Imóveis residênciais | Renda até R$ 2.000
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Receber contato do corretor
    Então o bot deverá perguntar o melhor horário para entrar em contato
    Dado que, o usuário clique no botão "Qualquer horário"
    Então o bot deverá perguntar se pode ajudar o usuário com outro assunto
    E oferecer as opções de resposta "Sim" e "Não"
    Dado que o usuário clique no botão "Sim"
    Então o bot deverá apresentar a mensagem "Sobre o que gostaria de conversar?"
    
TC52:Lead quente | Falar com corretor agora |
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Investir
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda menor que R$2.640
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Falar com o corretor agora
    #TODO Automatizar o atendimento de leads por corretores ativos

TC53:Lead quente|Falar com corretor |corretor indisponível|com outro assunto
    Marco Zero | Ramificação Ainda não é cliente
    Imóveis residênciais | Comprar imóvel
    Imóveis residênciais | Sem previsão
    Imóveis residênciais | Morar
    Imóveis residênciais | Lead empregado
    Imóveis residênciais | Regime de trabalho CLT
    Imóveis residênciais | Renda menor que R$2.640
    Imóveis residênciais | Sem FGTS
    Imóveis residênciais | Sem restrição de crédito
    Imóveis residênciais | Falar com o corretor agora

# TC54:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC55:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC56:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC57:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC58:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC59:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC60:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC61:Lead quente|Falar com corretor |Fora do horário |com outro assunto
# TC62:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC63:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC64:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC65:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC66:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC67:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC68:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC69:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC70:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC71:Lead morno|Falar com corretor |Fora do horário |com outro assunto
# TC72:Lead quente|Falar com corretor |Fora do horário |com outro assunto
