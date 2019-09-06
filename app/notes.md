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

