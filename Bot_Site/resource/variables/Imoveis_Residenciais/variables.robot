*** Settings ***
Resource    ../Marco_Zero/variables.robot

*** Variables ***



@{UFS}    BA   MG    MT    PR    SP    ZZ
@{MENSAGEM_ESPERADA_IMOVEIS}    Selecione qual deles deseja conhecer, por favor.    Na cidade que selecionou temos esse (s) imóvel (is) aqui, icaro. 👇   A Pacaembu está presente em mais de 50 cidades, mas cada uma delas é única pra gente!

${NOME_IMOVEL}    Mirante das Flores
@{MENSAGEM_IMOVEL}    Insira seu telefone whatsapp:    Aqui na Pacaembu você tem condições exclusivas de entrada e parcelamento. 🎊😚Pra te passar mais detalhes sobre o imóvel ${NOME_IMOVEL}, vou pedir alguns dados adicionais, combinado?
${CELULAR}    (11) 99999-8888
${EMAIL}    Teste@gmail.com
${STATUS_COMBOBOX_XPATH}    xpath=//button[contains(@class,'slds-combobox__input') and contains(@class, 'slds-input_faux')]
${NOME_EMPREENDIMENTO}   Gojira  
${NOME_UNIDADE}    Teste Elera Unidade