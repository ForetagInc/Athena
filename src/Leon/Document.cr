require "./client"

module Leon
	class Document
		@client : Leon::Client

		getter client

		def initialize(@client, @database : String, @collection : String); end

		def get(id : String)
			@client.get("/_db/#{@database}/_api/document/#{@collection}/#{id}")
		end

		def head(id : String)
			@client.head("/_db/#{@database}/_api/document/#{@collection}/#{id}")
		end

		def create(body : Hash | Array | JSON::Any, urlParams = "")
			@client.post("/_db/#{@database}/_api/document/#{@collection}?#{urlParams}", body)
		end

		def update(id : String, body : Hash | Array | JSON::Any, urlParams = "")
			@client.patch("/_db/#{@database}/_api/document/#{@collection}/#{id}", body)
		end

		def delete(id : String)
			@client.delete("/_db/#{@database}/_api/document/#{@collection}/#{id}")
		end

		def delete(ids : Array)
			@client.delete("/_db/#{@database}/_api/document/#{@collection}", ids)
		end

	end
end
