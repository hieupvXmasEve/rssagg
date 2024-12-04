-- name: CreateUser :one
INSERT INTO users (id, created_at, updated_at, name, api_key) VALUES ($1, $2, $3, $4, encode(sha256(random()::text::bytea), 'hex')) RETURNING *;

-- name: GetUserByApiKey :one
SELECT * FROM users WHERE api_key = $1;

-- name: GetUsers :many
SELECT * FROM users;

-- name: UpdateUser :exec
UPDATE users SET name = $1 WHERE id = $2;

-- name: DeleteUser :exec
DELETE FROM users WHERE id = $1;
