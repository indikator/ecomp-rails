# require 'rack_session_access/capybara'

Допустим(/^я вошел на сайт$/) do
  visit root_path
  @session = Hash.new
end

Если(/^я до этого никогда на этом сайте не был$/) do
  expect(@session[:user_id]).to be_nil
end

То(/^я вижу пустую страничку$/) do
  expect(find('#content').text).to be_empty
end

То(/^меню навигации со ссылкой на сайт и кнопкой "(.*?)"$/) do |btn_text|
  navbar = find('nav.navbar')
  expect(navbar.has_css?("a", count: 2)).to be_truthy
  expect(navbar.has_css?("a", text: "e-Competences")).to be_truthy
  expect(navbar.has_css?("a", text: btn_text)).to be_truthy
end

Если(/^я не заходил на этот сайт больше недели$/) do
  expect(@session[:user_id]).to be_nil
end

Если(/^я входил на сайт менее недели назад$/) do
  @session[:user_id] = 1
  @session[:user_role] = 1
end

Если(/^нажал кнопку "(.*?)"$/) do |arg1|
  @session[:user_id] = nil
  @session[:user_role] = nil
end

Если(/^я менее чем неделю назад заходил на этот сайт как обычный пользователь$/) do
  @session[:user_id] = 1
  @session[:user_role] = "user"
end

Если(/^не нажал кнопку "(.*?)"$/) do |arg1|
  expect(@session[:user_id]).not_to be_nil
  expect(@session[:user_role]).not_to be_nil
end

То(/^меня перенаправляет на страницу "(.*?)"$/) do |arg1|
  expect(response).to be_redirect
end

То(/^я вижу страницу с развернутыми группами компетенций$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^меню навигации со ссылкой на сайт,$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^ссылками "(.*?)", "(.*?)", "(.*?)", "(.*?)",$/) do |arg1, arg2, arg3, arg4|
  pending # express the regexp above with the code you wish you had
end

То(/^где ссылка "(.*?)" активна$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

То(/^красной кнопкой "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Если(/^я менее чем неделю назад заходил на этот сайт как администратор$/) do
  pending # express the regexp above with the code you wish you had
end

То(/^ссылками "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)",$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
  pending # express the regexp above with the code you wish you had
end

То(/^где ссылка "(.*?)" активна,$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end