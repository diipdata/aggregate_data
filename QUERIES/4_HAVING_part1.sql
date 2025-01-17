-- Algum vendedor participou de vendas em que a média do valor_pedido por estado do cliente foi superior a 800?

SELECT
	V.nome_vendedor,
	C.estado_cliente ,
	CEILING(AVG(P.valor_pedido)) AS media
	
FROM orders.tb_pedidos AS P

INNER JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

INNER JOIN orders.tb_vendedor AS V
ON P.id_vendedor = V.id_vendedor

GROUP BY C.estado_cliente, V.nome_vendedor

HAVING CEILING(AVG(P.valor_pedido)) > 800

ORDER BY V.nome_vendedor