module Spree
  class Package < ActiveRecord::Base
    acts_as_paranoid

    after_destroy :column_reset

    validates :depth, numericality: { greater_than: 0 }
    validates :height, numericality: { greater_than: 0 }
    validates :name, presence: true, uniqueness: true
    validates :package_type, presence: true,
                             inclusion: { in: SpreePackages::TYPES }
    validates :width, numericality: { greater_than: 0 }

    default_scope { order(name: :asc) }

    protected

    def column_reset
      update_attributes(name: "#{Time.current.to_i}_#{name}")
    end
  end
end
