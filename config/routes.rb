Rails.application.routes.draw do
get("/", {:controller => "users", :action => "index"})

#user routs
get("/users", {:controller => "users", :action => "index"})
get("/users/:username", {:controller => "users", :action => "show"})

#photo routes
get("/photos", {:controller => "photos", :action => "index"})
get("/photos/:photo_id", {:controller => "photos", :action => "show"})
get("/delete_photo/:photo_id", {:controller => "photos", :action => "kill"})


end
