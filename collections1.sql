create type order_item_type as object(
	item_id number(3),
	product_id number(6),
	unit_price number(8,2),
	quantity number(4)
	)
	
	
create type order_item_list_table as table of order_item_type

create table orders (
	order_id number(12) not null,
	order_date timestamp(6) with local time zone,
	customer_id number(6),
	order_items order_item_list_table)
	nested table order_items store as order_items_tab
	
	
declare
	l_items orders.order_items%type;
begin
	l_items:=order_item_list_table();
	
	for ord in (select * from oe.orders order by order_date) loop
		l_items.delete;
		for items in (select * from oe.order_items where order_id=ord.order_id order by line_item_id ) loop
			l_items(ord.order_id):=order_item_type(items.line_item_id,items.product_id,items.unit_price);
		end loop;
		insert into orders(order_id,order_date,customer_id,order_items) values (ord.order_id, ord.order_date, ord.customer_id, l_items)
	end loop;
end;
	