class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :played_relationships, foreign_key: "user_id" #, :dependent => :destroy
  has_many :games, through: :played_relationships

  def played?(game)
    self.played_relationships.find_by_game_id(game.id)
  end

  def played!(game)
    #if session[:access_token]
    #  render session[:authenticity_token].inspect
    #end


      self.played_relationships.create!(game_id: game.id)
  end

  def unplayed!(game)
    self.played_relationships.find_by_game_id(game.id).destroy
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end
