# 20171115 6.3 Functional Tests

require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@user1 = FactoryBot.create(:user)
 		@admin1 = FactoryBot.create(:admin)
 		@product1 = FactoryBot.create(:product)
	end

	context 'Get #index' do
		it 'renders the index template' do
			get :index
			expect(response).to be_ok
			expect(response).to render_template('index')
		end
	end # context 'Get #index'

	context 'Get #show' do
		it 'renders the show template' do
			get :show, params: { id: @product1.id }
			expect(response).to be_ok
			expect(response).to render_template('show')
		end
	end # context 'Get #show'
	
	context 'Get #new' do
	
		context 'when a user is not logged in' do
			it 'redirects to login screen' do
				get :new
				expect(response).to_not be_ok
				expect(response).to redirect_to(new_user_session_path)
			end
		end # context 'when a user is not logged in'

		context 'when a nonadmin is logged in' do
			before do
				sign_in @user1
			end
			it 'redirects to root path' do
				get :new
				expect(response).to_not be_ok
				expect(response).to redirect_to(root_path)
			end
		end # context 'when a nonadmin is logged in'

		context 'when an admin is logged in' do
			before do
				sign_in @admin1
			end
			it 'successfully loads template' do
				get :new
				expect(response).to be_ok
				expect(response).to render_template('new')
			end
		end # context 'when an admin is logged in'

	end # context 'Get #new'

	context 'Get #edit' do
	
		context 'when a user is not logged in' do
			it 'redirects to login screen' do
				get :edit, params: { id: @product1.id }
				expect(response).to_not be_ok
				expect(response).to redirect_to(new_user_session_path)
			end
		end # context 'when a user is not logged in'

		context 'when a nonadmin is logged in' do
			before do
				sign_in @user1
			end
			it 'redirects to root path' do
				get :edit, params: { id: @product1.id }
				expect(response).to_not be_ok
				expect(response).to redirect_to(root_path)
			end
		end # context 'when a nonadmin is logged in'

		context 'when an admin is logged in' do
			before do
				sign_in @admin1
			end
			it 'successfully loads template' do
				get :edit, params: { id: @product1.id }
				expect(response).to be_ok
				expect(response).to render_template('edit')
			end
		end # context 'when an admin is logged in'

	end # context 'Get #edit'

	context 'Post #create' do
	
		context 'with valid params' do
			it 'saves product to database' do
				before = Product.all.length
				post :create, params: { product: {name: "name", description: "description", color: "color" }}
				after = Product.all.length
				expect(response.status).to eq 302
				expect(response).to redirect_to(products_path)
				expect(after).to eq (before + 1)
			end
		end # context 'with valid params'

		context 'with invalid params' do
			it 'does not save product to database' do
				before = Product.all.length
				post :create, params: { product: {description: "description", color: "color" }}
				after = Product.all.length
				expect(response.status).to eq 200
				expect(response).to render_template('new')
				expect(after).to eq (before)
			end
		end # context 'with invalid params'

	end # context 'Post #create'

	context 'Patch #update' do
	
		context 'with valid params' do
			it 'saves existing product to database' do
				before = Product.all.length
				patch :update, params: { id: @product1.id, product: { color: "new color" } }
				after = Product.all.length
				expect(response.status).to eq 302
				expect(response).to redirect_to(@product)
				expect(after).to eq (before)
			end
		end # context 'with valid params'

		context 'with invalid params' do
			it 'does not save existing product to database' do
				before = Product.all.length
				patch :update, params: { id: @product1.id, product: { name: "" } }
				after = Product.all.length
				expect(response.status).to eq 200
				expect(response).to render_template('edit')
				expect(after).to eq (before)
			end
		end # context 'with invalid params'

	end # context 'Patch #update'

	context 'Delete #destroy' do

		context 'when an admin is logged in' do
			before do
				sign_in @admin1
			end
			it 'successfully remove product from db' do
				before = Product.all.length
				delete :destroy, params: { id: @product1.id }
				after = Product.all.length
				expect(response.status).to eq 302
				expect(response).to redirect_to(products_url)
				expect(after).to eq (before - 1)
			end
		end # context 'when an admin is logged in'

		context 'when a nonadmin is logged in' do
			before do
				sign_in @user1
			end
			it 'redirects to root path' do
				before = Product.all.length
				delete :destroy, params: { id: @product1.id }
				after = Product.all.length
				expect(response.status).to eq 302
				expect(response).to redirect_to(root_path)
				expect(after).to eq (before)
			end
		end # context 'when a nonadmin is logged in'

		context 'when a user is not logged in' do
			it 'redirects to login screen' do
				before = Product.all.length
				delete :destroy, params: { id: @product1.id }
				after = Product.all.length
				expect(response.status).to eq 302
				expect(response).to redirect_to(new_user_session_path)
				expect(after).to eq (before)
			end
		end # context 'when a user is not logged in'

	end # context 'Delete #destroy'

end # describe ProductsController