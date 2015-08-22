require "pg"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

db_connection do |conn|
  res =conn.exec("SELECT * FROM steps")
  res.each do |item|
    puts "#{item['id']}. #{item['ingredient']}"
  end
end
