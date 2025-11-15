import React from "react";
import { NavLink } from "react-router-dom";
import "../css/Sidebar.css"; 

const Sidebar = () => {
  return (
    <nav className="sidebar">
      <h2>Menu</h2>
      <ul>
        <li>
          <NavLink to="/" end activeclassname="active">
            Home
          </NavLink>
        </li>
        <li>
          <NavLink to="/about" activeclassname="active">
            About
          </NavLink>
        </li>
        <li>
          <NavLink to="/Todo" activeclassname="active">
            ToDo
          </NavLink>
        </li>
      </ul>
    </nav>
  );
};

export default Sidebar;