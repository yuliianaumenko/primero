class PrimeroModule < CouchRest::Model::Base

  use_database :primero_module

  include RapidFTR::Model
  include Namable #delivers "name" and "description" fields

  property :program_id
  property :associated_record_types, :type => [String]
  property :associated_form_ids, :type => [String]

  #TODO: I18n this
  validates_presence_of :program_id, :message => I18n.t("errors.models.primero_module.program")
  validates_presence_of :associated_form_ids, :message => I18n.t("errors.models.primero_module.associated_form_ids")
  validates_presence_of :associated_record_types, :message => I18n.t("errors.models.primero_module.associated_record_types")

end