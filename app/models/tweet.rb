class Tweet < ApplicationRecord
  belongs_to :user

  def as_json(*)
    {
      id: id,
      auther: "/api/v1/users/#{user_id}",
      content: content
    }
  end
end
