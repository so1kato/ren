require 'test_helper'

class Admin::TalentsControllerTest < ActionController::TestCase
  setup do
    @admin_talent = admin_talents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_talents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_talent" do
    assert_difference('Admin::Talent.count') do
      post :create, admin_talent: { birth_day: @admin_talent.birth_day, birth_month: @admin_talent.birth_month, category_id: @admin_talent.category_id, code: @admin_talent.code, deleted: @admin_talent.deleted, display_flg: @admin_talent.display_flg, hobby: @admin_talent.hobby, hometown: @admin_talent.hometown, masterpiece: @admin_talent.masterpiece, name: @admin_talent.name, name_eng: @admin_talent.name_eng, name_kana: @admin_talent.name_kana, prefecture_id: @admin_talent.prefecture_id, url_blog: @admin_talent.url_blog, url_fb: @admin_talent.url_fb, url_hp: @admin_talent.url_hp, url_ins: @admin_talent.url_ins, url_tw: @admin_talent.url_tw, voice_line_1: @admin_talent.voice_line_1, voice_line_2: @admin_talent.voice_line_2, voice_line_3: @admin_talent.voice_line_3, voice_line_4: @admin_talent.voice_line_4, voice_mix: @admin_talent.voice_mix, voice_narration_1: @admin_talent.voice_narration_1, voice_narration_2: @admin_talent.voice_narration_2, voice_narration_3: @admin_talent.voice_narration_3, voice_narration_4: @admin_talent.voice_narration_4, voice_other_1: @admin_talent.voice_other_1, voice_other_2: @admin_talent.voice_other_2, voice_other_3: @admin_talent.voice_other_3, voice_other_4: @admin_talent.voice_other_4, voice_talk_1: @admin_talent.voice_talk_1, voice_talk_2: @admin_talent.voice_talk_2, voice_talk_3: @admin_talent.voice_talk_3, voice_talk_4: @admin_talent.voice_talk_4 }
    end

    assert_redirected_to admin_talent_path(assigns(:admin_talent))
  end

  test "should show admin_talent" do
    get :show, id: @admin_talent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_talent
    assert_response :success
  end

  test "should update admin_talent" do
    patch :update, id: @admin_talent, admin_talent: { birth_day: @admin_talent.birth_day, birth_month: @admin_talent.birth_month, category_id: @admin_talent.category_id, code: @admin_talent.code, deleted: @admin_talent.deleted, display_flg: @admin_talent.display_flg, hobby: @admin_talent.hobby, hometown: @admin_talent.hometown, masterpiece: @admin_talent.masterpiece, name: @admin_talent.name, name_eng: @admin_talent.name_eng, name_kana: @admin_talent.name_kana, prefecture_id: @admin_talent.prefecture_id, url_blog: @admin_talent.url_blog, url_fb: @admin_talent.url_fb, url_hp: @admin_talent.url_hp, url_ins: @admin_talent.url_ins, url_tw: @admin_talent.url_tw, voice_line_1: @admin_talent.voice_line_1, voice_line_2: @admin_talent.voice_line_2, voice_line_3: @admin_talent.voice_line_3, voice_line_4: @admin_talent.voice_line_4, voice_mix: @admin_talent.voice_mix, voice_narration_1: @admin_talent.voice_narration_1, voice_narration_2: @admin_talent.voice_narration_2, voice_narration_3: @admin_talent.voice_narration_3, voice_narration_4: @admin_talent.voice_narration_4, voice_other_1: @admin_talent.voice_other_1, voice_other_2: @admin_talent.voice_other_2, voice_other_3: @admin_talent.voice_other_3, voice_other_4: @admin_talent.voice_other_4, voice_talk_1: @admin_talent.voice_talk_1, voice_talk_2: @admin_talent.voice_talk_2, voice_talk_3: @admin_talent.voice_talk_3, voice_talk_4: @admin_talent.voice_talk_4 }
    assert_redirected_to admin_talent_path(assigns(:admin_talent))
  end

  test "should destroy admin_talent" do
    assert_difference('Admin::Talent.count', -1) do
      delete :destroy, id: @admin_talent
    end

    assert_redirected_to admin_talents_path
  end
end
