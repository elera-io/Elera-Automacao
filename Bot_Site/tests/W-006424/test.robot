*** Settings ***
Resource    ../../resource/keywords/Outros/keyword.robot

Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***
TC01: Outros | Lotes comerciais sem outro assunto
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Lotes comerciais" no menu
    Então o bot informa sobre os Lotes Comerciais
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa
    Stop All Video Recordings

TC02: Outros | Lotes comerciais com outro assunto
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Lotes comerciais" no menu
    Então o bot informa sobre os Lotes Comerciais
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu
    Stop All Video Recordings
  
TC03:Outros | Seja um fornecedor sem outros assuntos
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Seja um fornecedor" no menu
    Então o bot informa sobre Ser um Fornecedor
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa
    Stop All Video Recordings

TC04:Outros | Seja um fornecedor com outros assuntos
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Seja um fornecedor" no menu
    Então o bot informa sobre Ser um Fornecedor
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu
    Stop All Video Recordings

TC05:Outros | Venda sua Área sem outros assuntos
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Venda sua área" no menu
    Então o bot informa sobre Vender sua Área
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa
    Stop All Video Recordings

TC06:Outros | Venda sua Área com outros assuntos
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Venda sua área" no menu
    Então o bot informa sobre Vender sua Área
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu
    Stop All Video Recordings
  
TC07:Outros | Trabalhe conosco sem outro assunto
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Trabalhe conosco" no menu
    Então o bot informa sobre Trabalhar Conosco
    Dado que, o usuário não queira falar mais sobre outros assuntos
    Então o bot encerra a conversa
    Stop All Video Recordings

TC08:Outros | Trabalhe conosco com outro assunto
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Trabalhe conosco" no menu
    Então o bot informa sobre Trabalhar Conosco
    Dado que, o usuário queira falar mais sobre outros assuntos
    Então o bot deve apresentar uma mensagem e exibir o menu
    Stop All Video Recordings

TC09:Outros | Voltar
    Redefinir nome padrão    Teste    Asd
    Redefinir celular padrão    (11) 97643-9764
    Redefinir email padrão    testezinho@gmail.com
    Gerar evidência    W-006424
    Marco Zero | Ramificação ainda não é cliente | Outros
    Então o bot deve exibir a lista de outros assuntos
    Dado que o usuário escolha "Voltar" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu
    Stop All Video Recordings