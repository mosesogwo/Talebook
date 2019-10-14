# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy

  validates_presence_of :body
end
