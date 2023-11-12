import React from 'react'
import ReactDOM from 'react-dom'
import Layout from './layout'

const App: React.FC = () => {
  return <Layout>Ruby on Rails + React Tech Test!</Layout>
}

ReactDOM.render(<App />, document.getElementById('root'))
