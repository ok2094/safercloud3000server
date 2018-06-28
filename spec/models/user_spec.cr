require "./spec_helper"
require "../../src/models/user.cr"

describe User do
  Spec.before_each do
    User.clear
  end

  describe "#authenticate" do
    user = User.find_by username: "spectest"
    pw = "test"
    it "is true when the password is correctly decrypted" do
      pw.should be_true
    end
  end
end
