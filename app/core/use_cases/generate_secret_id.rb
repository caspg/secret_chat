module UseCases
  class GenerateSecretId
    def self.perform
      SecureRandom.uuid
    end
  end
end
