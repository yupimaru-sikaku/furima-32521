crumb :root do
  link "Home", root_path
end

crumb :items_search do |item|
  link "検索一覧", search_items_path
  parent :root
end

crumb :items_new do
  link "出品ページ", new_item_path
  parent :root
end

crumb :items_show do |item|
  link "商品名: #{item.name}", item_path(item)
  parent :root
end

crumb :items_show do |item|
  link "商品名: #{item.name}", item_path(item)
  parent :items_search, item
end

crumb :items_order do |item|
  link "購入ページ", item_orders_path(item)
  parent :items_show, item
end

crumb :items_edit do |item|
  link "編集ページ", edit_item_path(item)
  parent :items_show, item
end

