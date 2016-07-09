class Admin::VoicesController < ApplicationController
  before_action :set_voice, only: [:show, :edit, :update]

  # GET /admin/voices/1
  def show
  end

  # GET /admin/voices/1/edit
  def edit
  end

  # PATCH/PUT /admin/voices/1
  def update
    respond_to do |format|
      if @talent.update(voice_params)
        format.html { redirect_to :action => "show", notice: 'データを登録しました。' }
        format.json { render :show, status: :ok, location: @talent }
      else
        format.html { render :edit }
        format.json { render json: @talent.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voice
      @talent = Talent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voice_params
      params.require(:talent).permit(:voice_mix, :voice_line_1, :voice_line_2, :voice_line_3, :voice_line_4, :voice_narration_1, :voice_narration_2, :voice_narration_3, :voice_narration_4, :voice_talk_1, :voice_talk_2, :voice_talk_3, :voice_talk_4, :voice_other_1, :voice_other_2, :voice_other_3, :voice_other_4)
    end

end
