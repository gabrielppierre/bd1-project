-- Limpeza das tabelas existentes (executar na ordem inversa das dependências)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Reserva_Infra;
TRUNCATE TABLE Opera;
TRUNCATE TABLE Participa;
TRUNCATE TABLE Supervisiona;
TRUNCATE TABLE Organiza;
TRUNCATE TABLE Reserva;
TRUNCATE TABLE Patrocina;
TRUNCATE TABLE Aloca;
TRUNCATE TABLE Movimenta;
TRUNCATE TABLE Gerencia;
TRUNCATE TABLE Avalia;
TRUNCATE TABLE Apresenta;
TRUNCATE TABLE Patrocinador;
TRUNCATE TABLE Vendedor;
TRUNCATE TABLE Integrante_Maracatu;
TRUNCATE TABLE Jurado;
TRUNCATE TABLE Func_Organizador;
TRUNCATE TABLE Tecnico;
TRUNCATE TABLE Pessoa_Juridica;
TRUNCATE TABLE Pessoa_Fisica;
TRUNCATE TABLE Espaco;
TRUNCATE TABLE Grupo_Maracatu;
TRUNCATE TABLE Evento;
TRUNCATE TABLE Local;
TRUNCATE TABLE Produto;
TRUNCATE TABLE Recurso;
TRUNCATE TABLE Maquina;
TRUNCATE TABLE Barraca;
TRUNCATE TABLE Pessoa;
SET FOREIGN_KEY_CHECKS = 1;

-- inserçao de dados basicos (sem dependencias)
-- Pessoas (dados genéricos)
INSERT INTO Pessoa VALUES (1, '(81) 99845-1234', 'joao.silva@email.com');
INSERT INTO Pessoa VALUES (2, '(81) 99745-5678', 'maria.santos@email.com');
INSERT INTO Pessoa VALUES (3, '(81) 99645-9012', 'pedro.lima@email.com');
INSERT INTO Pessoa VALUES (4, '(81) 99545-3456', 'ana.oliveira@email.com');
INSERT INTO Pessoa VALUES (5, '(81) 99445-7890', 'carlos.souza@email.com');
INSERT INTO Pessoa VALUES (6, '(81) 99345-2345', 'juliana.costa@email.com');
INSERT INTO Pessoa VALUES (7, '(81) 99245-6789', 'roberto.almeida@email.com');
INSERT INTO Pessoa VALUES (8, '(81) 99145-0123', 'fernanda.pereira@email.com');
INSERT INTO Pessoa VALUES (9, '(81) 98845-4567', 'marcos.ribeiro@email.com');
INSERT INTO Pessoa VALUES (10, '(81) 98745-8901', 'patricia.goncalves@email.com');
INSERT INTO Pessoa VALUES (11, '(81) 98645-2345', 'andre.martins@email.com');
INSERT INTO Pessoa VALUES (12, '(81) 98545-6789', 'lucia.ferreira@email.com');
INSERT INTO Pessoa VALUES (13, '(81) 98445-0123', 'sergio.barbosa@email.com');
INSERT INTO Pessoa VALUES (14, '(81) 98345-4567', 'camila.dias@email.com');
INSERT INTO Pessoa VALUES (15, '(81) 98245-8901', 'fabio.cardoso@email.com');
-- Pessoas jurídicas
INSERT INTO Pessoa VALUES (16, '(81) 3421-1234', 'contato@saboresdonordeste.com.br');
INSERT INTO Pessoa VALUES (17, '(81) 3422-5678', 'contato@artemaos.com.br');
INSERT INTO Pessoa VALUES (18, '(81) 3423-9012', 'contato@usinapernambuco.com.br');
INSERT INTO Pessoa VALUES (19, '(81) 3424-3456', 'contato@cervejariapernambucana.com.br');
INSERT INTO Pessoa VALUES (20, '(81) 3425-7890', 'contato@supermercadoscomprebem.com.br');

-- Barracas
INSERT INTO Barraca VALUES (1, 'Comida Regional');
INSERT INTO Barraca VALUES (2, 'Comida Regional');
INSERT INTO Barraca VALUES (3, 'Bebidas');
INSERT INTO Barraca VALUES (4, 'Artesanato');
INSERT INTO Barraca VALUES (5, 'Artesanato');

-- Máquinas
INSERT INTO Maquina VALUES (1, 'Mesa de Som Digital 32 Canais', 'Equipamento de Som');
INSERT INTO Maquina VALUES (2, 'Sistema PA Line Array', 'Equipamento de Som');
INSERT INTO Maquina VALUES (3, 'Mesa de Iluminação DMX', 'Equipamento de Iluminação');
INSERT INTO Maquina VALUES (4, 'Moving Head LED', 'Equipamento de Iluminação');
INSERT INTO Maquina VALUES (5, 'Gerador 100kVA', 'Equipamento de Energia');

-- Recursos
INSERT INTO Recurso VALUES (1, 'Palco 10x8m', 'Estrutura');
INSERT INTO Recurso VALUES (2, 'Camarim', 'Estrutura');
INSERT INTO Recurso VALUES (3, 'Alfaia', 'Instrumento Musical');
INSERT INTO Recurso VALUES (4, 'Ganzá', 'Instrumento Musical');
INSERT INTO Recurso VALUES (5, 'Adereços de Caboclo de Lança', 'Vestimenta');

-- Produtos
INSERT INTO Produto VALUES (1, 'Cuscuz com Charque', 12.00);
INSERT INTO Produto VALUES (2, 'Tapioca Recheada', 8.00);
INSERT INTO Produto VALUES (3, 'Acarajé', 10.00);
INSERT INTO Produto VALUES (4, 'Cerveja Artesanal', 15.00);
INSERT INTO Produto VALUES (5, 'Água Mineral', 5.00);
INSERT INTO Produto VALUES (6, 'Refrigerante', 6.00);
INSERT INTO Produto VALUES (7, 'Miniatura de Caboclo de Lança', 35.00);
INSERT INTO Produto VALUES (8, 'Chapéu de Palha Decorado', 45.00);
INSERT INTO Produto VALUES (9, 'Boneco de Barro', 30.00);
INSERT INTO Produto VALUES (10, 'CD de Maracatu', 25.00);

-- Locais
INSERT INTO Local VALUES (1, 'Av. Principal', '100', 'Parque dos Lanceiros', 'Centro');
INSERT INTO Local VALUES (2, 'Rua da Cultura', '50', NULL, 'São José');
INSERT INTO Local VALUES (3, 'Praça dos Folguedos', 'S/N', NULL, 'Engenho Velho');

-- Eventos
INSERT INTO Evento VALUES (1, 'Festival Competitivo');
INSERT INTO Evento VALUES (2, 'Mostra Cultural');
INSERT INTO Evento VALUES (3, 'Encontro Formativo');

-- Grupos de Maracatu
INSERT INTO Grupo_Maracatu VALUES (1, 'Estrela Brilhante', 2001, 'Nazaré da Mata', 'Grupo tradicional fundado pelo Mestre Bi, representa as tradições do baque solto.');
INSERT INTO Grupo_Maracatu VALUES (2, 'Leão Coroado', 1998, 'Olinda', 'Grupo que mistura elementos tradicionais com inovações contemporâneas.');
INSERT INTO Grupo_Maracatu VALUES (3, 'Cambinda Brasileira', 1995, 'Triunfo', 'Destaca-se pela exuberância das fantasias e pela qualidade musical.');
INSERT INTO Grupo_Maracatu VALUES (4, 'Piaba de Ouro', 2005, 'Aliança', 'Grupo jovem que tem se destacado em festivais regionais.');
INSERT INTO Grupo_Maracatu VALUES (5, 'Porto Rico', 1990, 'Palmares', 'Um dos grupos mais antigos, mantém vivas as tradições ancestrais.');

-- Especialização de Pessoa: Pessoa Física
INSERT INTO Pessoa_Fisica VALUES (1, '123.456.789-01', 'João Silva');
INSERT INTO Pessoa_Fisica VALUES (2, '234.567.890-12', 'Maria Santos');
INSERT INTO Pessoa_Fisica VALUES (3, '345.678.901-23', 'Pedro Lima');
INSERT INTO Pessoa_Fisica VALUES (4, '456.789.012-34', 'Ana Oliveira');
INSERT INTO Pessoa_Fisica VALUES (5, '567.890.123-45', 'Carlos Souza');
INSERT INTO Pessoa_Fisica VALUES (6, '678.901.234-56', 'Juliana Costa');
INSERT INTO Pessoa_Fisica VALUES (7, '789.012.345-67', 'Roberto Almeida');
INSERT INTO Pessoa_Fisica VALUES (8, '890.123.456-78', 'Fernanda Pereira');
INSERT INTO Pessoa_Fisica VALUES (9, '901.234.567-89', 'Marcos Ribeiro');
INSERT INTO Pessoa_Fisica VALUES (10, '012.345.678-90', 'Patrícia Gonçalves');
INSERT INTO Pessoa_Fisica VALUES (11, '123.456.789-02', 'André Martins');
INSERT INTO Pessoa_Fisica VALUES (12, '234.567.890-13', 'Lúcia Ferreira');
INSERT INTO Pessoa_Fisica VALUES (13, '345.678.901-24', 'Sérgio Barbosa');
INSERT INTO Pessoa_Fisica VALUES (14, '456.789.012-35', 'Camila Dias');
INSERT INTO Pessoa_Fisica VALUES (15, '567.890.123-46', 'Fábio Cardoso');

-- Especialização de Pessoa: Pessoa Jurídica
INSERT INTO Pessoa_Juridica VALUES (16, '12.345.678/0001-90', 'Sabores do Nordeste Alimentação LTDA');
INSERT INTO Pessoa_Juridica VALUES (17, '23.456.789/0001-01', 'ArteMãos Artesanato LTDA');
INSERT INTO Pessoa_Juridica VALUES (18, '34.567.890/0001-12', 'Usina Pernambuco S.A.');
INSERT INTO Pessoa_Juridica VALUES (19, '45.678.901/0001-23', 'Cervejaria Pernambucana LTDA');
INSERT INTO Pessoa_Juridica VALUES (20, '56.789.012/0001-34', 'Supermercados Compre Bem S.A.');

-- Especializações específicas de Pessoa Física
-- Técnicos
INSERT INTO Tecnico VALUES (1, 'Som');
INSERT INTO Tecnico VALUES (2, 'Iluminação');
INSERT INTO Tecnico VALUES (3, 'Montagem de Palco');

-- Funcionários Organizadores
INSERT INTO Func_Organizador VALUES (4, 'Coordenadora Artística', 'Programação');
INSERT INTO Func_Organizador VALUES (5, 'Diretor Financeiro', 'Financeiro');
INSERT INTO Func_Organizador VALUES (6, 'Gerente de Logística', 'Operações');
INSERT INTO Func_Organizador VALUES (7, 'Coordenador de Infraestrutura', 'Operações');
INSERT INTO Func_Organizador VALUES (8, 'Assistente de Produção', 'Programação');

-- Jurados
INSERT INTO Jurado VALUES (9, 'Percussão', 'Conservatório Pernambucano de Música');
INSERT INTO Jurado VALUES (10, 'Dança', 'Escola de Dança do Recife');
INSERT INTO Jurado VALUES (11, 'Figurino', 'Universidade Federal de Pernambuco');

-- Integrantes de Maracatu
INSERT INTO Integrante_Maracatu VALUES (12, 'Mestre');
INSERT INTO Integrante_Maracatu VALUES (13, 'Caboclo de Lança');
INSERT INTO Integrante_Maracatu VALUES (14, 'Dama do Paço');
INSERT INTO Integrante_Maracatu VALUES (15, 'Porta-Estandarte');

-- Especializações de Pessoa Jurídica
INSERT INTO Vendedor VALUES (16, '123456-PE');
INSERT INTO Vendedor VALUES (17, '234567-PE');

INSERT INTO Patrocinador VALUES (18, 'Exposição da marca nos materiais promocionais e palco');
INSERT INTO Patrocinador VALUES (19, 'Fornecimento exclusivo de bebidas e naming rights do palco principal');
INSERT INTO Patrocinador VALUES (20, 'Barraca promocional e distribuição de brindes');

-- Espaços dentro dos locais
INSERT INTO Espaco VALUES (1, 'Palco Principal', -8.120000, -35.310000);
INSERT INTO Espaco VALUES (1, 'Área de Alimentação', -8.120100, -35.310100);
INSERT INTO Espaco VALUES (1, 'Área de Artesanato', -8.120200, -35.310200);
INSERT INTO Espaco VALUES (2, 'Auditório', -8.130000, -35.320000);
INSERT INTO Espaco VALUES (3, 'Centro da Praça', -8.140000, -35.330000);

-- Tabelas de relacionamentos
-- Apresentações dos grupos em eventos
INSERT INTO Apresenta VALUES (1, 1, 1, 45.0);
INSERT INTO Apresenta VALUES (1, 2, 2, 40.0);
INSERT INTO Apresenta VALUES (1, 3, 3, 50.0);
INSERT INTO Apresenta VALUES (2, 4, 1, 35.0);
INSERT INTO Apresenta VALUES (2, 5, 2, 40.0);
INSERT INTO Apresenta VALUES (3, 1, 1, 30.0);

-- Avaliações dos jurados
INSERT INTO Avalia VALUES (1, 1, 1, 9, 9.5);
INSERT INTO Avalia VALUES (1, 1, 1, 10, 9.0);
INSERT INTO Avalia VALUES (1, 1, 1, 11, 9.7);
INSERT INTO Avalia VALUES (1, 2, 2, 9, 8.5);
INSERT INTO Avalia VALUES (1, 2, 2, 10, 9.2);
INSERT INTO Avalia VALUES (1, 2, 2, 11, 8.8);
INSERT INTO Avalia VALUES (1, 3, 3, 9, 9.8);
INSERT INTO Avalia VALUES (1, 3, 3, 10, 9.5);
INSERT INTO Avalia VALUES (1, 3, 3, 11, 9.6);

-- Gerenciamento de barracas
INSERT INTO Gerencia VALUES (16, 1);
INSERT INTO Gerencia VALUES (16, 2);
INSERT INTO Gerencia VALUES (16, 3);
INSERT INTO Gerencia VALUES (17, 4);
INSERT INTO Gerencia VALUES (17, 5);

-- Movimentação de produtos
-- Abastecimento
INSERT INTO Movimenta VALUES (1, 1, '2023-11-20 08:00:00', 'ABASTECIMENTO', 50);
INSERT INTO Movimenta VALUES (1, 2, '2023-11-20 08:30:00', 'ABASTECIMENTO', 70);
INSERT INTO Movimenta VALUES (2, 3, '2023-11-20 09:00:00', 'ABASTECIMENTO', 60);
INSERT INTO Movimenta VALUES (3, 4, '2023-11-20 09:30:00', 'ABASTECIMENTO', 100);
INSERT INTO Movimenta VALUES (3, 5, '2023-11-20 10:00:00', 'ABASTECIMENTO', 200);
INSERT INTO Movimenta VALUES (3, 6, '2023-11-20 10:30:00', 'ABASTECIMENTO', 150);
INSERT INTO Movimenta VALUES (4, 7, '2023-11-20 11:00:00', 'ABASTECIMENTO', 30);
INSERT INTO Movimenta VALUES (4, 8, '2023-11-20 11:30:00', 'ABASTECIMENTO', 25);
INSERT INTO Movimenta VALUES (5, 9, '2023-11-20 12:00:00', 'ABASTECIMENTO', 40);
INSERT INTO Movimenta VALUES (5, 10, '2023-11-20 12:30:00', 'ABASTECIMENTO', 50);

-- Vendas
INSERT INTO Movimenta VALUES (1, 1, '2023-11-20 14:00:00', 'VENDA', 10);
INSERT INTO Movimenta VALUES (1, 2, '2023-11-20 14:30:00', 'VENDA', 15);
INSERT INTO Movimenta VALUES (2, 3, '2023-11-20 15:00:00', 'VENDA', 8);
INSERT INTO Movimenta VALUES (3, 4, '2023-11-20 15:30:00', 'VENDA', 25);
INSERT INTO Movimenta VALUES (3, 5, '2023-11-20 16:00:00', 'VENDA', 35);
INSERT INTO Movimenta VALUES (3, 6, '2023-11-20 16:30:00', 'VENDA', 20);
INSERT INTO Movimenta VALUES (4, 7, '2023-11-20 17:00:00', 'VENDA', 5);
INSERT INTO Movimenta VALUES (4, 8, '2023-11-20 17:30:00', 'VENDA', 4);
INSERT INTO Movimenta VALUES (5, 9, '2023-11-20 18:00:00', 'VENDA', 7);
INSERT INTO Movimenta VALUES (5, 10, '2023-11-20 18:30:00', 'VENDA', 12);

-- Alocação de barracas em espaços
INSERT INTO Aloca VALUES (1, 1, 'Área de Alimentação');
INSERT INTO Aloca VALUES (2, 1, 'Área de Alimentação');
INSERT INTO Aloca VALUES (3, 1, 'Área de Alimentação');
INSERT INTO Aloca VALUES (4, 1, 'Área de Artesanato');
INSERT INTO Aloca VALUES (5, 1, 'Área de Artesanato');

-- Patrocínios
INSERT INTO Patrocina VALUES (18, 1, 50000.00, 'Patrocínio Principal');
INSERT INTO Patrocina VALUES (19, 1, 30000.00, 'Patrocínio Secundário');
INSERT INTO Patrocina VALUES (20, 1, 20000.00, 'Apoio');
INSERT INTO Patrocina VALUES (18, 2, 25000.00, 'Patrocínio Único');
INSERT INTO Patrocina VALUES (19, 3, 15000.00, 'Patrocínio Principal');

-- Reservas de locais para eventos
INSERT INTO Reserva VALUES (1, 1, '2023-11-20', '14:00:00', '22:00:00');
INSERT INTO Reserva VALUES (2, 2, '2023-11-25', '16:00:00', '20:00:00');
INSERT INTO Reserva VALUES (3, 3, '2023-12-05', '09:00:00', '17:00:00');

-- Organizadores de eventos
INSERT INTO Organiza VALUES (4, 1);
INSERT INTO Organiza VALUES (5, 1);
INSERT INTO Organiza VALUES (6, 1);
INSERT INTO Organiza VALUES (4, 2);
INSERT INTO Organiza VALUES (7, 2);
INSERT INTO Organiza VALUES (6, 3);
INSERT INTO Organiza VALUES (8, 3);

-- Estrutura de supervisão
INSERT INTO Supervisiona VALUES (4, 8);
INSERT INTO Supervisiona VALUES (5, 6);
INSERT INTO Supervisiona VALUES (6, 7);

-- Participação em grupos
INSERT INTO Participa VALUES (12, 1, TRUE);
INSERT INTO Participa VALUES (13, 1, FALSE);
INSERT INTO Participa VALUES (14, 2, TRUE);
INSERT INTO Participa VALUES (15, 3, TRUE);

-- Operação de máquinas
INSERT INTO Opera VALUES (1, 1, 1);
INSERT INTO Opera VALUES (2, 1, 1);
INSERT INTO Opera VALUES (3, 2, 1);
INSERT INTO Opera VALUES (4, 2, 1);
INSERT INTO Opera VALUES (5, 3, 1);
INSERT INTO Opera VALUES (1, 1, 2);
INSERT INTO Opera VALUES (3, 2, 2);

-- Reservas de infraestrutura
INSERT INTO Reserva_Infra VALUES (1, 1, 7);
INSERT INTO Reserva_Infra VALUES (1, 2, 7);
INSERT INTO Reserva_Infra VALUES (1, 3, 4);
INSERT INTO Reserva_Infra VALUES (1, 4, 4);
INSERT INTO Reserva_Infra VALUES (1, 5, 4);
INSERT INTO Reserva_Infra VALUES (2, 1, 7);
INSERT INTO Reserva_Infra VALUES (2, 3, 4);
INSERT INTO Reserva_Infra VALUES (3, 2, 6);