SELECT livro.Cod_Livro, livro.Titulo, autor.Nome_Autor, livro.ISBN, livro.Preco, editora.Nome_Editora, categoria.Desc_Categoria
FROM livro
JOIN Editora
ON livro.Cod_Editora = editora.Cod_Editora
JOIN categoria
ON livro.Cod_Categoria = categoria.Cod_Categoria
JOIN Livro_has_Autor
ON livro.Cod_Livro = Livro_has_Autor.Cod_Livro
JOIN autor
ON autor.Cod_Autor = Livro_has_Autor.Cod_Autor;
