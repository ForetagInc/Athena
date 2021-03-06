module Leon
	module ORM
		module Collection
			macro __process_collection
				{% name_space = @type.name.gsub(/::/, "_").downcase.id %}
				{% collection = SETTINGS[:collection] || name_space + "s" %}

				@@collection_name = "{{collection}}"
				@@collection : Leon::Collection = @@database.as(Leon::Database).collection(@@collection_name)

				def self.get_collection
					@@collection_name
				end

				def self.collection(name)
					@@database.as(Leon::Database).collection(@@collection_name).delete

					SETTINGS[:collection] = name
					@@collection_name = name
					@@collection =  @@database.as(Leon::Database).collection(name)
				end

				def self.collection
					@@collection
				end

				def collection
					@@collection
				end

				def self.aql
					@@database.as(Leon::Database).aql
				end

				def aql
					@@database.as(Leon::Database).aql
				end
			end
		end
	end
end
