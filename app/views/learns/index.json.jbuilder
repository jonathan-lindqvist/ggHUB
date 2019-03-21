# frozen_string_literal: true

json.array! @learns, partial: 'learns/learn', as: :learn
