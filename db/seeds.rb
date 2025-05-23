# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# require 'open-uri'

require 'open-uri'

puts "Cleaning up database..."
Gallery.destroy_all
puts "Seeding database..."

galleries = [
  {
    artist: "Iannis Culita",
    description: "An innovative architecture artist celebrated for bold, experimental spatial designs.",
    date: "2024-10-01",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747942145/WhatsApp_Image_2025-05-22_at_20.28.07_tglq1r.jpg",
    photo_urls: [
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993528/WhatsApp_Image_2025-05-22_at_19.41.17_nt9rej.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993520/WhatsApp_Image_2025-05-22_at_19.41.20_u3iouc.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993615/WhatsApp_Image_2025-05-22_at_19.41.24_wzvxwd.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993511/WhatsApp_Image_2025-05-22_at_19.41.23_yievmv.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747929904/ytppvyxk8sgbzhorwikw.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747930164/hvfwli2cmednrmthtye9.jpg"
    ]
  },
  {
    artist: "Maria Fernandez Quintana",
    description: "A seasoned theatre makeup artist crafting transformative stage looks.",
    date: "2024-10-05",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747942458/image1_1_vqfazg.jpg",
    photo_urls: [
      "https://res.cloudinary.com/demo/image/upload/sample.jpg"
    ]
  },
  {
    artist: "Diana Culita",
    description: "A dynamic performer blending acting and dance in expressive stage roles.",
    date: "2024-10-10",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747941925/qidmzpzaex8voqntymow.jpg",
    photo_urls: [
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993856/image4_1_vmmsvk.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993812/image3_1_lgyiul.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993800/image2_1_tdhlmh.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993824/IMG_3560_fw2m3x.jpg",
      "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747993883/image1_2_pymrul.jpg"
    ]
  },
  {
    artist: "Ethan Thanner",
    description: "A charismatic musical theatre actor with a passion for storytelling through song and movement.",
    date: "2024-10-15",
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/v1747942467/image0_1_nohenv.jpg",
    photo_urls: [
      "https://res.cloudinary.com/demo/image/upload/sample.jpg"
    ]
  }
]

galleries.each do |attrs|
  gallery = Gallery.find_or_initialize_by(artist: attrs[:artist])
  gallery.description = attrs[:description]
  gallery.date = attrs[:date]

  # Attach main image
  unless gallery.image.attached?
    main_file = URI.open(attrs[:image_url])
    gallery.image.attach(io: main_file, filename: "#{attrs[:artist].parameterize}-main.jpg", content_type: "image/jpeg")
  end

  gallery.save!

  # Attach additional photos
  if gallery.photos.blank?
    attrs[:photo_urls].each_with_index do |url, i|
      file = URI.open(url)
      gallery.photos.attach(io: file, filename: "#{attrs[:artist].parameterize}-#{i + 1}.jpg", content_type: "image/jpeg")
    end
  end
end

puts "Seeding completed!"
