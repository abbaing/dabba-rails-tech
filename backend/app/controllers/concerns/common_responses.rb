module CommonResponses
    def render404
        render json: {}, status: 404
    end

    def render422(errors)
        render json: { errors: }, status: 422
    end

    def render200(data)
        render json: { data: }, status: 200
    end

    def render201(data)
        render json: { data: }, status: 201
    end

    def render_errors(item)
        render json: { errors: items.error.description }, status: 422
    end
end