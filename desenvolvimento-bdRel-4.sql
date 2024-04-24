-- Função para contar novos clientes por dia
CREATE FUNCTION contar_novos_clientes_por_dia(data_desejada DATE)
RETURNS INT
BEGIN
  DECLARE total_novos_clientes INT;

  -- Consultar a quantidade de clientes cadastrados na data especificada
  SELECT COUNT(*)
  INTO total_novos_clientes
  FROM clientes
  WHERE data_cadastro = data_desejada;

  -- Retornar a contagem total de novos clientes
  RETURN total_novos_clientes;
END;
