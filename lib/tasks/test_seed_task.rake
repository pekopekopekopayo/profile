task :create_test_user do
    puts "시작시간: #{Time.zone.now}"

    begin
        ActiveRecord::Base.transaction do
            100.times do |i|
                user = User.new(email: "Hello#{i}@test.com", password: 'aAbC12asCx', authority: 'Customer')
                user.save!
            end
        end 
    rescue ActiveRecord::RecordInvalid => e
        puts "에러#{Time.zone.now}: 트랜잭션 작동 #{e}"
    end
    puts "작업 종료시간: #{Time.zone.now}"
end