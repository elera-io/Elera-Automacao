*** Settings ***
Resource    ../Marco_Zero/variables.robot

*** Variables ***

@{UFS}    BA    MG     MT    PR    SP    ZZ
@{MENSAGEM_ESPERADA_IMOVEIS}    Selecione qual deles deseja conhecer, por favor.    Na cidade que selecionou temos esse (s) imóvel (is) aqui, ${PRIMEIRO_NOME}. 👇    A Pacaembu está presente em mais de 50 cidades, mas cada uma delas é única pra gente!
${NOME_IMOVEL}    Faith No More
@{MENSAGEM_IMOVEL}    Insira seu telefone whatsapp:    Aqui na Pacaembu você tem condições exclusivas de entrada e parcelamento. 🎊😚Pra te passar mais detalhes sobre o imóvel ${NOME_IMOVEL}, vou pedir alguns dados adicionais, combinado?
${CELULAR}    (11) 99999-8888
${EMAIL}    Teste@gmail.com
${LAST_MODIFY_LEAD}    xpath= /html/body/div[4]/div[1]/section/div[1]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div[1]/div/div/table/thead/tr/th[4]/div/a/span[2]
${LEAD_NAME}    xpath=/html/body/div[4]/div[1]/section/div[1]/div[2]/div[1]/div/div/div/div/div/div/div/div[2]/div/div[1]/div[2]/div[2]/div[1]/div/div/table/tbody/tr[1]/td[4]/span/a