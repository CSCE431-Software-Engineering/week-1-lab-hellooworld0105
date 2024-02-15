class Book < ApplicationRecord
    attribute :title, :string
    attribute :author, :string
    attribute :price, :decimal
    attribute :published_date, :date
end
