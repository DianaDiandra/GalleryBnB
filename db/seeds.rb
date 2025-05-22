# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'open-uri'

# artists = [
#   {
#     name: "Lena Morandi",
#     bio: "A self-taught Italian painter who explores abstraction with vibrant palettes.",
#     image_url: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800&q=80&auto=format",
#     created_at: "2024-11-01"
#   },
#   {
#     name: "Theo Marquez",
#     bio: "A former architect turned sculptor, crafting minimalist stone forms.",
#     image_url: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800&q=80&auto=format",
#     created_at: "2024-12-15"
#   },
#   {
#     name: "Amira Solé",
#     bio: "Blending Berber tradition with digital textures to preserve memory.",
#     image_url: "https://images.unsplash.com/photo-1581368125306-27b0c8391d83?w=800&q=80&auto=format",
#     created_at: "2025-01-10"
#   }
# ]

# artists.each do |attrs|
#   artist = Artist.find_or_create_by!(name: attrs[:name]) do |a|
#     a.bio = attrs[:bio]
#     a.created_at = attrs[:created_at]
#   end

#   next if artist.image.attached?

#   file = URI.open(attrs[:image_url])
#   artist.image.attach(io: file, filename: "#{attrs[:name].parameterize}.jpg", content_type: 'image/jpeg')
#   artist.touch(:created_at)
#   puts "Seeded artist: #{artist.name}"
# end
