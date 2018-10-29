class Tasks::KeepDataCount
  def self.execute

    user_count = User.count

    if user_count > 100
      User.all.order(updated_at: :ASC).each do |user|
        break if user_count <= 100
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

    if message_count > 500
      Message.all.order(updated_at: :ASC).each do |message|
        break if message_count <= 500
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
  end
end

puts "終了！"