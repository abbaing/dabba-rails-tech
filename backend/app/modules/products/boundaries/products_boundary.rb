class ProductsBoundary < ::BaseBoundary
  def filter_by_active(filtered_entities, active)
    filtered_entities.where(active: active)
  end

  def filter_by_company(filtered_entities, company_id)
    filtered_entities.where(company_id: company_id)
  end

  def entity
    Product
  end
end
