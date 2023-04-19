# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.user_type == 0
      can :manage, Project, :user_id => user.id
      can :manage, UserProject

    elsif user.user_type == 1

      can :read, Project

    elsif user.user_type == 2
      can :manage, Bugg, qa_id: user.id
      can :read, UserProject, user_id: user.id
      can :read, Project, user_id: user.id
      can :read, :all
    else
      can :read, :all

    end
    # can :manage, Project
    #   can :read, User

    #   print "user.user_type == 0"
    #   print user.user_type == 0

    # elsif user.user_type == 1
    #   can :manage, Project
    #   can :read, User
    #   can :manage, Bugg, qa_id: user.id if user.user_type == 2
    #   can :read, Bugg, dev_id: user.id if user.user_type == 1

    #   print "user.user_type == 1"
    #   print user.user_type == 1

    # elsif user.user_type == 2
    #   can :manage, Project
    #   can :read, User
    #   can :manage, Bugg

    #   print "user.user_type == 2"
    #   print user.user_type == 2

    # else
    #   can :read, Project
    # end

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
