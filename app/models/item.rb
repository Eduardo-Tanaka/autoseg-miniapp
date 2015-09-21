class Item < ActiveRecord::Base
  belongs_to :list

  validates :description, presence: true

  has_many :sub_items, dependent: :destroy
  accepts_nested_attributes_for :sub_items, allow_destroy: true

end
