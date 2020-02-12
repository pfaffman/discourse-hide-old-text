require 'rails_helper'

describe discourse-hide-old-text::ActionsController do
  before do
    Jobs.run_immediately!
  end

  it 'can list' do
    sign_in(Fabricate(:user))
    get "/discourse-hide-old-text/list.json"
    expect(response.status).to eq(200)
  end
end
