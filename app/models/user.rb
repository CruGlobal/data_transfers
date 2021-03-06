class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def self.find_from_auth_hash(auth_hash)
    existing = find_by(sso_guid: auth_hash.extra.raw_info.ssoguid)
    return existing.apply_auth_hash(auth_hash) if existing
  end

  def apply_auth_hash(auth_hash)
    self.sso_guid = auth_hash.extra.raw_info.ssoguid
    self.username = auth_hash.extra.raw_info.preferred_username
    self.first_name = auth_hash.info.first_name
    self.last_name = auth_hash.info.last_name
    save!
    self
  end

  def name
    [first_name, last_name].join(" ")
  end

  def track(request)
    self.sign_in_count += 1
    self.last_sign_in_at = current_sign_in_at
    self.current_sign_in_at = Time.now
    self.last_sign_in_ip = current_sign_in_ip
    self.current_sign_in_ip = request.remote_ip
    save(validate: false)
  end
end
