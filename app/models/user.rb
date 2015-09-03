class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  
  attr_accessor :stripe_card_token #pega o valor de campo hidden do form.
  
  def save_with_payment
    if valid? #verifica a validação do formulário.
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id # id retornado pelo stripe. A coluna stripe_customer_token ainda será criada mais adiante no banco de dados
      save! # Salva no banco de dados, mas falta criar uma coluna.
    end
  end

end
