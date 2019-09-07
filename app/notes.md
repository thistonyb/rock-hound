        <%= link_to comment.user.name, collection_path(comment.user) %> said: 
        <%user = User.find(comment.user_id)%>

    <%byebug%>

    h3> Sign up as a RockHound member to comment on this specimen! </h3>
        <%= f.fields_for :user, User.new do |user_fields| %>
            <%= user_fields.label :name, 'Name' %>:
            <%= user_fields.text_field :name %>
            <%= user_fields.label :password, 'Password' %>:
            <%= user_fields.text_field :password %>
            <%= f.submit 'Sign Up' %>
        <% end %>
    <% end %>

    <%user_comment = User.find_by_id(comment.user_id)%>

        <%=user_comment.name%> said:

[47, 56] in /Users/anthonybaker/Documents/Projects/rock-hound/app/views/rocks/show.html.erb
   47: 
   48: 
   49: <h3>Comments:</h3>
   50:     <% @rock.comments.each do |comment| %>
   51:         <%byebug%>
=> 52:         <%user_comment = User.find_by_id(comment.user_id)%>
   53:        
   54:         <%=user_comment.name%> said:
   55:         <%= comment.content %><br>
   56:         <br>
(byebug) comment
#<Comment id: 1, content: "Wow!", user_id: 1, rock_id: 1, created_at: "2019-09-06 21:15:18", updated_at: "2019-09-06 21:15:18">
(byebug) 

[48, 57] in /Users/anthonybaker/Documents/Projects/rock-hound/app/views/rocks/show.html.erb
   48: 
   49: <h3>Comments:</h3>
   50:     <% @rock.comments.each do |comment| %>
   51:         
   52:         <%user_comment = User.find_by_id(comment.user_id)%>
   53:        <%byebug%>
=> 54:         <%=user_comment.name%> said:
   55:         <%= comment.content %><br>
   56:         <br>
   57:     <% end %>
(byebug) user_comment
#<User id: 1, name: "Tony", email: nil, password_digest: "$2a$12$uAzYytaaALcLd5fb5F7W9uHGeYZ3fZG0O6l2BycLErw...", created_at: "2019-09-06 21:07:49", updated_at: "2019-09-06 21:07:49">
(byebug) 

NoMethodError in Rocks#show
Showing /Users/anthonybaker/Documents/Projects/rock-hound/app/views/rocks/show.html.erb where line #54 raised:

undefined method `name' for nil:NilClass
Extracted source (around line #54):
52
53
54
55
56
57
              
        <%user_comment = User.find_by_id(comment.user_id)%>

        <%=user_comment.name%> said:
        <%= comment.content %><br>
        <br>
    <% end %>

Rails.root: /Users/anthonybaker/Documents/Projects/rock-hound

Application Trace | Framework Trace | Full Trace
app/views/rocks/show.html.erb:54:in `block in _app_views_rocks_show_html_erb__229549038916619468_70331376601400'
app/views/rocks/show.html.erb:50:in `_app_views_rocks_show_html_erb__229549038916619468_70331376601400'