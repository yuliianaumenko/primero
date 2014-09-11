module ImportActions
  extend ActiveSupport::Concern

  def create_new_model(attributes={})
    self.model_class.create(attributes)
  end

  def get_unique_instance(attributes)
    self.model_class.get(attributes['id'])
  end

  def update_existing_model(instance, attributes)
    instance.attributes = attributes
  end

  def import_file
    if params[:import_file].is_a? ActionDispatch::Http::UploadedFile
      file = params[:import_file]
      type = params[:import_type] || file.original_filename.split('.')[-1]

      importer = Importers::ACTIVE_IMPORTERS.select {|imp| imp.id == type}.first
      if importer.nil?
        flash[:error] = t('imports.unknown_type')
        redirect_to :action => :index and return
      end

      begin
        handle_import(file.tempfile, importer)
      rescue TypeError => e
        flash[:error] = t("imports.error", error: e)
        redirect_to :action => :index and return
      end

      flash[:notice] = t('imports.successful')
      redirect_to :action => :index
    else
      flash[:error] = t('imports.file_missing')
      redirect_to :action => :index
    end
  end

  def handle_import(upload_file, importer)
    model_data = importer.import(upload_file)

    model_data.map do |d|
      (get_unique_instance(d) || create_new_model()).tap do |inst|
        model_type = d.delete('model_type')
        if inst.class.name != model_type
          raise TypeError("Import data model_type field is #{model_type}, expected #{inst.class.name}")
        end

        self.update_existing_model(inst, d)
      end
    end.each {|m| m.save! }
  end

end