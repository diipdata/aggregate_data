-- Algum vendedor participou de vendas cujo valor pedido tenha sido superior a 600 no estado de SP?

SELECT
	C.nome_cliente,
	C.cidade_cliente,
	P.valor_pedido,
	V.nome_vendedor
	
FROM orders.tb_pedidos AS P

INNER JOIN orders.tb_vendedor AS V
ON P.id_cliente = P.id_cliente

INNER JOIN orders.tb_clientes AS C
ON P.id_vendedor = V.id_vendedor

WHERE C.estado_cliente = 'SP'
AND P.valor_pedido >= 600


-- Qual estado teve mais de 5 pedidos?

SELECT
	C.estado_cliente,
	Count(P.id_pedido) AS pedidos
	
FROM orders.tb_pedidos AS P

INNER JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

GROUP BY C.estado_cliente

HAVING Count(P.id_pedido) > 5