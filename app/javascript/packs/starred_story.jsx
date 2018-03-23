import React from 'react'

export default class StarredStory extends React.Component {
  render () {
    let {title, text, users_starred} = this.props;
    return (
      <div>
        <h3 className="title">{title}</h3>
        <p>{text}</p>
        <div>{users_starred}</div>
      </div>
    )
  }
}
