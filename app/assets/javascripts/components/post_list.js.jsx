var PostList = React.createClass({

  render: function() {
    post = this.props.post
    return(
      <div id="post-fix" className="media">
        <hr />
        <div className="media-left">
          <img src={post.avatar_url} className="media-object"/><br/>
          <a href={"/users/"+post.user.id}>
          {post.user.first_name + " " + post.user.last_name}
          </a><br/>
          <a href={"/departments/"+post.user.department_id}>
            {post.user.department ?  post.user.department.name : ""}
          </a><br/>
          <span className="publish-date">
            Posted at: {post.created_at}
          </span>
        </div>

        <div className="media-body">
          <p className="well">{post.post}</p>
        </div>
      </div>
    );
  }
})
