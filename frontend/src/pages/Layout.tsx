import { Outlet, Link } from "react-router-dom";

const Layout = () => {
  return (
    <>
      <section className="main-sidebar">
        <div className="sidebar-brand">
          <a href="/">
            <img src="images/surrogacylogo.png" alt=""></img>
          </a>
        </div>

        <div className="sidebar-inner">
          <div className="naver" data-val="214" ></div>
          <ul className="icon-menu">
            <li>
              <Link to="/" data-content="Dashboard" className="hint--light hint--right" data-hint="Dashboard">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"
                  className="feather feather-home sidebar-svg">
                  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                  <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
              </Link>

            </li>
            <li>
              <Link to="/Profiles">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"
                className="feather feather-grid sidebar-svg">
                <rect x="3" y="3" width="7" height="7"></rect>
                <rect x="14" y="3" width="7" height="7"></rect>
                <rect x="14" y="14" width="7" height="7"></rect>
                <rect x="3" y="14" width="7" height="7"></rect>
              </svg>
              </Link>
            </li>
            <li>
              <Link to="/DonorsSearch" data-content="Donors" className="hint--light hint--right is-selected"
                data-hint="Find a Donor">

                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"
                  className="feather feather-layers sidebar-svg">
                  <polygon points="12 2 2 7 12 12 22 7 12 2"></polygon>
                  <polyline points="2 17 12 22 22 17"></polyline>
                  <polyline points="2 12 12 17 22 12"></polyline>
                </svg>

              </Link>

            </li>
            <li id="tg-step3">
              <a href="compare" data-content="Compare Donor" className="hint--light hint--right" data-hint="Compare Donor">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                  stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"
                  className="feather feather-mail sidebar-svg">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                  <polyline points="22,6 12,13 2,6"></polyline>
                </svg>

              </a>
            </li>
          </ul>


          <div className="profile-menu">
            <i className="fa fa-user-o" aria-hidden="true"></i>
            <Link to="/Profiles">Profiles</Link>
          </div>


        </div>
      </section>
      <section className="right-part view-wrapper">
        <div className="container-fluid">
          <div className="right-part">
            <Outlet />
          </div>
        </div>
      </section>


    </>
  )
};

export default Layout;