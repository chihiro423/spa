require "test_helper"

class HotspringsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  private
    def post_params
      params.require(:post).permit(:カラム名, :カラム名, :image_top , images: [])
 end
 


