--Apaga o banco de dados se ele existir 
DROP DATABASE IF EXISTS uvv;


--Apaga os usuario se ele existir 
DROP USER IF EXISTS joao;

--Cria o usuario e senha que sera o dono do banco de dados e do schema
CREATE USER joao
       WITH PASSWORD '123';

--Cria o banco de dados uvv
CREATE DATABASE uvv
       OWNER  joao
       TEMPLATE template0
       ENCODING UTF8
       LC_COLLATE  "pt_BR.UTF-8"
       LC_CTYPE "pt_BR.UTF-8"
       ALLOW_CONNECTIONS  true; 

 
 --Faz a conexao do schema com o banco de dados
\c 'dbname=uvv user=joao password= 123';


--Cria o schema e da authorizaçao para o usuario
CREATE SCHEMA lojas authorization joao;

--altera o schema padrão do postgres para o schema que foi criado
ALTER USER joao
SET SEARCH_PATH TO lojas, "$user", public;


--Criaçao das tabelas do banco de dados e das Chaves primarias das tabelas 
CREATE TABLE produtos (
                produto_id                     NUMERIC(38)     NOT NULL,
                nome                           VARCHAR(255)    NOT NULL,
                preco_unitario                 NUMERIC(10,2),
                detalhes                       BYTEA,
                imagem                         BYTEA,
                imagem_mime_type               VARCHAR(512),
                imagem_arquivo                 VARCHAR(512),
                imagem_charset                 VARCHAR(512),
                imagem_ultima_atualizacao      DATE,
                CONSTRAINT produtos_pk         PRIMARY KEY    (produto_id)
);
              
CREATE TABLE lojas (
                loja_id                       NUMERIC(38)     NOT NULL,
                nome                          VARCHAR(255)    NOT NULL,
                endereco_web                  VARCHAR(100),
                endereco_fisico               VARCHAR(512),
                latitude                      NUMERIC,
                longitude                     NUMERIC,
                logo                          BYTEA,
                logo_mime_type                VARCHAR(512),
                logo_arquivo                  VARCHAR(512),
                logo_charset                  VARCHAR(512),
                logo_ultima_atualizaao        DATE,
                CONSTRAINT lojas_pk           PRIMARY KEY    (loja_id)
);

CREATE TABLE estoques (
                estoque_id                 NUMERIC(38)          NOT NULL,
                loja_id                    NUMERIC(38)          NOT NULL,
                produto_id                 NUMERIC(38)          NOT NULL,
                quantidade                 NUMERIC(38)          NOT NULL,
                CONSTRAINT estoque_pk      PRIMARY KEY         (estoque_id)
);

CREATE TABLE clientes (
                cliente_id                NUMERIC(38)       NOT NULL,
                email                     VARCHAR(255)      NOT NULL,
                nome                      VARCHAR(255)      NOT NULL,
                telefone1                 VARCHAR(20),
                telefone2                 VARCHAR(20),
                telefone3                 VARCHAR(20),
                CONSTRAINT clientes_pk    PRIMARY KEY      (cliente_id)
);

CREATE TABLE envios (
                envio_id               NUMERIC(38)       NOT NULL,
                loja_id                NUMERIC(38)       NOT NULL,
                cliente_id             NUMERIC(38)       NOT NULL,
                endereco_entrega       VARCHAR(512)      NOT NULL,
                status                 VARCHAR(15)       NOT NULL,
                CONSTRAINT envios_pk   PRIMARY KEY      (envio_id)
);

CREATE TABLE pedidos (
                pedido_id               NUMERIC(38)    NOT NULL,
                data_hora               TIMESTAMP      NOT NULL,
                cliente_id              NUMERIC(38)    NOT NULL,
                status                  VARCHAR(15)    NOT NULL,
                loja_id                 NUMERIC(38)    NOT NULL,
                CONSTRAINT pedidos_pk   PRIMARY KEY   (pedido_id)
);

CREATE TABLE pedidos_itens (
                pedido_id                     NUMERIC(38)      NOT NULL,
                produto_id                    NUMERIC(38)      NOT NULL,
                numero_da_linha               NUMERIC(38)      NOT NULL,
                preco_unitario                NUMERIC(10,2)    NOT NULL,
                quantidade                    NUMERIC(38)      NOT NULL,
                envio_id                      NUMERIC(38)      NOT NULL,
                CONSTRAINT pedidos_itens_pk   PRIMARY KEY     (pedido_id, produto_id)
);


--Criaçao dos comentarios das tabelas e das colunas do Banco de dados
COMMENT ON COLUMN produtos.produto_id                IS                   'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN produtos.nome                      IS                   'coluna com os nomes dos produtos das Lojas UVV';
COMMENT ON COLUMN produtos.preco_unitario            IS                   'coluna com os preços dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN produtos.detalhes                  IS                   'coluna com os detalhes dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN produtos.imagem                    IS                   'coluna com as imagens dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN produtos.imagem_mime_type          IS                   'coluna com as imagem mime type dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN produtos.imagem_arquivo            IS                   'coluna com  os arquivos de imagem dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN produtos.imagem_charset            IS                   'coluna com os conjuntos de caracteres das imagens das Lojas UVV';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS                   'coluna com as ultimas datas de atualizaçoes das imagens dos produtos das Lojas UVV';

COMMENT ON COLUMN lojas.loja_id                IS                       'coluna com os id das Lojas UVV e chave primaria da tabela loja_id';
COMMENT ON COLUMN lojas.nome                   IS                       'coluna com os nomes das Lojas UVV';
COMMENT ON COLUMN lojas.endereco_web           IS                       'coluna com os endereços web das Lojas UVV';
COMMENT ON COLUMN lojas.endereco_fisico        IS                       'coluna com os endereços fisicos das Lojas UVV';
COMMENT ON COLUMN lojas.latitude               IS                       'coluna com as latitudes das Lojas UVV';
COMMENT ON COLUMN lojas.longitude              IS                       'coluna com as longitudes das Lojas UVV';
COMMENT ON COLUMN lojas.logo                   IS                       'coluna com as logos das Lojas UVV';
COMMENT ON COLUMN lojas.logo_mime_type         IS                       'coluna com as mime type das Lojas UVV';
COMMENT ON COLUMN lojas.logo_arquivo           IS                       'coluna com os arquivos das Logos UVV';
COMMENT ON COLUMN lojas.logo_charset           IS                       'coluna com os conjuntos de caracteres das Lojas UVV';
COMMENT ON COLUMN lojas.logo_ultima_atualizaao IS                       'coluna com as ultimas atulizaçoes das logos das Lojas UVV';

COMMENT ON COLUMN estoques.estoque_id        IS                'coluna com os id dos estoques das Lojas UVV';
COMMENT ON COLUMN estoques.loja_id           IS                'coluna com os id das Lojas UVV e chave primaria da tabela loja_id';
COMMENT ON COLUMN estoques.produto_id        IS                'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN estoques.quantidade        IS                'coluna com a quantidade de produtos vendidos pelas Lojas UVV';

COMMENT ON COLUMN clientes.cliente_id      IS               'coluna com os  id dos clientes das Lojas UVV e chave primaria da coluna cliente_id';
COMMENT ON COLUMN clientes.email           IS               'coluna com os emails das Lojas UVV';
COMMENT ON COLUMN clientes.nome            IS               'coluna com os nome dos clientes das Lojas UVV';
COMMENT ON COLUMN clientes.telefone1       IS               'coluna com os numeros de contato dos clientes das Lojas UVV';
COMMENT ON COLUMN clientes.telefone2       IS               'coluna com os numeros de contato dos clientes das Lojas UVV';
COMMENT ON COLUMN clientes.telefone3       IS               'coluna com os numeros de contato dos clientes das Lojas UVV';

COMMENT ON COLUMN envios.envio_id         IS              'coluna com os id de envios das Lojas UVV';
COMMENT ON COLUMN envios.loja_id          IS              'coluna com os id das Lojas UVV';
COMMENT ON COLUMN envios.cliente_id       IS              'coluna com os  id dos clientes das Lojas UVV';
COMMENT ON COLUMN envios.endereco_entrega IS              'coluna com os endereços de pedidos feitos nas Lojas UVV';
COMMENT ON COLUMN envios.status           IS              'coluna com os status dos pedidos das Lojas UVV';

COMMENT ON COLUMN pedidos.pedido_id       IS             'coluna com os id dos pedidos ja feitos nas Lojas UVV e chave primaria da tabela pedidos';
COMMENT ON COLUMN pedidos.data_hora       IS             'coluna com as datas e horaios dos pedidos ja feitos nas Lojas UVV';
COMMENT ON COLUMN pedidos.cliente_id      IS             'coluna com os  id dos clientes das Lojas UVV';
COMMENT ON COLUMN pedidos.status          IS             'coluna com os status dos pedidos nas Lojas UVV';
COMMENT ON COLUMN pedidos.loja_id         IS             'coluna com os id das Lojas UVV';

COMMENT ON COLUMN pedidos_itens.pedido_id       IS           'coluna com os id dos pedidos ja feitos nas Lojas UVV e chave primaria da tabela pedidos';
COMMENT ON COLUMN pedidos_itens.produto_id      IS           'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS           'coluna com os numero de cada linha dos produtos das Lojas UVV';
COMMENT ON COLUMN pedidos_itens.preco_unitario  IS           'coluna com os preços dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN pedidos_itens.quantidade      IS           'coluna com a quantidade de pedidos e produtos das Lojas UVV';
COMMENT ON COLUMN pedidos_itens.envio_id        IS           'coluna com os id de envios das Lojas UVV';


--Criaçao das Chaves estrangeiras das Tabelas do Banco de dados
ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY                   (produto_id)
REFERENCES  produtos          (produto_id)
ON DELETE                     NO ACTION
ON UPDATE                     NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY                   (produto_id)
REFERENCES  produtos          (produto_id)
ON DELETE                     NO ACTION
ON UPDATE                     NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY                (loja_id)
REFERENCES lojas           (loja_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY                (loja_id)
REFERENCES  lojas          (loja_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY               (loja_id)
REFERENCES  lojas         (loja_id)
ON DELETE                 NO ACTION
ON UPDATE                 NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY                  (cliente_id)
REFERENCES  clientes         (cliente_id)
ON DELETE                    NO ACTION
ON UPDATE                    NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY                  (cliente_id)
REFERENCES  clientes         (cliente_id)
ON DELETE                    NO ACTION
ON UPDATE                    NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY                (envio_id)
REFERENCES  envios         (envio_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY                 (pedido_id)
REFERENCES  pedidos         (pedido_id)
ON DELETE                   NO ACTION
ON UPDATE                   NO ACTION
NOT DEFERRABLE;


--criaçao das constraint das colunas do Banco de dados
ALTER TABLE pedidos
ADD CONSTRAINT check_status CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

ALTER TABLE envios
ADD CONSTRAINT check_status CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

ALTER TABLE pedidos_itens
ADD CONSTRAINT check_quantidade CHECK (quantidade >= 0);

ALTER TABLE pedidos_itens
ADD CONSTRAINT check_preco_unitario CHECK (preco_unitario >= 0);

ALTER TABLE produtos
ADD CONSTRAINT check_preco_unitario CHECK (preco_unitario >= 0);

ALTER TABLE estoques
ADD CONSTRAINT check_quantidade CHECK (quantidade >= 0);

ALTER TABLE lojas
ADD CONSTRAINT check_endereco_fisico_web
CHECK ((endereco_web IS NOT NULL) OR (endereco_fisico IS NOT NULL));
