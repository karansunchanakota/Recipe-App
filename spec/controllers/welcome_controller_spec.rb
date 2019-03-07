require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
    let(:valid_attributes) { }
    let(:invalid_attributes) { }
    let(:valid_session) { {} }

    describe '#index' do
        it 'shows the root recipe' do
            get :index
            expect(response).to be_successful
        end
    end
end