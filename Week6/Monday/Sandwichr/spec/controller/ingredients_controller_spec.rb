require 'rails_helper'

RSpec.describe IngredientsController , type: :controller do

describe "GET /ingredients" do
  it "should show a path" do
    get :index


    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template("ingredients/index")
  end
end


describe "GET #show" do
  it "shows an ingredient" do
    ingredient = Ingredient.create(name: "Mustard", calories: 80)
    get :show, {id: ingredient.id}
    expect(response).to be_success
    expect(response).to render_template("ingredients/show")
    ingredient.destroy
  end
  it "returns 404 when ingredient does not exist" do
    get :show, {id: 10000}
    expect(response).to have_http_status(404)
  end
end

describe "POST #create" do
  it "creates an ingredient" do
    expect {
      post :create, {ingredient: {name: 'Carrot', calories: 123}}
    }.to change(Ingredient, :count).by(1)

  end
end

describe "POST #destroy" do
  it "deletes an ingredient" do
    ingredient = Ingredient.create(name: "Mustard", calories: 80)

    expect {
      delete :destroy, {id: ingredient.id}
    }.to change(Ingredient, :count).by(-1)



  end
end





# describe "GET /ingredients" do
#   before {@ingredients = Ingredient.create name: "Mustard"}
#   it "returns a list of ingredients" do
#   get ingredients_path(format: :json)
#   data = JSON.parse(response.body)
#   expect(response).to have_http_status(200)
#   expect(data.length).to eq("Mustard")
# end
# end

end
