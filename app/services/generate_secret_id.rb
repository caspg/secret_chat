class GenerateSecretId
  def self.call
    SecureRandom.uuid
  end
end
