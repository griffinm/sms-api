class AuthorizedNumbersController < AdminController
  before_action :set_authorized_number, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @authorized_numbers = AuthorizedNumber.all
    respond_with(@authorized_numbers)
  end

  def show
    @history = @authorized_number.messages
    respond_with(@authorized_number)
  end

  def new
    @authorized_number = AuthorizedNumber.new
    respond_with(@authorized_number)
  end

  def edit
  end

  def create
    @authorized_number = AuthorizedNumber.new(authorized_number_params)
    @authorized_number.save
    respond_with(@authorized_number)
  end

  def update
    @authorized_number.update(authorized_number_params)
    respond_with(@authorized_number)
  end

  def destroy
    @authorized_number.destroy
    respond_with(@authorized_number)
  end

  private
    def set_authorized_number
      @authorized_number = AuthorizedNumber.find(params[:id])
    end

    def authorized_number_params
      params.require(:authorized_number).permit(:phone_number)
    end
end
