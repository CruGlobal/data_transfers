class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def self.find_from_auth_hash(auth_hash)
    existing = find_by(sso_guid: auth_hash.extra.ssoGuid)
    return existing.apply_auth_hash(auth_hash) if existing
  end

  def apply_auth_hash(auth_hash)
    self.sso_guid = auth_hash.extra.ssoGuid
    self.username = auth_hash.uid
    self.first_name = auth_hash.extra.firstName
    self.last_name = auth_hash.extra.lastName
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
