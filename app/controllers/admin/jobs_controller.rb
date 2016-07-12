class Admin::JobsController < ApplicationController
  before_action :check_logined, except: [:login, :auth, :logout]

  def index
@params = params[:display_flg]
    @talent = Talent.find(params[:id])

    # 更新
    if !params['name'].nil?
      params['name'].each do |id, val|
        if id.to_i > 0
          display_flg = params['display_flg'][id] ? true : false
          update_data = {"name" => params['name'][id], "sort" => params['sort'][id], "display_flg" => display_flg}
          JobCategory.update(id.to_i, update_data)
        end
      end
    end

    # 削除
    if !params['delete'].nil?
      params['delete'].each do |id, val|
        JobCategory.destroy(id)
      end
    end

    # 新規登録
    if !params['name'].nil? && !params['name']['-1'].empty? 
        display_flg = params['display_flg']['-1'] ? true : false
        new_data = {"name" => params['name']['-1'], "sort" => params['sort']['-1'], "talent_id" => params[:id], "display_flg" => display_flg}
        new_category = JobCategory.new(new_data)
        new_category.save
    end

    @categories = JobCategory.where(talent_id: params[:id]).order(sort: :asc, id: :asc)
  end

  def detail
    @talent = Talent.find(params[:id])
  end
end
