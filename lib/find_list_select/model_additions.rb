module FindListSelect
	module ModelAdditions

		def self.included(base)
			base.send :extend, ClassMethods
		end

		module ClassMethods
			def find_list(options={})
				id_column = options[:id].blank? ? :id : options.delete(:id).to_sym
				display_column = options[:display].blank? ? :name : options.delete(:display).to_sym
				active_column = options[:active].blank? ? nil : options.delete(:active)

				options[:select] = "#{self.table_name}.#{id_column}, #{self.table_name}.#{display_column}" + (active_column ? ", #{self.table_name}.#{active_column}" : "")  if options[:select].blank?
				options[:order] = (active_column ? "#{self.table_name}.#{active_column} DESC, " : "") + "#{self.table_name}.#{display_column.to_s}" unless options[:order]
				options[:order] = "#{self.table_name}.#{display_column}" unless options[:order]
				find(:all, options).map { |x| [ (active_column && eval("!x.#{active_column}?") ? '(inactive) ' : '') + x[display_column].to_s, x[id_column] ] }
			end
		end

	end
end

ActiveRecord::Base.send :include, FindListSelect::ModelAdditions