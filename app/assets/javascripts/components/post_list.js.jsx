var PostList = React.createClass({
  componentDidMount() {
    $('[data-toggle="tooltip"]').tooltip();
  },

  componentDidUpdate(){
    $('[data-toggle="tooltip"]').tooltip();
  },

  handleDelete: function(e) {
    if(confirm("Are you sure?")){
      e.preventDefault();
      $.ajax({
          method: 'DELETE',
          url: 'posts/' + this.props.post.id,
          error: function(xhr, status, error) {
            alert('Cannot delete requested record', error);
          }
        });
     }
  },

  handleAuthentication(){
    if(post.user.id == current_user.id){
      return(
        <button className="btn btn-danger"
          data-toggle="tooltip" data-placement="top"
          title="Delete this post"
          onClick={this.handleDelete}>
          <i className="fa fa-trash-o" aria-hidden="true"></i>
        </button>
      );
    }
  },

  render: function() {
    post = this.props.post;
    current_user = this.props.current_user;
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
          </span><br/>
          {this.handleAuthentication()}
        </div>

        <div className="media-body">
          <p className="well">{post.post}</p>
        </div>
      </div>
    );
  }
})
