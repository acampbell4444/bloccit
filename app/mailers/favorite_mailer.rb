class FavoriteMailer < ApplicationMailer
  default from: "alancampbell4444@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@dry-reef-8694>"
    headers["In-Reply-To"] = "<post/#{post.id}@dry-reef-8694>"
    headers["References"] = "<post/#{post.id}@dry-reef-8694>"
    @user = user
    @post = post
    @comment = comment
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<post/#{post.id}@dry-reef-8694>"
    headers["In-Reply-To"] = "<post/#{post.id}@dry-reef-8694>"
    headers["References"] = "<post/#{post.id}@dry-reef-8694>"
    @post = post
    mail(to: post.user.email, subject: "You're following, #{post.title}!")
  end
end
