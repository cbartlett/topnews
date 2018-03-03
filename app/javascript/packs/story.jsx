import React from 'react'

export default class Story extends React.Component {
  constructor (props) {
    super(props)
  }
  render () {
    return (
      <div>
        <h3 className="daycare-name">{this.props.title}</h3>
        <p>{this.props.text} </p>
      </div>
    )
  }
}
