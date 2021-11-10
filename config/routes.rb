Rails.application.routes.draw do
get("/", {:controller => "users", :action => "index"})

#user routs
get("/users", {:controller => "users", :action => "index"})
get("/users/:username", {:controller => "users", :action => "show"})
get("/insert_user_record", {:controller => "users", :action => "insert"})
get("/update_user/:user_id", {:controller => "users", :action => "update"})



#photo routes
get("/photos", {:controller => "photos", :action => "index"})
get("/photos/:photo_id", {:controller => "photos", :action => "show"})
get("/delete_photo/:photo_id", {:controller => "photos", :action => "kill"})
get("/insert_photo", {:controller => "photos", :action => "insert"})
get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})

get("/insert_comment_record", {:controller => "comments", :action => "insert"})



end
