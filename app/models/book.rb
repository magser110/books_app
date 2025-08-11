class Book < ApplicationRecord
    include Rails.application.routes.url_helpers

    belongs_to :user
    
    validates :title, presence: true
    validates :author, presence: true
    validates :read, inclusion: { in: [true, false] }


    has_one_attached :cover_image

    
  def cover_image_url
    rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  end
end
