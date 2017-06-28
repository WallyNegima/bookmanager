class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    isbn = params[:isbn].to_s
    unless isbn.length == 10 || isbn.length == 13
      flash[:alert] = 'degit errors occured'
      return redirect_to new_book_path
    end

    # URIを指定する
    ## プロキシの設定
    proxy_addr = 'proxy.uec.ac.jp'
    proxy_port = 8080

    uri = URI.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:' + isbn)
    https = Net::HTTP.Proxy( proxy_addr, proxy_port)
    https = https.new(uri.host, uri.port)
    https.use_ssl = true
    res = https.start {
      https.get(uri.request_uri)
    }

    if res.code.to_s == '200'
      result = JSON.parse(res.body, {:symbolize_names => true})
      if result[:totalItems] == 0
        flash[:alert] = 'Some errors occured'
        redirect_to new_book_path
        return
      end
      result = result[:items][0][:volumeInfo]
      book = Book.new(isbn: isbn,
               author: result[:authors].join(','),
               title: result[:title],
               description: result[:description])
      if book.save
        flash[:success] = 'success'
        return redirect_to book_path(book.id)
      end
    else
      flash.now[:alert] = 'Server errors'
      redirect_to new_book_path
    end
  end

  def new
  end

  def edit
  end

  def scan
  end

  def show
    @book = Book.find(params[:id])
  end

end
