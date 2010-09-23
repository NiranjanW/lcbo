require 'spec_helper'
require 'yaml'

{ :product_pages      => LCBO::ProductPage,
  :store_pages        => LCBO::StorePage,
  :inventory_pages    => LCBO::InventoryPage,
  :product_list_pages => LCBO::ProductListPage
}.each_pair do |type, page|

  describe(page) do
    requests = YAML.load_file("spec/pages/#{type}.yml")

    requests.each do |req|
      body = File.read("spec/pages/#{type}/#{req[:file]}")
      req[:body] = body
      SpecHelper.hydrastub(req[:method], req[:uri], :body => req[:body])
    end

    requests.each do |req|
      context "given a #{req[:desc]}" do
        before :all do
          @page = page.process(req[:query_params], req[:body_params])
        end

        req[:expectation].each_pair do |key, value|
          it "should have the expected value for :#{key}" do
            @page[key].should == value
          end
        end
      end
    end
  end

end
