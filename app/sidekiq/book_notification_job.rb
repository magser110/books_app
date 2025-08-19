class BookNotificationJob
  include Sidekiq::Job

  def perform(book_id)
    begin
    book = Book.find(book_id)
    puts "notification sent for book: #{book.title} by #{book.author}"
    rescue => e
      Rails.logger.error("error in BookNotificationJob: #{e.message}")
  end
end
