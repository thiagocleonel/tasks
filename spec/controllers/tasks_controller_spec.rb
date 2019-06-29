require 'rails_helper'
RSpec.describe TasksController, type: :controller do
  describe 'User with account' do

    let(:user) { User.create!(email: 'a@gmail.com', password:'123123') }
    let(:task) { Task.create!(user: user, title: 'Title 1', description: 'Description',delivery: Time.now )}

    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(user)
    end

    describe "#index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe ' #create' do
      it 'returns http success' do
        post :create, params: {
          task: {
            title: 'title 1',description: 'description 1',
            delivery: '2019-06-29 03:06:13',satus: 0
          }
        }
        expect(response).to have_http_status(302)
        expect(Task.last.description).to eq('description 1')
      end
    end

    describe '#update' do
      it 'returns http success' do
          task.id
          put :update, params: { id: task.id,
            task: {id: task.id,description: 'description 2'}
          }
          expect(response).to have_http_status(302)
          expect(task.reload.description).to eq('description 2')
      end
    end

    describe '#destroy' do
      it 'redirect' do
          delete :destroy, params: { id: task.id }
          expect(response).to have_http_status(302)
      end
    end

  end
end
