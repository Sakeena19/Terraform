# Create a new playlist on Spotify with a specific track ID
resource "spotify_playlist" "bollywood_songs" {
  name   = "Bollywood Songs"               # Name of the new playlist
  tracks = ["6R6BpMBFQrF7n2uEOxYmss"]       # List of track IDs to include in the playlist
}

# Data source to search for tracks by the artist "Arjit Singh"
data "spotify_search_track" "arjit_singh" {
  artist = "Arjit Singh"  # Artist name to search for
  limit  = 4              # Limit the search results to 4 tracks
}

# Create a new playlist on Spotify with tracks found from the search results
resource "spotify_playlist" "Favourites" {
  name   = "Favourites" # Name of the new playlist
  tracks = [
    data.spotify_search_track.arjit_singh.tracks[0].id, # ID of the first track found in the search results
    data.spotify_search_track.arjit_singh.tracks[1].id, # ID of the second track found in the search results
    data.spotify_search_track.arjit_singh.tracks[2].id, # ID of the third track found in the search results
    data.spotify_search_track.arjit_singh.tracks[3].id  # ID of the fourth track found in the search results
  ]
}
