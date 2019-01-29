class Ability
  include CanCan::Ability

  def initialize(user)
    if user.funcao == "Coordenador"
        can :manage, :all
    else
        if user.funcao == "Bolsista Pleno"
            can :manage, Equipamento
            can :manage, EstoquePeca
            can :manage, Manutencao
            can :manage, Modelo
            can :manage, Ocorrencium
            can :manage, Peca
            can :manage, Servidor
            can :manage, TermoCompromisso
        else
            if user.funcao == "Bolsista Júnior"
                can [:read], Equipamento
                can [:read], EstoquePeca
                can [:create, :read, :update], Manutencao
                can [:read], Modelo
                can [:read], Ocorrencium
                can [:read], Peca
                can [:read], Servidor
                can [:read], TermoCompromisso
            else
                can [:read], Equipamento
                can [:read], EstoquePeca
                can [:read], Manutencao
                can [:read], Modelo
                can [:read], Ocorrencium
                can [:read], Peca
                can [:read], Servidor
                can [:read], TermoCompromisso
                # can :manage, User
            end
        end
    end

    # As funções que devem existir no sistema: Coordenador, Bolsista Junior, Bolsista Pleno, Sênior e Master)

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
