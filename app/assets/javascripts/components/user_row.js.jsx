var UserRow = React.createClass({

  render: function() {
    user = this.props.user
    return (
      <tr>
        <td>{user.first_name}</td>
        <td>{user.last_name}</td>
        <td>{user.position}</td>
        <td>{user.department ? user.department.name : ""}</td>
        <td>{user.email}</td>
        <td>
          <a href={"/users/"+user.id}>
            <span className="glyphicon glyphicon-search"></span>
          </a>
        </td>
      </tr>
    )
  }
});
