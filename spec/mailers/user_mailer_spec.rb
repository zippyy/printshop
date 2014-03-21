require "spec_helper"

describe UserMailer do
  describe "reset_password_email" do
    
    it "has a valid factory" do 
      create(:user).should be_valid
    end

    let(:user) {create(:user)}

    it "file needs testing" do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    # it "renders the headers" do
    #   # mail.subject.should eq("Your password has been reset")
    #   # mail.to.should eq(["to@example.org"])
    #   @mail.from.should eq(["password_reset@adfactor.com"])
    # end

    # it "renders the body" do
    #   # mail.body.encoded.should match("Hi")
    #    pending "add some examples to (or delete) #{__FILE__}"
    # end
  end

end
