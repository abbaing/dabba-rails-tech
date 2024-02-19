class BaseRepository
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def find_all
    entities
  end

  def find_by_id(id:)
    entities.find(id)
  end

  delegate :find_or_create_by, :find_or_initialize_by, :find_by, :all, to: :entity
  delegate :create, :new, :where, to: :entity
  delegate :update, :update!, :save, :save!, :destroy, :destroy!, to: :data

  private

  def entity
    raise NotImplementedError, 'Subclasses must implement `entity` method'
  end

  def entities
    entity.all
  end
end
