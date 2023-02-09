SELECT Cliente.CPF_Cliente, Cliente.Nome_Cliente, Cliente.Data_Nasc, Cliente.email, Sexo.Desc_Sexo, Telefone.DDD, Telefone.Numero_Telefone, Endereco.Nome_Rua, Endereco.Complemento, Bairro.Nome_Bairro, Cidade.Nome_Cidade, UF.Desc_UF
FROM Cliente
JOIN sexo
ON Cliente.Cod_Sexo = Sexo.Cod_Sexo
JOIN Cliente_has_Telefone
ON Cliente.CPF_Cliente = Cliente_has_Telefone.CPF_Cliente
JOIN Telefone
ON Telefone.Cod_Telefone = Cliente_has_Telefone.Cod_Telefone
JOIN endereco_has_cliente
ON Cliente.CPF_Cliente = endereco_has_cliente.CPF_Cliente
JOIN endereco
ON endereco.Cod_Endereco = endereco_has_cliente.Cod_Endereco
JOIN bairro
ON endereco.Cod_Bairro = bairro.Cod_Bairro
JOIN cidade
ON bairro.Cod_Cidade = cidade.Cod_Cidade
JOIN uf 
ON cidade.Cod_UF = uf.Cod_UF;

