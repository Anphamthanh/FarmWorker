class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :timeoutable

  validates_presence_of :username, :email, :role, :first_name, :last_name


  def self.search(search)
    if !(search =~ /\A[-+]?\d*\.?\d+\z/).nil?
      where(['id = :s', :s => "#{search}"])
    else
      if search
        where(['first_name LIKE :s OR last_name LIKE :s OR username LIKE :s', :s => "%#{search}%"]).order('last_name ASC')
      else
        User.all.order('last_name ASC')
      end
    end
  end

  def first_name=(s)
    write_attribute(:first_name, s.to_s.capitalize)
  end

  def last_name=(s)
    write_attribute(:last_name, s.to_s.capitalize)
  end

  
end
