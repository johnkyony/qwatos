require 'csv'


Artist.delete_all
CSV.foreach(Rails.root.join("db/seeds_data/artists.csv"), headers: true) do |row|
 Artist.create(name: row[0])
end


Qwato.delete_all
CSV.foreach(Rails.root.join("db/seeds_data/Qwatos.csv"), headers: true) do |row|
  artist = Artist.find_by name: row[0]
 Qwato.create(artist_id: artist.id , quote: row[1], image_url: row[2], uploaded_at: row[3])
end