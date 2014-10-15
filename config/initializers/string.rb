class String
  def to_b
    return true if self == "true"
    return false if self == "false"
    raise ArgumentError.new("Invalid value for boolean: \"#{self}\"")
  end
end