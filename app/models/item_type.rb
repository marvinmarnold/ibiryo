class ItemType < Describable
  has_many  :tag_groups
  has_many  :menus
  # attr_accessible :title, :body
end
