var PostList = React.createClass({

  render: function() {
    post = this.props.post
    return(
      <div className="row">
        <hr />
        <div className="col-md-4">
          <img src={post.avatar_url}/><br/>
          <a href={"/users/"+post.user.id}>
          {post.user.first_name + " " + post.user.last_name}
          </a><br/>
          <a href={"/departments/"+post.user.department_id}>
            {post.user.department.name}
          </a><br/>
          <span className="publish-date">
            Posted at: {post.created_at}
          </span>
        </div>

        <div className="col-md-8 well">
          <p>{post.post}</p>
        </div>
      </div>
    );
  }
})
