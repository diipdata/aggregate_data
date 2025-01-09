-- soma (total) do valor dos pedidos por cidade e estado
SELECT
	SUM(P.valor_pedido) AS total,
	C.cidade_cliente,
	C.estado_cliente
	

FROM orders.tb_pedidos AS P

LEFT JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

GROUP BY C.cidade_cliente, C.estado_cliente
ORDER BY C.estado_cliente


INSERT INTO orders.tb_clientes (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (14, 'Melinda Gates', 'Rua 14', 'Barueri', 'SP');

INSERT INTO orders.tb_clientes (id_cliente, nome_cliente, endereco_cliente, cidade_cliente, estado_cliente)
VALUES (15, 'Barack Obama', 'Rua 29', 'Barueri', 'SP');


-- Soma(total) do valor dos pedidos por cidade e estado com RIGHT JOIN e CASE
SELECT
	CASE
		WHEN FLOOR(SUM(P.valor_pedido)) IS NULL THEN 0
		ELSE FLOOR(SUM(P.valor_pedido))
	END AS total,
	C.cidade_cliente,
	C.estado_cliente
	
FROM orders.tb_pedidos AS P

RIGHT JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

GROUP BY C.cidade_cliente, C.estado_cliente
ORDER BY total DESC



-- Supondo que a comissão de cada vendedor seja de 10%, quanto cada vendedor ganhou de comissão nas vendas no estado do Ceará?
-- Retorne 0 se não houve ganho de comissão


SELECT
	DISTINCT V.nome_vendedor,
	C.estado_cliente,
	SUM(P.valor_pedido) AS total_vendido,
	ROUND((SUM(P.valor_pedido) * 0.1), 2) AS comissão

FROM orders.tb_pedidos AS P

LEFT JOIN orders.tb_vendedor AS V
ON P.id_vendedor = V.id_vendedor

LEFT JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

WHERE C.estado_cliente = 'CE'

GROUP BY C.estado_cliente, V.nome_vendedor