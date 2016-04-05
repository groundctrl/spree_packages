Spree::Admin::GeneralSettingsController.class_eval do
  alias_method :original_update, :update
  def update
    params.each do |key, value|
      next unless SpreePackages::Config.has_preference?(key)

      SpreePackages::Config[key] = value
    end

    original_update
  end
end
