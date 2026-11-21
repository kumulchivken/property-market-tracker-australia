CREATE TABLE IF NOT EXISTS properties (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  nickname TEXT NOT NULL,
  address TEXT NOT NULL,
  property_type TEXT NOT NULL,
  suburb TEXT NOT NULL,
  state TEXT NOT NULL,
  postcode TEXT NOT NULL,
  notes TEXT NOT NULL DEFAULT '',
  archived_at TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_properties_user ON properties(user_id, archived_at);

CREATE TABLE IF NOT EXISTS property_values (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  property_id TEXT NOT NULL,
  value_amount REAL NOT NULL,
  value_date TEXT NOT NULL,
  source TEXT NOT NULL,
  value_type TEXT NOT NULL DEFAULT 'user_entry',
  notes TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL,
  UNIQUE(user_id, property_id, value_amount, value_date, source),
  FOREIGN KEY(property_id) REFERENCES properties(id)
);
CREATE INDEX IF NOT EXISTS idx_property_values_history ON property_values(user_id, property_id, value_date);

CREATE TABLE IF NOT EXISTS macro_observations (
  user_id TEXT NOT NULL,
  metric TEXT NOT NULL,
  period TEXT NOT NULL,
  value REAL NOT NULL,
  unit TEXT NOT NULL,
  release_date TEXT NOT NULL,
  source_url TEXT NOT NULL,
  retrieved_at TEXT NOT NULL,
  PRIMARY KEY(user_id, metric, period)
);

CREATE TABLE IF NOT EXISTS cycle_overrides (
  user_id TEXT NOT NULL,
  region TEXT NOT NULL,
  phase TEXT NOT NULL,
  position REAL NOT NULL,
  direction TEXT NOT NULL DEFAULT 'manual',
  note TEXT NOT NULL DEFAULT '',
  as_of TEXT NOT NULL,
  PRIMARY KEY(user_id, region)
);

CREATE TABLE IF NOT EXISTS refresh_runs (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  started_at TEXT NOT NULL,
  finished_at TEXT NOT NULL,
  summary TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS user_settings (
  user_id TEXT PRIMARY KEY,
  auto_refresh TEXT NOT NULL DEFAULT 'off',
  updated_at TEXT NOT NULL
);
