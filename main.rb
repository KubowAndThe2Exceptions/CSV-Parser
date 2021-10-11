require 'csv'
csvTable = CSV.read('C:\Users\Amazingg\Desktop\user_data.csv', liberal_parsing: true, col_sep: '~', headers: true)
hashData = csvTable.map { |x| x.to_h }
hashData.each do |h|
    puts h
end