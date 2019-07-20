require 'date'
require 'pin_generator'
require 'pin'
require 'customer'
require 'bank_account'
require 'pin_validators/pin_validators'

pin_history = [
  Pin.new('3812'),
  Pin.new('4962'),
  Pin.new('9462'),
  Pin.new('9284')
]

customer = Customer.new(name: 'Rainer Hind', dob: Date.today)

bank_account = BankAccount.new(
  sort_code: '11-22-33',
  account_number: '123456789',
  pin_history: pin_history
)

generator = PinGenerator.new(
  customer: customer,
  bank_account: bank_account,
  validator_classes: PinValidators.all
)

15.times do
  new_pin = generator.generate
  puts new_pin.value
end
