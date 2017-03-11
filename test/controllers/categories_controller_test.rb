require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name:  "sports")
    #inicializar var to admin
    @user = User.create(username: "Luis", email: "luisfortest@gmail.com", password: "pass", admin: true)
  end

  test "should get categories index" do
  	get :index
  	assert_response :success
  end

  test "should get new" do
    # valid admin session hash 
    session[:user_id] = @user.id
  	get :new 
  	assert_response :success
  end

  test "should get show" do
   get(:show , params: {'id' => @category.id} )
   assert_response :success
  end

  test "should redirect create when admin not longged in" do 
    assert_no_difference 'Category.count' do 
      post :create,  category: {name:  "sports"}
    end
    assert_redirected_to categories_path
  end

end
