import React from 'react'
import ReactDOM from 'react-dom'
import Story from './story'

export default class StoryListings extends React.Component {
  constructor (props) {
    super(props)
  }

  render () {
    console.log("rendering")
    console.log("this.props: ", this.props)
    var storyNodes = this.props.stories.map(function (story, index) {
      return (
        <Story title={story.title}  text={story.text} key={index} />
      )
    })
    return (
      <div className="StoryList">
        {storyNodes}
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('story_data')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(
    <StoryListings stories={data} />,
    document.body.appendChild(document.createElement('div')),
  )
})
