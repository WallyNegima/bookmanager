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

  def update
    ledger = Ledger.find(params[:id])
    ledger.update(returned_at: params[:time])
    book = Book.find(ledger.book.id)
    book.update(on_loan: false)
    redirect_to current_user
  end



end
