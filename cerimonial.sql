
CREATE TABLE financeiro (
                valor_svc DECIMAL(8,2) NOT NULL,
                forma_pagamento CHAR(10) NOT NULL,
                valor_total DECIMAL(8,2) NOT NULL,
                PRIMARY KEY (valor_svc, forma_pagamento)
);

ALTER TABLE financeiro COMMENT 'Entidade para financeiro';

ALTER TABLE financeiro MODIFY COLUMN valor_svc DECIMAL(8, 2) COMMENT 'Valor do serviço';

ALTER TABLE financeiro MODIFY COLUMN forma_pagamento CHAR(10) COMMENT 'Chave primária de forma de pagamento';

ALTER TABLE financeiro MODIFY COLUMN valor_total DECIMAL(8, 2) COMMENT 'Valor total referente ao evento';


CREATE TABLE endereco (
                cod_endereco VARCHAR NOT NULL,
                logradouro VARCHAR(50) NOT NULL,
                numero NUMERIC(4) NOT NULL,
                complemento VARCHAR(60),
                bairro VARCHAR(30) NOT NULL,
                cidade VARCHAR(30) NOT NULL,
                uf CHAR(2) NOT NULL,
                cep NUMERIC(8) NOT NULL,
                PRIMARY KEY (cod_endereco)
);

ALTER TABLE endereco COMMENT 'Entidade para endereço';

ALTER TABLE endereco MODIFY COLUMN cod_endereco VARCHAR COMMENT 'Chave primária e código do endereço';

ALTER TABLE endereco MODIFY COLUMN logradouro VARCHAR(50) COMMENT 'Logradouro';

ALTER TABLE endereco MODIFY COLUMN numero NUMERIC(4) COMMENT 'Numero';

ALTER TABLE endereco MODIFY COLUMN complemento VARCHAR(60) COMMENT 'Complemento';

ALTER TABLE endereco MODIFY COLUMN bairro VARCHAR(30) COMMENT 'Bairro';

ALTER TABLE endereco MODIFY COLUMN cidade VARCHAR(30) COMMENT 'Cidade';

ALTER TABLE endereco MODIFY COLUMN uf CHAR(2) COMMENT 'UF';

ALTER TABLE endereco MODIFY COLUMN cep NUMERIC(8) COMMENT 'CEP';


CREATE TABLE profissional (
                cod_profissional INT NOT NULL,
                nome_profissional VARCHAR NOT NULL,
                cod_endereco VARCHAR NOT NULL,
                PRIMARY KEY (cod_profissional)
);

ALTER TABLE profissional COMMENT 'Entidade para profissional';

ALTER TABLE profissional MODIFY COLUMN cod_profissional INTEGER COMMENT 'Chave primária e código do profissional';

ALTER TABLE profissional MODIFY COLUMN nome_profissional VARCHAR COMMENT 'Nome do profissional';

ALTER TABLE profissional MODIFY COLUMN cod_endereco VARCHAR COMMENT 'Chave estrangeira do código do endereço';


CREATE TABLE telefone_pro (
                cod_profissional INT NOT NULL,
                telefone_pro NUMERIC(11) NOT NULL,
                tipo_pro VARCHAR(15),
                PRIMARY KEY (cod_profissional, telefone_pro)
);

ALTER TABLE telefone_pro COMMENT 'Entidade para guardar os telefones de profissionais';

ALTER TABLE telefone_pro MODIFY COLUMN cod_profissional INTEGER COMMENT 'Código do profissional';

ALTER TABLE telefone_pro MODIFY COLUMN telefone_pro NUMERIC(11) COMMENT 'O telefone do profissional';

ALTER TABLE telefone_pro MODIFY COLUMN tipo_pro VARCHAR(15) COMMENT 'Tipo de telefone (fixo, celular...)';


CREATE TABLE cozinheiro (
                cod_profissional INT NOT NULL,
                descricao_skill VARCHAR(100) NOT NULL,
                formacao VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_profissional)
);

ALTER TABLE cozinheiro COMMENT 'Entidade cozinheiro';

ALTER TABLE cozinheiro MODIFY COLUMN cod_profissional INTEGER COMMENT 'Chave primária e estrangeira do código profissional';

ALTER TABLE cozinheiro MODIFY COLUMN descricao_skill VARCHAR(100) COMMENT 'Descrição de habilidade';

ALTER TABLE cozinheiro MODIFY COLUMN formacao VARCHAR(20) COMMENT 'Formação';


CREATE TABLE garcom (
                cod_profissional INT NOT NULL,
                tempo_xp TIME NOT NULL,
                PRIMARY KEY (cod_profissional)
);

ALTER TABLE garcom COMMENT 'Entidade garçom';

ALTER TABLE garcom MODIFY COLUMN cod_profissional INTEGER COMMENT 'Chave primária e estrangeira do código do profissional';

ALTER TABLE garcom MODIFY COLUMN tempo_xp TIME COMMENT 'Tempo de experiência';


CREATE TABLE musico (
                cod_profissional INT NOT NULL,
                formacao VARCHAR(20) NOT NULL,
                descricao_skill VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_profissional)
);

ALTER TABLE musico COMMENT 'Entidade músico';

ALTER TABLE musico MODIFY COLUMN cod_profissional INTEGER COMMENT 'Chave primária e estrangeira do código do profissional';

ALTER TABLE musico MODIFY COLUMN formacao VARCHAR(20) COMMENT 'Formação';

ALTER TABLE musico MODIFY COLUMN descricao_skill VARCHAR(100) COMMENT 'Descrição de habilidade';


CREATE TABLE convidado (
                cod_convidado INT NOT NULL,
                nome_convidado VARCHAR(60) NOT NULL,
                nascimento DATE NOT NULL,
                sexo BOOLEAN NOT NULL,
                PRIMARY KEY (cod_convidado)
);

ALTER TABLE convidado COMMENT 'Entidade convidado';

ALTER TABLE convidado MODIFY COLUMN cod_convidado INTEGER COMMENT 'Chave primária do código convidado';

ALTER TABLE convidado MODIFY COLUMN nome_convidado VARCHAR(60) COMMENT 'Nome do convidado';

ALTER TABLE convidado MODIFY COLUMN nascimento DATE COMMENT 'Nascimento do convidado';

ALTER TABLE convidado MODIFY COLUMN sexo BOOLEAN COMMENT 'Sexo convidado';


CREATE TABLE telefone_convi (
                cod_convidado INT NOT NULL,
                telefone_convi NUMERIC(11) NOT NULL,
                tipo_con VARCHAR(15),
                PRIMARY KEY (cod_convidado, telefone_convi)
);

ALTER TABLE telefone_convi COMMENT 'Chave primária e estrangeira do código do convidado';

ALTER TABLE telefone_convi MODIFY COLUMN telefone_convi NUMERIC(11) COMMENT 'Chave primária do telefone do convidado';

ALTER TABLE telefone_convi MODIFY COLUMN tipo_con VARCHAR(15) COMMENT 'Tipo de telefone (fixo, celular...)';


CREATE TABLE servico (
                cod_servico INT NOT NULL,
                nome_servico VARCHAR(60) NOT NULL,
                descricao VARCHAR(100) NOT NULL,
                valor_svc DECIMAL(8,2) NOT NULL,
                PRIMARY KEY (cod_servico)
);

ALTER TABLE servico COMMENT 'Entidade serviço';

ALTER TABLE servico MODIFY COLUMN cod_servico INTEGER COMMENT 'Chave primária do código do serviço';

ALTER TABLE servico MODIFY COLUMN nome_servico VARCHAR(60) COMMENT 'Nome serviço';

ALTER TABLE servico MODIFY COLUMN descricao VARCHAR(100) COMMENT 'Descrição do serviço';

ALTER TABLE servico MODIFY COLUMN valor_svc DECIMAL(8, 2) COMMENT 'Valor do serviço';


CREATE TABLE comida (
                cod_servico INT NOT NULL,
                nome_comida VARCHAR(60) NOT NULL,
                inidice_calorico INT NOT NULL,
                PRIMARY KEY (cod_servico)
);

ALTER TABLE comida COMMENT 'Entidade comida';

ALTER TABLE comida MODIFY COLUMN cod_servico INTEGER COMMENT 'Chave primária e estrangeira do código do serviço';

ALTER TABLE comida MODIFY COLUMN nome_comida VARCHAR(60) COMMENT 'Nome da comida';

ALTER TABLE comida MODIFY COLUMN inidice_calorico INTEGER COMMENT 'Índice calórico';


CREATE TABLE bebida (
                cod_servico INT NOT NULL,
                nome_bebida VARCHAR(60) NOT NULL,
                teor_alcoolico DECIMAL(5,2),
                PRIMARY KEY (cod_servico)
);

ALTER TABLE bebida COMMENT 'Entidade bebida';

ALTER TABLE bebida MODIFY COLUMN cod_servico INTEGER COMMENT 'Chave primária e estrangeira do código do serviço';

ALTER TABLE bebida MODIFY COLUMN nome_bebida VARCHAR(60) COMMENT 'Nome da bebida';

ALTER TABLE bebida MODIFY COLUMN teor_alcoolico DECIMAL(5, 2) COMMENT 'Teor alcoólico';


CREATE TABLE cliente (
                cod_cliente INT NOT NULL,
                nome_cliente VARCHAR(60) NOT NULL,
                email_cli VARCHAR(80) NOT NULL,
                cod_endereco VARCHAR NOT NULL,
                PRIMARY KEY (cod_cliente)
);

ALTER TABLE cliente COMMENT 'Entidade cliente';

ALTER TABLE cliente MODIFY COLUMN cod_cliente INTEGER COMMENT 'Chave primária e código cliente';

ALTER TABLE cliente MODIFY COLUMN nome_cliente VARCHAR(60) COMMENT 'Nome cliente';

ALTER TABLE cliente MODIFY COLUMN email_cli VARCHAR(80) COMMENT 'Email cliente';

ALTER TABLE cliente MODIFY COLUMN cod_endereco VARCHAR COMMENT 'Chave estrangeira do código do endereço';


CREATE TABLE convite (
                cod_cliente INT NOT NULL,
                cod_convidado INT NOT NULL,
                PRIMARY KEY (cod_cliente, cod_convidado)
);

ALTER TABLE convite COMMENT 'Entidade convite';

ALTER TABLE convite MODIFY COLUMN cod_cliente INTEGER COMMENT 'Chave primária e estrangeira do código do cliente';

ALTER TABLE convite MODIFY COLUMN cod_convidado INTEGER COMMENT 'Chave primária e estrangeira do código do convidado';


CREATE TABLE evento (
                cod_evento INT NOT NULL,
                nome_evento VARCHAR(60) NOT NULL,
                hora_inicio TIME NOT NULL,
                motivo VARCHAR(50) NOT NULL,
                hora_fim TIME NOT NULL,
                cod_cliente INT NOT NULL,
                forma_pagamento CHAR(10) NOT NULL,
                valor_svc DECIMAL(8,2) NOT NULL,
                PRIMARY KEY (cod_evento)
);

ALTER TABLE evento COMMENT 'Entidade de evento';

ALTER TABLE evento MODIFY COLUMN cod_evento INTEGER COMMENT 'Chave primária e código do evento';

ALTER TABLE evento MODIFY COLUMN nome_evento VARCHAR(60) COMMENT 'Nome do evento';

ALTER TABLE evento MODIFY COLUMN hora_inicio TIME COMMENT 'Hora de início do evento';

ALTER TABLE evento MODIFY COLUMN motivo VARCHAR(50) COMMENT 'Motivo do evento';

ALTER TABLE evento MODIFY COLUMN hora_fim TIME COMMENT 'Hora fim';

ALTER TABLE evento MODIFY COLUMN cod_cliente INTEGER COMMENT 'Chave estrangeira do código do cliente';

ALTER TABLE evento MODIFY COLUMN forma_pagamento CHAR(10) COMMENT 'Chave estrangeira da forma de pagamento';

ALTER TABLE evento MODIFY COLUMN valor_svc DECIMAL(8, 2) COMMENT 'Valor do serviço';


CREATE TABLE consumo (
                cod_evento INT NOT NULL,
                cod_servico INT NOT NULL,
                q_contrato VARCHAR NOT NULL,
                q_consumo VARCHAR NOT NULL,
                PRIMARY KEY (cod_evento, cod_servico)
);

ALTER TABLE consumo COMMENT 'Entidade consumo';

ALTER TABLE consumo MODIFY COLUMN cod_evento INTEGER COMMENT 'Chave primária e estrangeira do código de evento';

ALTER TABLE consumo MODIFY COLUMN cod_servico INTEGER COMMENT 'Chave primária e estrangeira do código de serviço';

ALTER TABLE consumo MODIFY COLUMN q_contrato VARCHAR COMMENT 'Quantidade contratada';

ALTER TABLE consumo MODIFY COLUMN q_consumo VARCHAR COMMENT 'Quantidade consumida';


CREATE TABLE equipe (
                data_inicio DATE NOT NULL,
                cod_evento INT NOT NULL,
                cod_profissional INT NOT NULL,
                data_fim DATE,
                PRIMARY KEY (data_inicio, cod_evento, cod_profissional)
);

ALTER TABLE equipe COMMENT 'Entidade da equipe';

ALTER TABLE equipe MODIFY COLUMN data_inicio DATE COMMENT 'Chave primária e código de início';

ALTER TABLE equipe MODIFY COLUMN cod_evento INTEGER COMMENT 'Chave primária e estrangeira e código do evento';

ALTER TABLE equipe MODIFY COLUMN cod_profissional INTEGER COMMENT 'Chave primária e estrangeira e código do profissonal';

ALTER TABLE equipe MODIFY COLUMN data_fim DATE COMMENT 'Data fim';


CREATE TABLE telefone_cli (
                cod_cliente INT NOT NULL,
                telefone_cli NUMERIC(11) NOT NULL,
                tipo_cli VARCHAR(15),
                PRIMARY KEY (cod_cliente, telefone_cli)
);

ALTER TABLE telefone_cli COMMENT 'Entidade de telefone do cliente';

ALTER TABLE telefone_cli MODIFY COLUMN cod_cliente INTEGER COMMENT 'Código do cliente';

ALTER TABLE telefone_cli MODIFY COLUMN telefone_cli NUMERIC(11) COMMENT 'Telefone cliente';

ALTER TABLE telefone_cli MODIFY COLUMN tipo_cli VARCHAR(15) COMMENT 'Tipo de telefone (fixo, celular...)';


ALTER TABLE evento ADD CONSTRAINT pagamento_evento_fk
FOREIGN KEY (forma_pagamento, valor_svc)
REFERENCES financeiro (forma_pagamento, valor_svc)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cliente ADD CONSTRAINT endereco_cliente_fk
FOREIGN KEY (cod_endereco)
REFERENCES endereco (cod_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE profissional ADD CONSTRAINT endereco_profissional_fk
FOREIGN KEY (cod_endereco)
REFERENCES endereco (cod_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE musico ADD CONSTRAINT profissional_musico_fk
FOREIGN KEY (cod_profissional)
REFERENCES profissional (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE garcom ADD CONSTRAINT profissional_garcom_fk
FOREIGN KEY (cod_profissional)
REFERENCES profissional (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cozinheiro ADD CONSTRAINT profissional_cozinheiro_fk
FOREIGN KEY (cod_profissional)
REFERENCES profissional (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefone_pro ADD CONSTRAINT profissional_telefone_pro_fk
FOREIGN KEY (cod_profissional)
REFERENCES profissional (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE equipe ADD CONSTRAINT profissional_equipe_fk
FOREIGN KEY (cod_profissional)
REFERENCES profissional (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefone_convi ADD CONSTRAINT convidado_telefone_convi_fk
FOREIGN KEY (cod_convidado)
REFERENCES convidado (cod_convidado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE convite ADD CONSTRAINT convidado_convite_fk
FOREIGN KEY (cod_convidado)
REFERENCES convidado (cod_convidado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE bebida ADD CONSTRAINT servico_bebida_fk
FOREIGN KEY (cod_servico)
REFERENCES servico (cod_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comida ADD CONSTRAINT servico_comida_fk
FOREIGN KEY (cod_servico)
REFERENCES servico (cod_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE consumo ADD CONSTRAINT servico_consumo_fk
FOREIGN KEY (cod_servico)
REFERENCES servico (cod_servico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE telefone_cli ADD CONSTRAINT cliente_telefone_cli_fk
FOREIGN KEY (cod_cliente)
REFERENCES cliente (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE evento ADD CONSTRAINT cliente_evento_fk
FOREIGN KEY (cod_cliente)
REFERENCES cliente (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE convite ADD CONSTRAINT cliente_convite_fk
FOREIGN KEY (cod_cliente)
REFERENCES cliente (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE equipe ADD CONSTRAINT evento_equipe_fk
FOREIGN KEY (cod_evento)
REFERENCES evento (cod_evento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE consumo ADD CONSTRAINT evento_consumo_fk
FOREIGN KEY (cod_evento)
REFERENCES evento (cod_evento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;