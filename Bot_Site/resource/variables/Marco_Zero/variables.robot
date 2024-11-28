*** Settings ***
Resource    ../../../resource/keywords/common_keywords.robot

*** Variables ***
${BOTOES_XPATH}    xpath=//span[contains(@class,'bBody') and contains(@class,'label')]
${MESSAGES_XPATH}    xpath=//div[contains(@class,'agent') and contains(@class,'chatMessage')]
${PRIMEIRO_NOME}    Teste
${SOBRENOME}    Elera
${NOME_COMPLETO}    ${PRIMEIRO_NOME} ${SOBRENOME}

# Cidades com imóveis apenas em status que não devem aparecer
${STATUS_REPASSADO}    Barro Alto (Repassado)
${STATUS_RESERVADO}    São Vicente do Sul (Reservado)
${STATUS_EM_DISTRATO}    Serra Dourada (Em Distrato)
${STATUS_EM_CESSAO}    Ribeirão do Norte (Em Cessão)
${STATUS_EM_ASSINATURA}    Porto Esperança (Em Assinatura)
${STATUS_BLOQUEADO}    Cachoeira das Pedras (Bloqueado)
${STATUS_ASSINADO}    Morro Verde (Assinado)



${CHAT_INPUT}    xpath=//textarea[contains(@class,'textarea') and contains(@class, 'uiInput')]
${MENU_ITENS_XPATH}    xpath=//button[contains(@class,'rich-menu-item')]
@{EXPECTED_MESSAGES}    Olá! Tudo bem? Sou a Pam, Atendente Virtual da Pacaembu, especialista no desenvolvimento de bairros planejados. 🏠Tô muito feliz em falar com você!
...    Ao seguir com o atendimento, você está concordando com a nossa Política de privacidade. Se estiver de acordo, é só clicar em "concordo".
...    Infelizmente, sem o seu aceite ao termo não posso continuar com o atendimento por aqui. 😕
...    Mas, você ainda pode ligar para a nossa Central de Relacionamento, pelo número 0800 730 2020, ou me chamar novamente dando o aceite ao termo, combinado? Um abraço da Pam ❤️