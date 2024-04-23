DELIMITER $$

CREATE PROCEDURE sp_LevantamentoDiarioVendas
    @data_desejada DATE
BEGIN
    -- Consulta para obter a quantidade de produtos vendidos por dia
    SELECT
        DATE(vendas.data_venda) AS data_venda,
        SUM(vendas_itens.quantidade) AS total_vendidos
    FROM vendas
    JOIN vendas_itens ON vendas.venda_id = vendas_itens.venda_id
    WHERE DATE(vendas.data_venda) = @data_desejada
    GROUP BY DATE(vendas.data_venda);

    -- Opcional: Exibir mensagem de sucesso
    SELECT 'Levantamento de vendas para o dia ', @data_desejada, ' concluído com sucesso.';
END $$

DELIMITER ;
