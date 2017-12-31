CREATE TABLE Produto (
  CodigoProduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeProduto VARCHAR(80) NULL,
  PrecoProduto DECIMAL(6,2) NULL,
  PRIMARY KEY(CodigoProduto)
);

CREATE TABLE Cliente (
  CodigoCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  NomeCliente VARCHAR(80) NULL,
  EnderecoCliente VARCHAR(500) NULL,
  PRIMARY KEY(CodigoCliente)
);

CREATE TABLE Pedido (
  NumeroPedido INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente_CodigoCliente INTEGER UNSIGNED NOT NULL,
  DataPedido DATE NULL,
  TotalPedido DECIMAL(6,2) NULL,
  PRIMARY KEY(NumeroPedido),
  INDEX Pedido_FKIndex1(Cliente_CodigoCliente),
  FOREIGN KEY(Cliente_CodigoCliente)
    REFERENCES Cliente(CodigoCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Item_pedido (
  Produto_CodigoProduto INTEGER UNSIGNED NOT NULL,
  Pedido_NumeroPedido INTEGER UNSIGNED NOT NULL,
  QuantidadeProduto INTEGER UNSIGNED NULL,
  TotalProduto DECIMAL(6,2) NULL,
  PRIMARY KEY(Produto_CodigoProduto, Pedido_NumeroPedido),
  INDEX Produto_has_Pedido_FKIndex1(Produto_CodigoProduto),
  INDEX Produto_has_Pedido_FKIndex2(Pedido_NumeroPedido),
  FOREIGN KEY(Produto_CodigoProduto)
    REFERENCES Produto(CodigoProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pedido_NumeroPedido)
    REFERENCES Pedido(NumeroPedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


