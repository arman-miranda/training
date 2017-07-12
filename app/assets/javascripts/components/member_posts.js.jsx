var MemberPosts = React.createClass({

  render: function() {
    return(
      <div>
        {this.props.posts.map(function(post, i){
          return(
            <PostList key={i} post={post}/>
          );
        })}
      </div>
    );

  }


});
