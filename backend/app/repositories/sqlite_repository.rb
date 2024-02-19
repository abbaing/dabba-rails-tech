class SqliteRepository < BaseRepository
  # The base repository abstracts all generic logic,
  # enabling specific implementations for each database type.
  # This allows for a separation of concerns, encapsulating common
  # database interactions and facilitating the development of
  # database-specific implementations. Specifically tailored for SQLite.
end
