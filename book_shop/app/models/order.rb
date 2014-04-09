class Order < ActiveRecord::Base

  #Callbacks
  before_create :generate_code, :init_state

  # Asociaciones
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  # Validaciones
  validates_associated :user, on: :create
  validates :state, :code, :user_id, presence: true
  validates :code, uniqueness: true
  validates :code, format: { with: /Ref20[0-9]{2}_\d+/ }

  # Scopes
  scope :pending, -> { where(state: "pending") } # -> = lambda

  # State Machine
  state_machine initial: :pending do
    event :confirm do
      transition pending: :confirmed
      transition denied: :confirmed
    end

    event :pay do
      transition confirmed: :payed
    end

    event :send do
      transition payed: :sent
    end
  end

private
  def generate_code
    value = Order.where(created_at: Time.now.all_year).count + 1
    self.code = "Ref20#{Time.now.strftime("%y")}_#{value}"
  end

  def init_state
    self.state = "pending"
  end
end












