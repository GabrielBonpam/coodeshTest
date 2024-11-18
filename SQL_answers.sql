--Listar todos Clientes que não tenham realizado uma compra;
Select c.customer_id, c.first_name, c.last_name, c.email
from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is NULL;

-- Listar todos os produtos que não tenham sidos comprados;
Select p.product_id, p.product_name, p.brand_id, p.list_price
from products p
left join order_items oi on p.product_id = oi.product_id
where oi.item_id is NULL;

-- Listar os produtos sem estoque
Select p.product_id, p.product_name, p.brand_id, p.category_id, p.list_price
from products p
left join stocks s on p.product_id = s.product_id
where s.quantity is null or s.quantity = 0;

-- Quantidade de vendas de uma determinada marca por loja
Select s.store_name,
       b.brand_name
       SUM(oi.quantity) as total_quantity_sold
from order_items oi
inner join products p on oi.product_id = p.product_id
inner join brands b on p.brand_id = b.brand_id
inner join orders o on oi.order_id = o.order_id
inner join stores s on o.store_id = s.store_id
Where b.brand_name = "Nome da marca aqui" -- Trocar pela variável com o nome da marca
group by s.store_name, b.brand_name
order by total_quantity_sold desc;

-- Listar os funcionários que não estejam ligados a um pedido
Select s.staff_id, s.first_name, s.last_name, s.email, s.phone, s.store_id
from staffs s
left join orders o on s.staff_id = o.staff_id
where o.order_id is NULL;
