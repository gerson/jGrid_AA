ActiveAdmin.register Product, :as => 'Productizer' do
  config.filters = false
  config.paginate = false

  index :download_links => false do
    table :id => "list4"
    div :id => "pager4", :style => "height: 35px;"
  end

  controller do
    # This code is evaluated within the controller class

    def index
      #{"_search"=>"false", "nd"=>"1347245867478", "rows"=>"10", "page"=>"1", "sidx"=>"id", "sord"=>"asc", "action"=>"index", "controller"=>"admin/productizers"}
      page = params['page'];  #get the requested page
      limit = params['rows']; #get how many rows we want to have into the grid
      sidx = params['sidx'] || 'id';  #get index row - i.e. user click to sort
      sord = params['sord'] || 'DESC';  #get the direction
      records = Product.count.to_s
      if params['_search'] == 'true'
        @products = Product.where(params['searchField'] + "= ?", params['searchString']).order(sidx+" "+sord).page(page.to_i).per(limit.to_i)
      else
        @products = Product.select("id, name, supplier, quantity, next_deliver").order(sidx+" "+sord).page(page.to_i).per(limit.to_i)
      end
      
      total = @products.num_pages.to_s
      rows = []
      hash = {}
      hash2 = {}
      hash["rows"] = []
      @products.each do |p|
        hash2 = {}
        cell = [p.id.to_s, p.name.to_s, p.supplier.to_s, p.quantity.to_s, p.next_deliver.to_s, p.notes.count.to_s, "Add note", "Show note"]
        hash2["id"] = p.id
        hash2["cell"] = cell
        hash["rows"]<<hash2
      end
      @result = '{"page":'+"#{'"'+page.to_s+'"'}"+', "total":'+"#{'"'+total+'"'}"+', "records":'+"#{'"'+records+'"'}"+', "rows":'+"#{hash["rows"].to_json}"+'}'

      if request.xhr?
        render json: @result
      end

    end

  end
  
end
