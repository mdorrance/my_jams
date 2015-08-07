require 'rails_helper'

describe 'the user view', type: :feature do

  let(:user) { User.create(username: 'John', password: '1234') }

  before(:each) do
    # person.phone_numbers.create(number: "555-1234")
    # person.phone_numbers.create(number: "555-5678")
    # visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

end
