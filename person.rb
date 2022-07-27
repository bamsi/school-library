class Person
    attr_accessor :name
    attr_accessor :age
    attr_reader :id

    def initialize(name = 'unkonwn', age, parent_permission: true)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    private
    def is_of_age?
        (@age >= 18)
    end

    public
    def can_use_services?
        is_of_age? || @parent_permission
    end
end
