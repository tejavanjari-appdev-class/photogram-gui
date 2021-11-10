class CommentsController < ApplicationController
  def insert
    #input_photo_id=952&input_author_id=34&input_body=23
    photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    body = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = body

    new_comment.save

    redirect_to("/photos/"+photo_id.to_s)
  end
end