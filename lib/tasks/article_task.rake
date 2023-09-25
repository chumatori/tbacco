namespace :article do
  desc 'Ban article'
  task ban: :environment do
    Article.find_by(id: ENV['id']).ban!
  end
end