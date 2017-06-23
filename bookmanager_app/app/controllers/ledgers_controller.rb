class LedgersController < ApplicationController
  before_action :authenticate_user!

  def index
    @ledgers = Ledger.all
  end

  def show
  end

  def create
    book = Book.find(params[:id])
    ledger = Ledger.new(user: current_user, book: book)
    book.update(on_loan: true)
    ledger.save
  end

end
