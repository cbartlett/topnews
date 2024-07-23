require 'rails_helper'

describe User do
  let(:attrs) do
    { first_name: :foo, last_name: :bar, email: 'f@b.c', password: 'foobar123' }
  end

  let(:user) do
    User.create(attrs)
  end
  context "creating a new user" do
    it "should have first, last, email" do
      expect { User.create(attrs) }.to change{ User.count }.by(1)
    end

    it "should require a password" do
      expect(User.new(attrs.except(:password))).to be_invalid
    end
    it "should have a unique email, ignoring case" do
      user1 = User.create(attrs.tap {|h| h[:email] = h[:email].downcase })
      user2 = User.new(attrs.tap {|h| h[:email] = h[:email].upcase })
      expect(user1.persisted?).to eq true
      expect { user2.save! }.to raise_error ActiveRecord::RecordInvalid
    end
  end
  describe "#full_name" do
    it "should combine first and last name" do
      expect(User.create(attrs).full_name).to eq "foo bar"
    end
  end
end
