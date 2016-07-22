class FavoriteMailer < ApplicationMailer
    default from: "dan.rice.92@outlook.com"
    
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@ancient-ridge-92768.herokuapp.com>"
        headers["In-Reply-To"] = "<post/#{post.id}@ancient-ridge-92768.herokuapp.com>"
        headers["References"] = "<post/#{post.id}@ancient-ridge-92768.herokuapp.com>"
        
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end