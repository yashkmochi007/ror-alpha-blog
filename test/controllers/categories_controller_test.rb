require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports")
    @user = User.create(username: 'Yash', email: 'yashkmochi007@gmail.com', password:'password', admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    session[:user_id] = @user.id
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    session[:user_id] = @user.id
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "Travel" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end
  
  # test 'should redirect create when admin not logged in' do
  #   assert_no_difference 'Category.count' do
  #     post :create, category: { name: 'Sports' }
  #   end
  #   assert_redirected_to categories_url
  # end
end
