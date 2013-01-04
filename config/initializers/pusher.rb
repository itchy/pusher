pusher_config = YAML.load(File.read("#{Rails.root}/config/pusher.yml"))

Pusher.app_id = pusher_config['pusher']['app_id']
Pusher.key = pusher_config['pusher']['key']
Pusher.secret = pusher_config['pusher']['secret']