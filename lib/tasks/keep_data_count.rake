namespace :keep_data_count do
  desc "Keep data count(User = 100,Message = 500)"
  task :delete_over_count_data => :environment do
    user_count = User.count
    user_max_count = 100

    if user_count > user_max_count
      User.all.order(updated_at: :ASC).each do |user|
        break if user_count <= user_max_count
        begin
          user.destroy!
        rescue e
          puts "[ERROR]削除に失敗しました。"
          puts user.inspect
          Rails.logger.error e
          next
        end
        user_count -= 1
      end
    end

    message_count = Message.count
    message_max_count = 500

    if message_count > message_max_count
      Message.all.order(updated_at: :ASC).each do |message|
        break if message_count <= message_max_count
        begin
          message.destroy!
        rescue e
          puts "[ERROR]削除に失敗しました。"
          puts message.inspect
          Rails.logger.error e
          next
        end
        message_count -= 1
      end
    end
    puts "終了！"
  end
end
