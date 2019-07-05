class Test < ApplicationRecord
  def self.names_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
