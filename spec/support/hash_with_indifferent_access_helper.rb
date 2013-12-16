module ActiveSupport
  class HashWithIndifferentAccess < Hash
    def ==(other)
      super(other.with_indifferent_access)
    end
  end
end
