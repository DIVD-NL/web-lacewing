# String#tainted? was removed in Ruby 3.2; Liquid 4.x still calls it.
# This stub restores the method as a no-op so Jekyll builds on Ruby 3.2+.
unless String.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end
  end
end
