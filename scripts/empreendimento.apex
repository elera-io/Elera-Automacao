final List<String> NOMES = new List<String> {
    'Super Mario Bros', 'Super Mario Bros 3', 'Super Mario World', 'Super Mario 64', 
    'Super Mario Galaxy', 'Super Mario Odyssey', 'Donkey Kong', 'Pac-Man', 'Space Invaders', 
    'Asteroids', 'Pong', 'Tetris', 'Street Fighter II', 'Galaga', 'Contra', 'Metroid', 
    'The Legend of Zelda', 'Sonic the Hedgehog', 'Mega Man', 'Frogger', 'Dig Dug', 'Centipede', 
    'Battlezone', 'Pitfall!', 'Dragons Lair', 'Missile Command', 'Castlevania', 'Double Dragon', 
    'Gradius', 'Kid Icarus', 'Ice Climber', 'Punch-Out!!', 'Star Wars (Arcade)', 'Ghosts n Goblins', 
    'Kung Fu Master', 'Astro Blaster', 'Berzerk', 'Defender'
};
  


final List<String> NOMES_UNIDADE = new List<String> {
    'Mario', 'Luigi', 'Princess Peach', 'Bowser', 'Yoshi', 'Toad', 'Donkey Kong', 
    'Wario', 'Waluigi', 'Princess Daisy', 'Lakitu', 'Koopa Troopa', 'Goomba', 
    'Shy Guy', 'Boo', 'Chain Chomp', 'Thwomp', 'Piranha Plant', 'Toadette', 
    'King Boo', 'Kamek', 'Fawful', 'Birdo', 'Poochy', 'Hammer Bro', 'Monty Mole', 
    'Diddy Kong', 'Rosalina', 'Luma', 'Baby Mario', 'Baby Luigi', 'Funky Kong', 
    'Kong (from Donkey Kong)', 'Petey Piranha', 'Birdo'
  };
  


final List<String> STATUS_PERMITIDOS = new List<String> {
    'Assinado','Bloqueado','Em Assinatura','Em Cessão',
    'Em Distrato','Livre','Reservado','Repassado'
};


final List<String> STATUS_UNIDADE = new List<String>{
    'Assinado','Bloqueado','Em Assinatura',
    'Em Cessão','Em Distrato','Escriturado',
    'Livre','Novo','Reservado','Repassado'
};


final List<String> TIPOS_VENDA_PERMITIDOS = new List<String>{
    'Tabela Direta',
    'Financiamento - Repasse Imediato'
};


final List<String> TIPOS_CONDICAO_COMISSIONAMENTO = new List<String>{
    'Adimplência Premiada', 'Desconto Comercial', 'Financiamento',
    'FGTS', 'Recursos Próprios (Mensais PR)', 'Recursos Próprios (Par. Balão)',
    'Sinal', 'Sinal (Cartão de Crédito)', 'Terreno', 'Financiamento Chave',
    'MENSAL'
};
/** @param USUARIO default: seu userId
 */
String USUARIO;
/** @param CONSTRUTORA ::: Obrigatório, mude para uma account do tipo Pessoa Jurídica
 */
final String CONSTRUTORA = '001HZ00000PU9HWYA1';
/** @param PROGRAMA_HABITACIONAL = "Sim"  ou "Não" */
final String PROGRAMA_HABITACIONAL = 'Não';
final Date DATA_ENTREGA_OBRA = Date.newInstance(2026, 01, 01);
final Date DATA_ENTREGA_CHAVES = Date.newInstance(2026, 02, 02);
final String NOME = NOMES[Math.floor(Math.random() * NOMES.size()).intValue()];
/** @param ESTAGIO_OBRA = 
 * "Em Construção"
 * "Entregue"
 * "Lançamento"
 * "Pré Lançamento" */
final String ESTAGIO_OBRA = 'Pré Lançamento';
final String ESTADO = 'ELERA';
final String MUNICIPIO = 'Teste Atualização'; 
Double codigoSienge = Math.floor(Math.random() * 100);

cbns__Empreendimento__c empreendimento = 
    new cbns__Empreendimento__c(
        Name = NOME,
        CodigoSienge__c = codigoSienge,
        cbns__Construtora__c = CONSTRUTORA,
        cbns__CoordenadorGerenteComercial__c = USUARIO ?? UserInfo.getUserId(),
        Gerente_Executivo__c = USUARIO ?? UserInfo.getUserId(),
        cbns__GerenteProduto__c = USUARIO ?? UserInfo.getUserId(),
        ProgramaHabitacional__c = PROGRAMA_HABITACIONAL,
        cbns__DataEntregaObra__c = DATA_ENTREGA_OBRA,
        cbns__DataPrevistaLiberacaoChavesCliente__c = DATA_ENTREGA_CHAVES,
        cbns__StatusPermitidosUnidade__c = String.join(STATUS_PERMITIDOS, ';'),
        cbns__TiposVendaPermitidosProposta__c = String.join(TIPOS_VENDA_PERMITIDOS, ';'),
        TiposCondicaoComissionamento__c = String.join(TIPOS_CONDICAO_COMISSIONAMENTO, ';'),
        cbns__Estado__c = ESTADO,
        cbns__EstagioObra__c = ESTAGIO_OBRA,
        cbns__Municipio__c = MUNICIPIO
    );

System.debug(empreendimento.cbns__StatusPermitidosUnidade__c);

try {
    INSERT empreendimento;
} catch (Exception ex) {
    System.debug(ex.getMessage());
}

cbns__TipoUnidade__c tipoUnidade = new cbns__TipoUnidade__c(
    Name =  'Unidade padrão',
    cbns__AreaComum__c = 100.000,
    cbns__AreaJardim__c = 100.000,
    cbns__AreaPrivativaCoberta__c = 100.00,
    cbns__AreaPrivativaDescoberta__c = 100.00,
    cbns__AreaPrivativaTotal__c =  200.00,
    cbns__AreaTotal__c = 400.00,
    cbns__Banheiros__c = 2,
    cbns__Dormitorios__c = 2,
    cbns__Empreendimento__c = empreendimento.Id,
    cbns__Escritorios__c = 1,
    cbns__Suites__c = 2,
    cbns__TipoRegistroUnidade__c = 'Apartamento',
    cbns__UnidadeEmEstoque__c = 'Livre'
);

try {
    INSERT tipoUnidade;
} catch (Exception ex) {
    System.debug(ex.getMessage());
}

List<cbns__Unidade__c> unidades = new List<cbns__Unidade__c>();

for (Integer i = 0; i < 20; i++) {
    
    final String STATUS = STATUS_UNIDADE[Math.floor(
                Math.random() * STATUS_UNIDADE.size()
                ).intValue()];

    final String NOME = NOMES_UNIDADE[Math.floor(
                Math.random() * NOMES_UNIDADE.size()
                ).intValue()];
    
    unidades.add(
        new cbns__Unidade__c (
            Name = NOME,
            cbns__Empreendimento__c = empreendimento.Id,
            cbns__Status__c = STATUS,
            cbns__MotivoBloqueio__c = STATUS == 'Bloqueado' ? 'Não atende' : '',
            cbns__TipoUnidadeEmpreendimento__c = tipoUnidade.Id,
            cbns__AreaTerreno__c = 100.0
        )
    );
}
// Para reforçar que ao menos uma unidade tem o status livre
unidades[0].cbns__Status__c = 'Livre';
try {
    INSERT unidades;
} catch (Exception ex) {
    System.debug(ex.getMessage());
}

System.debug('ID EMPREENDIMENTO :::' + '{' + empreendimento.Id + '}');
