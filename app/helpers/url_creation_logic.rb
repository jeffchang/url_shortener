def url_creation_logic
  submitted_url = Url.where(url: params[:url])
  if submitted_url.empty?
    @short_url = (params[:short_url] = SecureRandom.hex(6)) 
    params[:click_count] = 0
    if Url.create(params).id.nil?
      @corrected_url = "http://" + params[:url]
      erb :invalid_url
    else
      erb :create
    end
  else
    @short_url = submitted_url.first.short_url
    erb :create
  end
end