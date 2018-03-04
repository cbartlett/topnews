import React from 'react'
import ReactDOM from 'react-dom'
import StarredStory from './starred_story'

export default class StarredStories extends React.Component {
  render () {
    let starredNodes = this.props.starred_stories.map(function (story, index) {
      return (
        <StarredStory title={story.title} text={story.text} users_starred={story.users_starred} key={index} />
      )
    })
    return (
      <div className="StarredList">
        <h1>Employee Starred Stories</h1>
        <div><a data-method="delete" href="/users/sign_out">Sign Out</a></div>
        <a href="/">Home</a>
        {starredNodes}
      </div>
    );
  }
}
