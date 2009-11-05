require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CornellNetid" do
  before(:all) do
    @valid_email = 'ate2@cornell.edu'
    @invalid_email = '2ate@cornll.edu'
    @valid = 'zzz1'
    @invalid = '1zzz'
  end

  it "adds valid_net_id? instance method to String" do
    @valid.valid_net_id?.should eql(true)
    @invalid.valid_net_id?.should eql(false)
  end

  it "adds to_net_id instance method to String" do
    @valid.to_net_id.should eql 'zzz1'
    @valid_email.to_net_id.should eql 'ate2'
    @valid_email.upcase.to_net_id.should eql 'ate2'
    @invalid.to_net_id.should be_nil
    @invalid_email.to_net_id.should be_nil
  end

  it "adds to_net_ids instance method to String" do
    [ ' ', ';', '/', ',', '\\', ':' ].each do |s|
      result = "#{@valid}#{s}#{@invalid}#{s}#{@valid_email}#{s}#{@invalid_email}".to_net_ids
      result.size.should eql 2
      result.should include 'zzz1'
      result.should include 'ate2'
    end
  end

  it "adds to_net_id! instance method to String" do
    lambda { @valid_email.to_net_id! }.should_not raise_error
    @valid_email.should eql 'ate2'
    lambda { @valid.to_net_id! }.should_not raise_error
    @valid.should eql 'zzz1'
    lambda { @invalid_email.to_net_id! }.should raise_error CornellNetid::InvalidNetidError
    lambda { @invalid.to_net_id! }.should raise_error CornellNetid::InvalidNetidError
  end
end

