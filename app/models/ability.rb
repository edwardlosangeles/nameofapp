# 20171005 ED 5.5 Authorization
# install cancancan
# $ rails g cancan:ability

class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        can :manage, User, id: user.id

        if user.admin?
        	can :destroy, Comment
        else
        	cannot :destroy, Comment
        end

        
    end

end
