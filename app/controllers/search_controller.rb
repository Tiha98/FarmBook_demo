class SearchController < ApplicationController
  def index
    @q = params[:q]

    @cow_search = Cow.ransack(approxcalving_or_breed_or_identificationnumber_cont: @q)
    @field_search = Field.ransack(name_or_location_name_or_current_crop_cont: @q)

    @cows = @cow_search.result
    @fields = @field_search.result
  end
end