# frozen_string_literal: true

class BooksBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :title, :author, :read, :cover_image_url
  end
end
