class UpdateXudtInfoWithUniqueCellWorker
  include Sidekiq::Worker
  sidekiq_options queue: "low"

  def perform(xudt_type_hash, unique_cell_data)
    udt = Udt.find_by(type_hash: xudt_type_hash)
    if udt && udt.symbol.blank? && udt.full_name.blank? && udt.decimal.blank?
      info = CkbUtils.parse_unique_cell(unique_cell_data)
      udt.update!(full_name: info[:name], symbol: info[:symbol], decimal: info[:decimal], published: true)
    end
  end
end
