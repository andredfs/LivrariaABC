SELECT pedido.Cod_Pedido, pedido.Data_Envio, pedido.Data_Entrega, pedido.Confirm_Recebido, pedido.Cod_Cesta, tipo_pagamento.Desc_Pagamento, endereco.CEP, Cliente.Nome_Cliente, funcionario.Nome_Funcionario
FROM pedido
JOIN tipo_pagamento
ON pedido.Cod_Pagamento = tipo_pagamento.Cod_Pagamento
JOIN endereco
ON pedido.Cod_Endereco = endereco.Cod_Endereco
JOIN cliente
ON pedido.CPF_Cliente = cliente.CPF_Cliente
JOIN funcionario
ON pedido.Cod_Funcionario = funcionario.Cod_Funcionario;

