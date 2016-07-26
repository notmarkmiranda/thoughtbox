require "rails_helper"

describe LinksController do
  before do
    @user = User.create(email: "a@b.com", password: "password")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "#index" do
    link = @user.links.create(title:"yup", link: "http://www.google.com")
    get :index
    expect(response).to render_template :index
    expect(assigns(:links)).to eq([link])
  end

  it "#create" do
    expect {
      post :create, {link: {title: "yup", link: "http://www.google.com"}}
    }.to change(Link, :count).by(1)
  end

  it "#create - sad path" do
    expect {
      post :create, {link: {link: "http://www.google.com"}}
    }.to_not change(Link, :count)
  end

  it "#edit" do
    link = @user.links.create(title:"yup", link: "http://www.google.com")
    get :edit, {id: link.id}
    expect(response).to render_template :edit
  end

  it "#update" do
    link = @user.links.create(title:"yup", link: "http://www.google.com")
    patch :update, {id: link.id, link: {title: "yes!"}}
    expect(assigns(:link)).to eq(link)
  end

  it "#update - sad path" do
    link = @user.links.create(title:"yup", link: "http://www.google.com")
    expect(link.title).to eq("yup")
    patch :update, {id: link.id, link: {title: ""}}
    expect(link.title).to eq("yup")
  end
end
