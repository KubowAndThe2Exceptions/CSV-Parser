require 'csv'
# --FEATURE-- only process line one this way, but read all lines. Convert all info into hashes?
=begin
NOTES: First line of information is used for data specific to private user info/info about user.
Second line and beyond is public tags of interests/locations and then description
=end

# fieldsArr = CSV.open('C:\Users\Amazingg\Desktop\user_data.csv', 'r:bom|utf-8', liberal_parsing: true).first(1)
dataArr = CSV.read('C:\Users\Amazingg\Desktop\user_data.csv', liberal_parsing: true)
userFields = dataArr.first.join(' ').split('~')
userData = dataArr.drop(1).map {|arr| arr.join(' ').split('~') }
userFieldsH = userFields.to_h { |field| [field, 'empty'] }
allUsers = Array.new(userData.length)
allUsers.map! do |x|
    x = userFieldsH
end

=begin
for arr in 0..userData.length
    for field in 0..userFields.length
        userData[arr][field] do |x|
            if x.nil? then
                puts "true"
            end
        end
    end
end
=end
=begin
allUsers[0].each do |key, value|
    value.replace(userData[0][0])
end
=end
userNum = 0
field = 0
while userNum < allUsers.length
    while field < userFields.length
        allUsers[userNum][field] {|key, value| value = userData[userNum][field]}
        field += 1
    end
    userNum += 1
end


=begin
for arr in 0...allUsers.length
    allUsers[arr].each do |key, value|
        for fields in 0...userFields.length
            value = userData[arr][fields]
        end
    end
end
=end
=begin
for arr in 0...allUsers.length
    allUsers[arr].each do |key, value|
        userData[userNum].each do |x|
            value.replace(x)
        end
    end
end
=end

=begin
for arr in 0...allUsers.length
    for userNum in 0...userData.length
        for data in 0...userFields.length
            allUsers[arr].each do |key, value|
                if userData[userNum][data] == nil
                    value.replace("empty")
                else
                    value.replace(userData[userNum][data])
                end
            end
        end
    end
end
=end



=begin
content.each do |x|
    print x
end
=end
=begin
splitArr = content[0].split('~', -1)
splitArr.each do |x|
    x.concat(':')
    puts x
end
=end
=begin
splitArr = content[0].split('~', -1)
splitArr.each do |x|
    x.concat(':')
    puts x
end
=end

=begin
@filename = 'C:\Users\Amazingg\Desktop\user_data.csv'
CSV.open(@filename, 'r:bom|utf-8') do |csv|
  csv.each { |row| p row }
end
=end

=begin
# start with opening a file and printing first line to terminal.
aFile = File.open('C:\Users\Amazingg\Desktop\user_data.csv', "r+").first
aFile.sub!("\xEF\xBB\xBF", '')
CSV.foreach(aFile) { |row| p row }\

contentArr = aFile.split('~', -1)
print contentArr.last
contentArr.each do |x|
    x.concat(':')
    puts x
end
=end