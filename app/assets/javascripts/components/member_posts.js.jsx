var MemberPosts = React.createClass({
  loadPage : function() {
    return <h1>This</h1>
  },

  render: function() {
    return(
      <div>
        {this.props.posts.map(function(post, i){
          return(
            <PostList key={i} post={post}/>
          );
        })}
        <loadPage/>
      </div>
    );

  }


});
