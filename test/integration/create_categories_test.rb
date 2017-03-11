require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    #inicializar var to admin
    @user = User.create(username: "Luis", email: "luisfortest@gmail.com", password: "pass", admin: true)
  end

  test "get new categorie form and create category" do
  	sign_in_as(@user, "pass")
    get new_category_path
    assert_template 'categories/new'

    assert_difference 'Category.count', 1 do
  	  post_via_redirect categories_path, category: {name: "sports"}
  	end  
  	assert_template 'categories/index'
  	assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do 
  	sign_in_as(@user, "pass")
  	get new_category_path
    assert_template 'categories/new'

    assert_no_difference 'Category.count' do
  	  post categories_path, category: {name: " "}
  	end  
  	assert_template 'categories/new'
  	assert_select 'h2.panel-title'
  	assert_select 'div.panel-body'
  end	

end
