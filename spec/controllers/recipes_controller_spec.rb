require 'rails_helper'

RSpec.describe recipesController, type: :controller do
    let(:valid_attributes) { }
    let(:invalid_attributes) { }
    let(:valid_session) { {} }

    before do
        @user = User.create(username: 'Example', email: 'example@example.com', admin: true, password: 'password', password_confirmation: 'password')
        sign_in @user

        @recipe = recipe.create(locked: false, title: 'Title', body: 'Body')
        @recipe.save
    end

    describe '#index' do
        it 'shows the recipes index recipe' do
            get :index
            expect(response).to be_successful
        end
    end

    describe '#new' do
        it 'shows the new form recipe' do
            get :new
            expect(response).to be_successful
        end
    end

    describe '#create' do
        it 'creates a new recipe' do
            post :create, params: { recipe: { title: 'NewTitle', body: 'Body' } }
            expect(response).to be_redirect

            recipe = recipe.last
            expect(recipe.title).to eq 'NewTitle'
            expect(recipe.body).to eq 'Body'
        
        end
        it 'should fail to create a new recipe when titles are not unique' do
            post :create, params: { recipe: { title: 'Title', body: 'Fail' } }
            expect(response).to be_successful

            expect(recipe.last.body).not_to eq 'Fail'
        end
        it 'should fail to create a new recipe' do
            post :create, params: { recipe: { body: 'Fail' } }
            expect(response).to be_successful

            expect(recipe.last.body).not_to eq 'Fail'
        end
    end

    describe '#show' do
        it 'shows the specific recipe called' do
            get :show, params: { title: @recipe.title }
            expect(response).to be_successful
        end
    end

    describe '#edit' do
        it 'shows the edit form recipe' do
            get :edit, params: { title: @recipe.title }
            expect(response).to be_successful
        end
    end

    describe '#update' do
        it 'updates the recipe' do
            patch :update, params: { title: @recipe.title, recipe: { title: 'Title2', body: 'Body2' } }
            expect(response).to be_redirect

            recipe = recipe.find(@recipe.id)
            expect(recipe.title).to eq 'Title2'
            expect(recipe.prep_time).to eq 'PrepTime2'
            expect(recipe.cook_time).to eq 'CookTime2' 
            expect(recipe.servings).to eq 'Servings2' 

        end
        it 'should fail to update the recipe' do
            patch :update, params: { title: @recipe.title, recipe: { body: 'Fail' } }
            expect(response).to be_redirect
            expect(@recipe.body).not_to eq 'Fail'
        end
    end

    describe '#destroy' do
        it 'destroys a recipe' do
            delete :destroy, params: { title: @recipe.title }
            expect(response).to be_redirect
        end
    end
end
