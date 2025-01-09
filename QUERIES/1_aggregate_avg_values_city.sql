# Insere mais 2 clientes
INSERT INTO orders.tb_clientes (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (12, 'Bill Gates', 'Rua 14', 'Santos', 'SP');

INSERT INTO orders.tb_clientes (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (13, 'Jeff Bezos', 'Rua 29', 'Osasco', 'SP');

# Insere mais 3 pedidos
INSERT INTO orders.tb_pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1016, 11, 5, now(), 27, 234.09);

INSERT INTO orders.tb_pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1017, 12, 4, now(), 22, 678.30);

INSERT INTO orders.tb_pedidos (id_pedido, id_cliente, id_vendedor, data_pedido, id_entrega, valor_pedido)
VALUES (1018, 13, 4, now(), 22, 978.30);

-- Média do valor dos pedidos por cidade

SELECT
	CASE
		WHEN ROUND(AVG(P.valor_pedido), 2) IS NULL THEN 0
		ELSE ROUND(AVG(P.valor_pedido), 2)
	END AS media,
	C.cidade_cliente

FROM orders.tb_pedidos AS P 

RIGHT JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

GROUP BY C.cidade_cliente
ORDER BY media DESC;


