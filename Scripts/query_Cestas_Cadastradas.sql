SELECT cesta_has_livros.Cod_Cesta, cliente.Nome_Cliente, COUNT(cesta_has_livros.Cod_Cesta) AS 'qtde livros', cesta.Preco_Total
FROM cesta_has_livros
JOIN cesta
ON cesta_has_livros.Cod_Cesta = cesta.Cod_Cesta
JOIN pedido
ON cesta.Cod_Cesta = pedido.Cod_Cesta
JOIN cliente
ON cliente.CPF_Cliente = pedido.CPF_Cliente
GROUP BY cesta_has_livros.Cod_Cesta




