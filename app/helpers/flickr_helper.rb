module FlickrHelper
	def user_photos(user_id, photo_count = 12)
		flickr.photos.search(:user_id => user_id).first(photo_count)
	end 

	def sidebar_widget(user_id, photo_count = 12, columns = 6)
    begin
      photos = user_photos(user_id, photo_count).in_groups_of(6)
      render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
    rescue Exception
      render :partial => '/flickr/unavailable'
    end
	end

  def user_name_to_id(username)
    begin 
      flickr.people.findByUsername(:username => username).nsid
    rescue Exception 
      render :partial => '/flickr/unavailable'
    end     
  end 
end 	 			