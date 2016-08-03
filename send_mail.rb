# Программа для отправки почты
require "pony"

my_mail = "mysc.myftp@gmail.com"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма: "
password = STDIN.gets.chomp

puts "Кому отправить письмо?"
send_to = STDIN.gets.chomp

puts "Текст письма:"
body = STDIN.gets.chomp

Pony.mail(
{
	:subject => "Hello ftom ruby!",
	:body => body,
	:to => send_to,
	:from => my_mail,

	:via => :smtp,
	:via_options => {
					:address => 'smtp.gmail.com',
					:port => '587',
					:enable_starttls_auto => true,
					:user_name => my_mail,
					:password => password,
					:authentication => :plain # обычный тип авторизации
				}
}
	)

puts "The messeage is send "