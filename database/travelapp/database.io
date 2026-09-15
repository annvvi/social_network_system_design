Table follows {
  following_user_id integer [not null]
  followed_user_id integer [not null]
  created_at timestamp
}

Table users {
  id integer [primary key]
  username varchar
  post_id integer
  created_at timestamp
}

Table posts {
  id integer [primary key]
  title varchar
  body text
  user_id integer [not null]
  comments text
  likes integer
  created_at timestamp
}

Table places {
  id integer [primary key]
  name varchar
  post_id integer [not null]
}

Ref user_posts: posts.user_id ?> users.id // many-to-one

Ref: users.id <? follows.following_user_id

Ref: users.id <? follows.followed_user_id

Ref: places.post_id > posts.id
