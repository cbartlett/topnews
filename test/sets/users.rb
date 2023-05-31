module Contexts
    module Users
  
      def create_users
        @jane    = FactoryBot.create(:user)
        @lily   = FactoryBot.create(:user, first_name: "Lily", last_name: "Cao", email: "lily@yahoo.com", password: "123456", password_confirmation: "123456")
        @frank = FactoryBot.create(:user, first_name: "Frank", last_name: "Cao", email: "frank@yahoo.com", password: "123456", password_confirmation: "123456")
      end
      
      def destroy_users
        @jane.destroy
        @lily.destroy
        @frank.destroy
      end
  
    end
  end