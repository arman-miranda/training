var MemberPosts = React.createClass({
  render: function() {
    return(
      <div>
        {this.props.posts.map((post, i) => {
          return(
            <PostList current_user={this.props.current_user}
                      key={i}
                      post={post} />
          );
        })};


      </div>
    );

  }


});
