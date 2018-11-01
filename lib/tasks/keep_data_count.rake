namespace :keep_data_count do
  desc "Keep data count(User = 100,Message = 500)"
  task :delete_over_count_data => :environment do
    user_max_count = 100
    overflow_user_count = User.count - user_max_count

    message_max_count = 500
    overflow_message_count = Message.count - message_max_count

    KeepDataCountTask.run(User.order(updated_at: :DESC).offset(user_max_count)) if overflow_user_count > 0
    KeepDataCountTask.run(Message.order(updated_at: :DESC).offset(message_max_count)) if overflow_message_count > 0

    puts "終了！"
  end
end

class KeepDataCountTask

  attr_accessor :items

  def self.run(items)
    new.run(items)
  end

  def initializer(items)
    @items = items
  end

  def run(items)
    items.each do |item|
      begin
        item.destroy!
      rescue e
        puts "[ERROR]削除に失敗しました。"
        puts item.inspect
        Rails.logger.error e
      end
    end
  end
end
