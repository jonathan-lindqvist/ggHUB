# frozen_string_literal: true

json.extract! learn, :id, :wow, :created_at, :updated_at
json.url learn_url(learn, format: :json)
