require "active_record"

namespace :spree_packages do
  desc "Set default dimension values for existing variants"
  task :dimensions => :environment do
    %w(height width depth).each do |dimension|
      Spree::Variant.where(dimension => nil).update_all(dimension => 0.0)
    end
  end
end
