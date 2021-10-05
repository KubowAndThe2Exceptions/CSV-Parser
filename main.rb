require 'csv'
# --FEATURE-- only process line one this way, but read all lines. Convert all info into hashes?
=begin
NOTES: First line of information is used for data specific to private user info/info about user.
Second line and beyond is public tags of interests/locations and then description
=end

dataArr = CSV.read('C:\Users\Amazingg\Desktop\user_data.csv', liberal_parsing: true)
userFields = dataArr.first.join(' ').split('~')
userData = dataArr.drop(1).map {|arr| arr.join(' ').split('~') }
allUsers = Array.new(userData.length)
allUsers.map! do |x|
    x = userFields.to_h { |field| [field, 'empty'] }
end

userNum = 0
field = 0
while userNum < allUsers.length do
    while field < userFields.length do
        allUsers[userNum]["#{userFields[field]}"] = "#{userData[userNum][field]}"
        field += 1
    end
    field = 0
    userNum += 1
end

for user in 0...allUsers.length do
    puts "\r"    
    allUsers[user].each do |key, value|
        puts "#{key} : #{value}"
    end
end