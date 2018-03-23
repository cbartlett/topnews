import React from 'react'
import ReactDOM from 'react-dom'
import Story from './story'
import StarredStories from './starred_stories'
import StarredStory from './starred_story'

export default class StoryListings extends React.Component {
  render () {
    let {stories, current_user} = this.props;
    let storyNodes = stories.map(function (story, index) {
      return (
        <Story hn_id={story.hn_id} title={story.title} current_user={current_user} text={story.text} starred={story.starred} users_starred={story.users_starred} key={story.hn_id} />
      )
    })

    return (
      <div className="StoryList">
        <h1>Top News</h1>
        <div><a data-method="delete" href="/users/sign_out">Sign Out</a></div>
        <a href="/starred_stories">Starred Stories</a>
        {storyNodes}
      </div>
    );
  }
}
