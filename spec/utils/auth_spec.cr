require "../spec_helper"

describe Auth do
  describe "#generate" do
    it "should equal the encoded token" do
      ("1").should eq "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEifQ.BgsMDoEgpNzRWgqC8txgauydwUrJLrHAtu5QijHDyAc"
    end
  end

  describe "#decode" do
    it "should equal 1" do
      ("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEifQ.BgsMDoEgpNzRWgqC8txgauydwUrJLrHAtu5QijHDyAc").should eq "1"
    end
  end
end
