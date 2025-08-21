module BookService
    module Base
        def self.filter_book(params)
            page = params.fetch(:page, 1).to_i
            per_page = params.fetch(:per_page, 10).to_i

            begin
                offset = (page - 1) * per_page

                books = Book.offset(offset).limit(per_page)
            rescue ActiveRecord::RecordInvalid => exception
                return ServiceContract.error(book.errors.full_messages) unless book.valid?
                    
            end

            ServiceContract.success(books)  
            end
        end
    end
end