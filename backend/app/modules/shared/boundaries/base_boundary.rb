class BaseBoundary

    def find_all
        filtered_entities = filter_by_active(entities)
            if respond_to?(:filter_by_active)
        filtered_entities = filter_by_company(filtered_entities)
            if respond_to?(:filter_by_company)
        filtered_entities = filter_by_user_id(filtered_entities)
            if respond_to?(:filter_by_user_id)
        filtered_entities
    end

    def find_by_id(id:)
        entity.find(id)
    end

    private

    def entities
        entity.all
    end

    def filter_by_active(filtered_entities)
        raise NotImplementedError
    end

    def filter_by_company(filtered_entities)
        raise NotImplementedError
    end

    def filter_by_user_id(filtered_entities)
        raise NotImplementedError
    end

    def entity
        raise NotImplementedError
    end
end