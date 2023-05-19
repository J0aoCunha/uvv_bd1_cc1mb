
CREATE TABLE public.produtos (
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
COMMENT ON COLUMN public.produtos.produto_id IS                     'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN public.produtos.nome IS                           'coluna com os nomes dos produtos das Lojas UVV';
COMMENT ON COLUMN public.produtos.preco_unitario IS                 'coluna com os preços dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.produtos.detalhes IS                       'coluna com os detalhes dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.produtos.imagem IS                         'coluna com as imagens dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.produtos.imagem_mime_type IS               'coluna com as imagem mime type dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.produtos.imagem_arquivo IS                 'coluna com  os arquivos de imagem dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.produtos.imagem_charset IS                 'coluna com os conjuntos de caracteres das imagens das Lojas UVV';
COMMENT ON COLUMN public.produtos.imagem_ultima_atualizacao IS      'coluna com as ultimas datas de atualizaçoes das imagens dos produtos das Lojas UVV';


CREATE TABLE public.lojas (
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
COMMENT ON COLUMN public.lojas.loja_id IS                    'coluna com os id das Lojas UVV e chave primaria da tabela loja_id';
COMMENT ON COLUMN public.lojas.nome IS                       'coluna com os nomes das Lojas UVV';
COMMENT ON COLUMN public.lojas.endereco_web IS               'coluna com os endereços web das Lojas UVV';
COMMENT ON COLUMN public.lojas.endereco_fisico IS            'coluna com os endereços fisicos das Lojas UVV';
COMMENT ON COLUMN public.lojas.latitude IS                   'coluna com as latitudes das Lojas UVV';
COMMENT ON COLUMN public.lojas.longitude IS                  'coluna com as longitudes das Lojas UVV';
COMMENT ON COLUMN public.lojas.logo IS                       'coluna com as logos das Lojas UVV';
COMMENT ON COLUMN public.lojas.logo_mime_type IS             'coluna com as mime type das Lojas UVV';
COMMENT ON COLUMN public.lojas.logo_arquivo IS               'coluna com os arquivos das Logos UVV';
COMMENT ON COLUMN public.lojas.logo_charset IS               'coluna com os conjuntos de caracteres das Lojas UVV';
COMMENT ON COLUMN public.lojas.logo_ultima_atualizaao IS     'coluna com as ultimas atulizaçoes das logos das Lojas UVV';


CREATE TABLE public.estoques (
                estoque_id                 NUMERIC(38)          NOT NULL,
                loja_id                    NUMERIC(38)          NOT NULL,
                produto_id                 NUMERIC(38)          NOT NULL,
                quantidade                 NUMERIC(38)          NOT NULL,
                CONSTRAINT estoque_pk      PRIMARY KEY         (estoque_id)
);
COMMENT ON COLUMN public.estoques.estoque_id IS             'coluna com os id dos estoques das Lojas UVV';
COMMENT ON COLUMN public.estoques.loja_id IS                'coluna com os id das Lojas UVV e chave primaria da tabela loja_id';
COMMENT ON COLUMN public.estoques.produto_id IS             'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN public.estoques.quantidade IS             'coluna com a quantidade de produtos vendidos pelas Lojas UVV';


CREATE TABLE public.clientes (
                cliente_id                NUMERIC(38)       NOT NULL,
                email                     VARCHAR(255)      NOT NULL,
                nome                      VARCHAR(255)      NOT NULL,
                telefone1                 VARCHAR(20),
                telefone2                 VARCHAR(20),
                telefone3                 VARCHAR(20),
                CONSTRAINT clientes_pk    PRIMARY KEY      (cliente_id)
);
COMMENT ON COLUMN public.clientes.cliente_id IS         'coluna com os  id dos clientes das Lojas UVV e chave primaria da coluna cliente_id';
COMMENT ON COLUMN public.clientes.email IS              'coluna com os emails das Lojas UVV';
COMMENT ON COLUMN public.clientes.nome IS               'coluna com os nome dos clientes das Lojas UVV';
COMMENT ON COLUMN public.clientes.telefone1 IS          'coluna com os numeros de contato dos clientes das Lojas UVV';
COMMENT ON COLUMN public.clientes.telefone2 IS          'coluna com os numeros de contato dos clientes das Lojas UVV';
COMMENT ON COLUMN public.clientes.telefone3 IS          'coluna com os numeros de contato dos clientes das Lojas UVV';


CREATE TABLE public.envios (
                envio_id               NUMERIC(38)       NOT NULL,
                loja_id                NUMERIC(38)       NOT NULL,
                cliente_id             NUMERIC(38)       NOT NULL,
                endereco_entrega       VARCHAR(512)      NOT NULL,
                status                 VARCHAR(15)       NOT NULL,
                CONSTRAINT envios_pk   PRIMARY KEY      (envio_id)
);
COMMENT ON COLUMN public.envios.envio_id IS            'coluna com os id de envios das Lojas UVV';
COMMENT ON COLUMN public.envios.loja_id IS             'coluna com os id das Lojas UVV';
COMMENT ON COLUMN public.envios.cliente_id IS          'coluna com os  id dos clientes das Lojas UVV';
COMMENT ON COLUMN public.envios.endereco_entrega IS    'coluna com os endereços de pedidos feitos nas Lojas UVV';
COMMENT ON COLUMN public.envios.status IS              'coluna com os status dos pedidos das Lojas UVV';


CREATE TABLE public.pedidos (
                pedido_id               NUMERIC(38)    NOT NULL,
                data_hora               TIMESTAMP      NOT NULL,
                cliente_id              NUMERIC(38)    NOT NULL,
                status                  VARCHAR(15)    NOT NULL,
                loja_id                 NUMERIC(38)    NOT NULL,
                CONSTRAINT pedidos_pk   PRIMARY KEY   (pedido_id)
);
COMMENT ON COLUMN public.pedidos.pedido_id IS          'coluna com os id dos pedidos ja feitos nas Lojas UVV e chave primaria da tabela pedidos';
COMMENT ON COLUMN public.pedidos.data_hora IS          'coluna com as datas e horaios dos pedidos ja feitos nas Lojas UVV';
COMMENT ON COLUMN public.pedidos.cliente_id IS         'coluna com os  id dos clientes das Lojas UVV';
COMMENT ON COLUMN public.pedidos.status IS             'coluna com os status dos pedidos nas Lojas UVV';
COMMENT ON COLUMN public.pedidos.loja_id IS            'coluna com os id das Lojas UVV';


CREATE TABLE public.pedidos_itens (
                pedido_id                     NUMERIC(38)      NOT NULL,
                produto_id                    NUMERIC(38)      NOT NULL,
                numero_da_linha               NUMERIC(38)      NOT NULL,
                preco_unitario                NUMERIC(10,2)    NOT NULL,
                quantidade                    NUMERIC(38)      NOT NULL,
                envio_id                      NUMERIC(38)      NOT NULL,
                CONSTRAINT pedidos_itens_pk   PRIMARY KEY     (pedido_id, produto_id)
);
COMMENT ON COLUMN public.pedidos_itens.pedido_id IS          'coluna com os id dos pedidos ja feitos nas Lojas UVV e chave primaria da tabela pedidos';
COMMENT ON COLUMN public.pedidos_itens.produto_id IS         'coluna com os id dos produtod das Lojas UVV e chave primaria da tabela produtos';
COMMENT ON COLUMN public.pedidos_itens.numero_da_linha IS    'coluna com os numero de cada linha dos produtos das Lojas UVV';
COMMENT ON COLUMN public.pedidos_itens.preco_unitario IS     'coluna com os preços dos produtos vendidos nas Lojas UVV';
COMMENT ON COLUMN public.pedidos_itens.quantidade IS         'coluna com a quantidade de pedidos e produtos das Lojas UVV';
COMMENT ON COLUMN public.pedidos_itens.envio_id IS           'coluna com os id de envios das Lojas UVV';


ALTER TABLE public.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY                   (produto_id)
REFERENCES  public.produtos   (produto_id)
ON DELETE                     NO ACTION
ON UPDATE                     NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY                   (produto_id)
REFERENCES  public.produtos   (produto_id)
ON DELETE                     NO ACTION
ON UPDATE                     NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY                (loja_id)
REFERENCES  public.lojas   (loja_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY                (loja_id)
REFERENCES  public.lojas   (loja_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY               (loja_id)
REFERENCES  public.lojas  (loja_id)
ON DELETE                 NO ACTION
ON UPDATE                 NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY                  (cliente_id)
REFERENCES  public.clientes  (cliente_id)
ON DELETE                    NO ACTION
ON UPDATE                    NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY                  (cliente_id)
REFERENCES  public.clientes  (cliente_id)
ON DELETE                    NO ACTION
ON UPDATE                    NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY                (envio_id)
REFERENCES  public.envios  (envio_id)
ON DELETE                  NO ACTION
ON UPDATE                  NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY                 (pedido_id)
REFERENCES  public.pedidos  (pedido_id)
ON DELETE                   NO ACTION
ON UPDATE                   NO ACTION
NOT DEFERRABLE;
