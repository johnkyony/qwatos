class AddingToArtist < ActiveRecord::Migration
  def change
    add_column :artists , :youtube_channel , :string
    add_column :artists , :sound_cloud , :string
    add_column :artists , :avatar_url , :string
  end
end
