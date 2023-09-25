require 'sidekiq-scheduler'

# system_user = User.find_by(email: 'system_user@system.sys') || User.create!(name: 'system_user', email: 'system_user@system.sys', password: 'fjdsoigjwehr')
class Pity
  include Sidekiq::Worker

  def perform
    Article.all.reload.map do |article|
      Reaction.create(user_id: 6, article: article, kind: 'like') if article.pitiful?
    end
  end
end

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end