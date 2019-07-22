class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.names_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
