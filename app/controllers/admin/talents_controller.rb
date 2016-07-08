class Admin::TalentsController < ApplicationController
  before_action :set_talent, only: [:show, :edit, :update, :destroy]

  # GET /admin/talents
  # GET /admin/talents.json
  def index
    @talents = Talent.all
  end

  # GET /admin/talents/1
  # GET /admin/talents/1.json
  def show
  end

  # GET /admin/talents/new
  def new
    @talent = Talent.new
  end

  # GET /admin/talents/1/edit
  def edit
  end

  # POST /admin/talents
  # POST /admin/talents.json
  def create
    @talent = Talent.new(talent_params)

    respond_to do |format|
      if @talent.save
        format.html { redirect_to [:admin, @talent], notice: 'データを登録しました。' }
        format.json { render :show, status: :created, location: @talent }
      else
        format.html { render :new }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/talents/1
  # PATCH/PUT /admin/talents/1.json
  def update
    respond_to do |format|
      if @talent.update(talent_params)
        format.html { redirect_to [:admin, @talent], notice: 'データを登録しました。' }
        format.json { render :show, status: :ok, location: @talent }
      else
        format.html { render :edit }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/talents/1
  # DELETE /admin/talents/1.json
  def destroy
    @talent.destroy
    respond_to do |format|
      format.html { redirect_to admin_talents_url, notice: 'データを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talent_params
      params.require(:talent).permit(:name, :code, :name_kana, :name_eng, :category_id, :birth_month, :birth_day, :prefecture_id, :hometown, :hobby, :url_hp, :url_blog, :url_tw, :url_fb, :url_ins, :masterpiece, :display_flg)
    end
end
