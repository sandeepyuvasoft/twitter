# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  attr_accessor :profile

  has_many :my_tweets, class_name: 'Tweet'

  has_many :follower_recs, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: 'follower_recs'

  has_many :followee_recs, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: 'followee_recs'

  def tweets
    ids = followees.pluck(:id) << id
    Tweet.where(user_id: ids)
  end
end
