class Admin::JobsController < ApplicationController
  before_action :check_logined, except: [:login, :auth, :logout]

  def index
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
        new_data = {"talent_id" => params[:id], "name" => params['name']['-1'], "sort" => params['sort']['-1'], "display_flg" => display_flg}
        new_category = JobCategory.new(new_data)
        new_category.save
    end

    @categories = JobCategory.where(talent_id: params[:id]).order(sort: :asc, id: :asc)
  end

  def detail
@params = params
    @category = JobCategory.find(params[:id])
    @talent = Talent.find(@category.talent_id)

    # 更新
    if !params['title'].nil?
      params['title'].each do |id, val|
        if id.to_i > 0
          bold_flg = params['bold_flg'][id] ? true : false
          subtitle_flg = params['subtitle_flg'][id] ? true : false
          display_flg = params['display_flg'][id] ? true : false
          update_data = {"title" => params['title'][id], "cast" => params['cast'][id], "sort" => params['sort'][id], "bold_flg" => bold_flg, "subtitle_flg" => subtitle_flg, "display_flg" => display_flg}
          Job.update(id.to_i, update_data)
        end
      end
    end

    # 削除
    if !params['delete'].nil?
      params['delete'].each do |id, val|
        Job.destroy(id)
      end
    end

    # 新規登録
    if !params['title'].nil? && !params['title']['-1'].empty? 
        bold_flg = params['bold_flg']['-1'] ? true : false
        subtitle_flg = params['subtitle_flg']['-1'] ? true : false
        display_flg = params['display_flg']['-1'] ? true : false
        new_data = {"job_category_id" => params[:id], "title" => params['title']['-1'], "cast" => params['cast']['-1'], "sort" => params['sort']['-1'], "bold_flg" => bold_flg, "subtitle_flg" => subtitle_flg, "display_flg" => display_flg}
        new_job = Job.new(new_data)
        new_job.save
    end

    @jobs = Job.where(job_category_id: params[:id]).order(sort: :asc, id: :asc)
  end
end
