class Admin::TalentsController < ApplicationController

  before_action :set_talent, only: [:show, :edit, :update, :destroy]
  before_action :set_params

  # GET /admin/talents
  # GET /admin/talents.json
  def index
    @mypage = "タレント一覧"
    @talents = Talent.all
  end

  def female
    category_list 1
  end

  def male
    category_list 2
  end

  def girl
    category_list 3
  end

  def boy
    category_list 4
  end

  def memoriam
    category_list 5
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

  def csv
    checks = params['check'].delete_if {|key, val| val == '0' }.keys
    talents = Talent.find(checks)
    csv = TalentCsvBuilder::TalentCsvOutput.new
    csv.setParam('category_list', @category_list)
    send_data(csv.output(talents), filename: 'talent_' + Time.now.strftime("%Y%m%d%H%M") + '.csv', disposition: 'attachment')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talent
      @talent = Talent.find(params[:id])
    end

    def set_params
      @display_list = {true => '表示', false => '非表示'}
      @category_list = {1 => '女性タレント', 2 => '男性タレント', 3 => '女性ジュニア', 4 => '男性ジュニア', 5 => 'Memoriam'}
      @prefecture_list = {1 => '北海道', 2 => '青森県', 3 => '岩手県', 4 => '宮城県', 5 => '秋田県', 6 => '山形県', 7 => '福島県', 8 => '茨城県', 9 => '栃木県', 10 => '群馬県', 11 => '埼玉県', 12 => '千葉県', 13 => '東京都', 14 => '神奈川県', 15 => '新潟県', 16 => '富山県', 17 => '石川県', 18 => '福井県', 19 => '山梨県', 20 => '長野県', 21 => '岐阜県', 22 => '静岡県', 23 => '愛知県', 24 => '三重県', 25 => '滋賀県', 26 => '京都府', 27 => '大阪府', 28 => '兵庫県', 29 => '奈良県', 30 => '和歌山県', 31 => '鳥取県', 32 => '島根県', 33 => '岡山県', 34 => '広島県', 35 => '山口県', 36 => '徳島県', 37 => '香川県', 38 => '愛媛県', 39 => '高知県', 40 => '福岡県', 41 => '佐賀県', 42 => '長崎県', 43 => '熊本県', 44 => '大分県', 45 => '宮崎県', 46 => '鹿児島県', 47 => '沖縄県', 50 => 'その他'}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talent_params
      params.require(:talent).permit(:name, :code, :name_kana, :name_eng, :category_id, :birth_month, :birth_day, :prefecture_id, :hometown, :hobby, :url_hp, :url_blog, :url_tw, :url_fb, :url_ins, :image1, :image2, :masterpiece, :display_flg)
    end

    def category_list (category_id)
      @mypage = @category_list[category_id] + "一覧"
      @talents = Talent.where('category_id = ' + category_id.to_s)
      render 'index'
    end
end
