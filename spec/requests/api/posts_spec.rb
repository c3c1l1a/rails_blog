require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  path '/api/v1/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'Author Id'

    get('list posts') do
      consumes 'application/json'

      response(200, '') do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            text: { type: :string },
            author_id: { type: :integer },
            comments_counter: { type: :integer },
            likes_counter: { type: :integer },
            created_at: { type: :string },
            updated_at: { type: :string }
          },
          required: [ 'title', 'text' ]

        let(:user_id) { 1 }

        run_test!

      end

      response(404, 'No posts found') { run_test! }
    end
  end
end