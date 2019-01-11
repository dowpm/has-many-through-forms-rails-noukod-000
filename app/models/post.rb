class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories

  # def category_ids= ids
  #   ids.each do |i|
  #     # category = Category.find(i) unless i.empty?
  #     self.categories << Category.find(i) unless i.empty?
  #   end
  # end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute| #name: 'val'
      # category = Category.find_or_create_by(category_attribute) unless category_attribute.empty?
      # self.post_categories.build(category: category)
      # binding.pry
       self.categories << Category.find_or_create_by(category_attribute) unless category_attribute.values[0].empty?
    end
  end

end
