-- Contagem de clientes por cidade ordenado pela contagem

SELECT 
	COUNT(C.id_cliente) AS contagem,
	C.cidade_cliente
FROM orders.tb_clientes AS C

GROUP BY C.cidade_cliente
ORDER BY contagem DESC;