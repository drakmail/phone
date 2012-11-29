require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class RussianPhoneTest < Phoner::TestCase
  def test_russian_phone_with_plus_seven
    phone = "+7(925)230-23-66"
    assert_not_nil Phoner::Phone.parse(phone)
    assert Phoner::Phone.valid?(phone)
  end
  
  def test_russian_phone_with_eight
    phone = "8(925)230-23-66"
    assert_not_nil Phoner::Phone.parse(phone)
    assert Phoner::Phone.valid?(phone)
  end
  
  def test_invalid_russian_number
    phone = "[7,8](925)230-23-66"
    assert_nil Phoner::Phone.parse(phone)
    assert (not Phoner::Phone.valid?(phone))
    
    phone = "78(925)230-23-66"
    assert_nil Phoner::Phone.parse(phone)
    assert (not Phoner::Phone.valid?(phone))
    
    phone = "+7,8(925)230-23-66"
    assert_nil Phoner::Phone.parse(phone)
    assert (not Phoner::Phone.valid?(phone))
    
    phone = "7,8(925)230-23-66"
    assert_nil Phoner::Phone.parse(phone)
    assert (not Phoner::Phone.valid?(phone))
  end

end