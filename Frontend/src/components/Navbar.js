import React from 'react';
import { useNavigate } from 'react-router-dom';

export default function Navbar({ isLoggedIn, handleLogout }) {
  const navigate = useNavigate();

  const handleLoginClick = () => {
    navigate('/Login');
  };

  const handleSignupClick = () => {
    navigate('/Signup');
  };

  const handleLogoutClick = () => {
    handleLogout();
    navigate('/Login');
  };

  return (
    <div>
      <nav className="navbar">
        <div className="container">
          <a href="#" className="logo">RMS</a>
          <ul className="nav-links">
            {isLoggedIn ? (
              <li>
                <button onClick={handleLogoutClick}>Logout</button>
              </li>
            ) : (
              <>
                <li>
                  <button onClick={handleLoginClick}>Login</button>
                </li>
                <li>
                  <button onClick={handleSignupClick}>Sign Up</button>
                </li>
              </>
            )}
          </ul>
        </div>
      </nav>
    </div>
  );
}
