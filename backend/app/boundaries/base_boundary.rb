class BaseBoundary
  def find_all
    apply_filters(entities)
  end

  def find_by_id(id:)
    repository.find_by_id(id: id).tap do |found_entity|
      raise ActiveRecord::RecordNotFound unless apply_filters([found_entity]).include?(found_entity)
    end
  end

  private

  def entities
    repository.find_all
  end

  def apply_filters(entities)
    entities = filter_by_active(entities) if respond_to?(:filter_by_active)
    entities = filter_by_company(entities) if respond_to?(:filter_by_company)
    entities = filter_by_user_id(entities) if respond_to?(:filter_by_user_id)
    entities
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

  def repository
    raise NotImplementedError
  end
end
  