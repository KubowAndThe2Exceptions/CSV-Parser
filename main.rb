require 'csv'

csvArray = CSV.read('C:\Users\Amazingg\Desktop\user_data.csv', liberal_parsing: true)
userFields = csvArray.first.join(' ').split('~')
userData = csvArray.drop(1).map {|arr| arr.join(' ').split('~') }
allUsers = Array.new(userData.length)
allUsers.map! do |x|
    x = userFields.to_h { |field| [field, 'empty'] }
end

user = 0
field = 0
while user < allUsers.length do
    while field < userFields.length do
        key = "#{userFields[field]}"
        value = "#{userData[user][field]}"
        allUsers[user][key] = value
        field += 1
    end
    field = 0
    user += 1
end

for user in 0...allUsers.length do
    puts "\r"    
    allUsers[user].each do |key, value|
        puts "#{key} : #{value}"
    end
end