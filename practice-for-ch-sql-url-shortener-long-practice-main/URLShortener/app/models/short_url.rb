# == Schema Information
#
# Table name: short_urls
#
#  id                :bigint           not null, primary key
#  long_url          :string           not null
#  short_url         :string           not null
#  submitter_user_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class ShortUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, :submitter_user_id, presence: true, uniqueness: true
    after_initialize :generate_short_url

    def self.random_code
        new_url = SecureRandom.urlsafe_base64

        until !ShortUrl.exists?(short_url: new_url)
            new_url = SecureRandom.urlsafe_base64
        end
        new_url
    end

    def generate_short_url
        self.short_url = ShortUrl.random_code
    end


end
