module Spree
  class Package < ActiveRecord::Base
    validates :depth, numericality: { greater_than: 0 }
    validates :height, numericality: { greater_than: 0 }
    validates :name, presence: true, uniqueness: true
    validates :package_type, presence: true,
                             inclusion: { in: SpreePackages::TYPES }
    validates :width, numericality: { greater_than: 0 }

    default_scope { order(name: :asc) }
  end
end
