import React from 'react'

export default class Story extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      starred: props.starred,
      users_starred: props.users_starred
    }
  }

  toggleStar (star) {
    let {current_user, title, text, starred, hn_id} = star.props
    let users_starred = this.state.users_starred
    if (users_starred.includes(current_user)) {
      users_starred = users_starred.replace(current_user, '')
    } else {
      users_starred = `${users_starred} ${current_user}`
    }
    this.setState({
      starred: !star.state.starred,
      users_starred: users_starred
    })
    let story = { title: title, text: text, hn_id: hn_id, starred: this.state.starred }
    $.post('/star', {story: story})
  }

  render () {
    let {title, text, users_starred} = this.props;
    return (
      <div>
        <h3 className="title">{title}</h3>
        <p>{text} </p>
        <div className={this.state.starred ? 'starred' : 'unstarred'} onClick={() => this.toggleStar(this)}></div>
        <div>{this.state.users_starred}</div>
      </div>
    )
  }
}
