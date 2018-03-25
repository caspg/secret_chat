module Messages
  class Create
    include Interactor

    delegate :message_params, to: :context

    def call
      message = Message.new(message_params)

      if message.save
        context.message = message
      else
        context.fail!
      end
    end
  end
end
