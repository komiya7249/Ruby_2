
def second_game
  puts "あっち向いて〜"
  begin
  puts "1(上)2(下)3(左)4(右)"
  @user_select_s = gets.to_i
  
  case @user_select_s
  when 1
    @user_select_s = "上"
  when 2
    @user_select_s = "下"
  when 3
    @user_select_s = "左"
  when 4
    @user_select_s = "右"
  else
    raise 
  end
  rescue 
    puts "1〜4の数字を入力してください"
  retry
  end
  
  puts "ホイ！"
  @bot_select_s = rand(1..4)
  
  case @bot_select_s
  when 1
    @bot_select_s = "上"
  when 2
    @bot_select_s = "下"
  when 3
    @bot_select_s = "左"
  when 4
    @bot_select_s = "右"
  end
  
  if @user_select_s == @bot_select_s
    @result_s = "end"
  else
    @result_s = "next"
  end
  
end


puts "じゃんけん..."

loop{

begin
  puts "1(グー)2(チョキ)3(パー)4(戦わない)"
  user_select = gets.to_i
  
  case user_select
  when 1
    user_select = "グー"
  when 2
    user_select = "チョキ"
  when 3
    user_select = "パー"
  when 4
    puts "4(戦わない)が選択されました。ゲームを終了します。"
    exit
  else
    raise 
  end
  
rescue 
  puts "1〜4の数字を入力してください"
  retry
end

puts "ホイ！"
puts "-------------------"
bot_select = rand(1..3)
#1:グー2:チョキ3:パー
case bot_select
when 1
  bot_select = "グー"
 if user_select == "グー"#あいこ
  result_f = "draw"
 elsif user_select == "チョキ" #勝ち
  result_f = "lose"
 elsif user_select == "パー" #負け
  result_f = "win"
 end
when 2 
  bot_select = "チョキ"
  if user_select == "グー"#負け
    result_f = "win"
  elsif user_select == "チョキ"#あいこ
    result_f = "draw"
  elsif user_select == "パー"#勝ち
    result_f = "lose"
  end
when 3
  bot_select = "パー"
  if user_select == "グー"#勝ち
    result_f = "lose"
  elsif user_select == "チョキ" #負け
    result_f = "win"
  elsif user_select == "パー"#あいこ
    result_f = "draw"
  end 
end

puts "あなた：#{user_select}を出しました"
puts "相手：#{bot_select}を出しました"
puts "-------------------"

case result_f
when "win"
  second_game()
  
  if @result_s == "end"
    puts "-------------------"
    puts "あなた：#{@user_select_s}"
    puts "相手:#{@bot_select_s}"
    puts "-------------------"
    puts "おめでとうございます。あなたの勝利です。"
    puts "ゲームを終了します。"
    break
  elsif @result_s == "next"
    puts "-------------------"
    puts "あなた：#{@user_select_s}"
    puts "相手：#{@bot_select_s}"
    puts "じゃんけん..."
  end
when "lose"
  second_game()
  
  if @result_s == "end"
    puts "あなた:#{@user_select_s}"
    puts "相手:#{@bot_select_s}"   
    puts "-------------------"    
    puts "相手の勝利です。"
    puts "ゲームを終了します。"
    break
  elsif @result_s == "next"
    puts "-------------------"
    puts "あなた：#{@user_select_s}"
    puts "相手：#{@bot_select_s}"
    puts "じゃんけん..."
  end
when "draw"
  puts "あいこで..."
end  
  
}