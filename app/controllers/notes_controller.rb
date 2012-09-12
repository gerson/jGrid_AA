class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new params[:note]
    if @note.save
      flash[:notice] = "Note created succesfull"
    else
      flash[:error] = @note.errors.full_messages
    end
    redirect_to admin_productizers_path
  end

  def notes_by_product
    product = Product.find(params[:id])
    @notes = product.notes
  end

end
