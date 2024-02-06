class ProductsBoundary < BaseBoundary

  attr_reader :company_id

  def initialize(company_id)
    @company_id = company_id
  end

  private

  def filter_by_active(filtered_entities)
    filtered_entities.where(active: true)
  end

  def filter_by_company(filtered_entities)
    filtered_entities.where(company_id: company_id)
  end

  def entity
    Product
  end
end
