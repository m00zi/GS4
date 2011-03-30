require 'test_helper'

class SipPhoneTest < ActiveSupport::TestCase
  # testing sip_phone requires provisioning_server to be accessible
  
  should "not be valid without a phone_id if it has a provisioning_server_id" do
    assert ! Factory.build( :sip_phone, :phone_id => nil ).valid?
  end
  
  should "be valid with a phone_id if it has a provisioning_server_id" do
    assert Factory.build( :sip_phone, :phone_id => 99999 ).valid?
  end
  
  should "not be valid without a provisioning_server_id" do
    assert ! SipPhone.new( :provisioning_server_id => nil, :phone_id => nil ).valid?
  end
  
  should "not be possible to set a provisioning_server_id that does not exist" do
    prov_server = Factory.create( :provisioning_server )
    prov_server_id = prov_server.id
    prov_server.destroy
    assert ! Factory.build( :sip_phone, :provisioning_server_id => prov_server_id ).valid?
  end
  
  should "be unique on provisioning_server" do
    sip_phone = Factory.create( :sip_phone )
    assert ! Factory.build( :sip_phone, {
      :provisioning_server_id => sip_phone.provisioning_server_id,
      :phone_id               => sip_phone.phone_id,
    }).valid?
  end
  
end
