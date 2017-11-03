# 20171005 ED 5.5 Authorization
# install cancancan
# $ rails g cancan:ability

class Ability
    include CanCan::Ability

		# original
    # def initialize(user)
    #     user ||= User.new # guest user (not logged in)
    #     can :manage, User, id: user.id
    # end

    #20171029 5.10 Admin Role & Moderating User Comments
    #but cannot get this to work
    def initialize(user)
    	user ||= User.new # guest user (not logged in)	    

	    if user.admin?
	    	can :manage, :all
	    else
	    	can :manage, User, id: user.id
	    	# cannot :destroy, :all
	    end
  	end


end
