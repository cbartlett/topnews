require 'rest_client'

class StarredStories
  def initialize
  end

  def fetch
    stories = Story.all
    stories.group_by(&:hn_id).map {|key, value|
      {
        title: value.first.title,
        text: value.first.text,
        users_starred: users_starred(value)
      }
    }
  end

  def users_starred(value)
    value.map {|val|
      user =User.find(val.user_id);
      "#{user.first_name} #{user.last_name}"
    }.join(" ")
  end
end

