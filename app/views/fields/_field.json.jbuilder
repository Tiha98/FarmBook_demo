json.extract! field, :id, :name, :location_name, :location_latitude, :location_longitude, :current_crop, :sowing_date, :harvest_date, :size, :fertilizer, :fertilizer_type, :fertilizer_usage, :leased, :leasing_end_date, :created_at, :updated_at
json.url field_url(field, format: :json)
