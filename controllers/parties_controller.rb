class PartiesController < Sinatra::Base
  enable  :sessions


  # ***** Helpers *****
  def party_params
    return params[:party] if params[:party]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = (JSON(@request_body)) unless @request_body.empty?
    body_data = body_data['party'] || body_data
  end

  # ***** Debugging *****
  get '/pry' do
    binding.pry
  end


  # ***** Routes: /api/parties *****
  get '/' do
    parties = Party.all
    content_type :json
    parties.to_json(include: :foods)
  end

  get '/:id' do
    party = Party.find(params[:id])
    content_type :json
    party.to_json(include: :foods)
  end

  post '/' do
    party = Party.create(party_params)
    content_type :json
    party.to_json(include: :foods)
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(party_params)
    content_type :json
    party.to_json(include: :foods)
  end

  put '/:id' do
    party = Party.find(params[:id])
    party.update(party_params)
    content_type :json
    party.to_json(include: :foods)
  end

  delete '/:id' do
     Party.destroy(params[:id])
     content_type :json
     {success: "ok"}.to_json
  end









  get '/:id/receipt' do
  		content_type :json
  		party = Party.find(params[:id].to_i)
  		orders = party.orders
  		total = 0
  		tax = 0

  		start =  "    ---Restaurant---\n    	Tag Line\n     (555)555-5555\n\n"
  		start += "Table: #{party.table_num}  |  Guests: #{party.party_size}\n_______________________\nItem			   Cost\n"
  		orders.each do |order|
  			start+= "#{order.food.name}		#{order.food.price}\n"
  			total += order.food.price
  		end

  		tax = (total.to_f * 10.75 / 100).round(2)
  		tip_15 = (total.to_f * 15 / 100).to_i
  		tip_20 = (total.to_f * 20 / 100).to_i
  		tip_25 = (total.to_f * 25 / 100).to_i

  		start+= "_______________________\n			 Food: #{total}\n			 Tax: (#{tax})\n			 Tip: \n			 Total:\n(Suggested Tip)\n15% - #{tip_15}\n20% - #{tip_20}\n25% - #{tip_25}\n"
  		start += "Thank you for dining with us!\n"

  		File.write("receipt_print.txt", start)
  		File.open("receipts.txt", "a+"){|f| f << start }

  		start.to_json
  	end


  	patch '/:id/checkout' do
  		content_type :json
  		party = Party.find(params[:id].to_i)
  		party.paid = true;
  		party.to_json
  	end


  	put '/:id/checkout' do
  		content_type :json
  		party = Party.find(params[:id].to_i)
  		party.paid = true;
  		party.to_json
  	end



end
