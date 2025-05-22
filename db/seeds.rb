# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# require 'open-uri'

require 'open-uri'

puts "Cleaning up database..."
Gallery.destroy_all
puts "Seeding database..."

[
  {
    artist: "Iannis Culita",
    description: "An innovative architecture artist celebrated for bold, experimental spatial designs.",
    date: "2024-10-01",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1747942145/WhatsApp_Image_2025-05-22_at_20.28.07_tglq1r.jpg"
  },
  {
    artist: "Maria Fernandez Quintana",
    description: "A seasoned theatre makeup artist crafting transformative stage looks.",
    date: "2024-10-05",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1747942458/image1_1_vqfazg.jpg"
  },
  {
    artist: "Diana Culita",
    description: "A dynamic performer blending acting and dance in expressive stage roles.",
    date: "2024-10-10",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747941925/qidmzpzaex8voqntymow.jpg"
  },
  {
    artist: "Ethan Thanner",
    description: "A charismatic musical theatre actor with a passion for storytelling through song and movement.",
    date: "2024-10-15",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1747942467/image0_1_nohenv.jpg"
  }
].each do |attrs|
  gallery = Gallery.find_or_initialize_by(artist: attrs[:artist])
  gallery.description = attrs[:description]
  gallery.date = attrs[:date]

  unless gallery.image.attached?
    file = URI.open(attrs[:image_url])
    gallery.image.attach(io: file, filename: "#{attrs[:artist].parameterize}.jpg", content_type: "image/jpeg")
  end

  gallery.save! 
end
