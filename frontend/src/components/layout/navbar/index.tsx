import React from 'react'

const Navbar = () => {
    return <nav className="navbar navbar-expand-md navbar-dark bg-dark">
    <div className="container-fluid">
      <a className="navbar-brand" href="#">Tech Test</a>
      <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>

      <div className="collapse navbar-collapse" id="navbarsExample04">
        <ul className="navbar-nav me-auto mb-2 mb-md-0">
          <li className="nav-item">
            <a className="nav-link active" aria-current="page" href="#">Home</a>
          </li>
        </ul>
        <form role="search">
          <input className="form-control" type="search" placeholder="Search" aria-label="Search" />
        </form>
      </div>
    </div>
  </nav>
}

export default Navbar
