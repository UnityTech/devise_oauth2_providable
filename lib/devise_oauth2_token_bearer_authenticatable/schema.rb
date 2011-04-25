require 'devise/schema'

module Devise
  module Oauth2TokenBearerAuthenticatable
    module Schema
      def self.up(migration)
        migration.create_table :clients do |t|
          t.string :name
          t.string :redirect_uri
          t.string :website
          t.string :identifier
          t.string :secret
          t.timestamps
        end
        migration.add_index :clients, :identifier

        migration.create_table :access_tokens do |t|
          t.belongs_to :user, :client
          t.string :token
          t.datetime :expires_at
          t.timestamps
        end
        migration.add_index :access_tokens, :token
        migration.add_index :access_tokens, :expires_at

        migration.create_table :refresh_tokens do |t|
          t.belongs_to :user, :client
          t.string :token
          t.datetime :expires_at
          t.timestamps
        end
        migration.add_index :refresh_tokens, :token
        migration.add_index :refresh_tokens, :expires_at
      end

      def self.down(migration)
        migration.drop_table :refresh_tokens
        migration.drop_table :access_tokens
        migration.drop_table :clients
      end
    end
  end
end

