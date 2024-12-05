*** Settings ***
Resource    ../../resource/keywords/common_keywords.robot
Resource    ../../resource/keywords/Marco_Zero/keywords.robot
Test Setup    Efetuar login
Test Teardown    Close Browser

*** Test Cases ***

CT01: Validando a exibição correta das cidades
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Exibição das Cidades   ${MENU_ITENS_XPATH}      @{CIDADES_ESPERADAS}


CT02: Validando a atualização das cidades
    Dado que o usuário clique no ícone de chat
    #Ainda não sei como fazer esse teste, to vendo

CT03: Validar a ocultação de cidades com imóveis apenas no status "Repassado".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_REPASSADO}    ${MENU_ITENS_XPATH}

CT04: Validar a ocultação de cidades com imóveis apenas no status "Reservado".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_RESERVADO}    ${MENU_ITENS_XPATH}


CT05: Validar a ocultação de cidades com imóveis apenas no status "Em Distrato".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_EM_DISTRATO}    ${MENU_ITENS_XPATH}


CT06: Validar a ocultação de cidades com imóveis apenas no status "Em Cessão".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_EM_CESSAO}    ${MENU_ITENS_XPATH}


CT07: Validar a ocultação de cidades com imóveis apenas no status "Em Assinatura".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_EM_ASSINATURA}    ${MENU_ITENS_XPATH}

CT08: Validar a ocultação de cidades com imóveis apenas no status "Bloqueado".
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_BLOQUEADO}    ${MENU_ITENS_XPATH}

CT09: Validar a ocultação de cidades com imóveis apenas no status "Assinado".   
    Dado que o usuário clique no ícone de chat
    Então o bot apresenta as mensagens de boas vindas e política de privacidade
    Quando o usuário clica no botão Concordo
    Então o bot solicita o primeiro nome
    Dado que o usuário preencha o seu primeiro nome
    Então o bot solicita o sobrenome
    Dado que o usuário preencha o seu sobrenome
    Então o bot deve perguntar se o usuário já é um cliente
    Dado que o usuário clique no botão "Ainda não"
    Então o bot deve apresentar uma mensagem e exibir o menu
    Dado que o usuário escolha "Imóveis Residenciais" no menu
    Então o bot deve mostrar o menu de estados em ordem alfabetica
    Dado que o usuário escolha "ZZ" no menu
    Então o bot deve apresentar uma mensagem e exibir o menu de cidades
    Validar Ocultação de Cidades     ${STATUS_ASSINADO}    ${MENU_ITENS_XPATH}