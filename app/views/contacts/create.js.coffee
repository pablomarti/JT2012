<% if @status %>
$("#form_contact").html("<%=j render :partial => 'contacts/form' %>")
<% end %>
alert "<%= @message %>"