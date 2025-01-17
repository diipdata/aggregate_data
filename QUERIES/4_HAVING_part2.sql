-- Qual estado teve mais de 5 pedidos?

SELECT
	C.estado_cliente,
	Count(P.id_pedido) AS pedidos
	
FROM orders.tb_pedidos AS P

INNER JOIN orders.tb_clientes AS C
ON P.id_cliente = C.id_cliente

GROUP BY C.estado_cliente

HAVING Count(P.id_pedido) > 5

ORDER BY pedidos DESC;