import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { TodoProvider } from "./context/TodoContext";
import Sidebar from "./components/SideBar";
import Home from "./pages/Home";
import About from "./pages/About";
import Contact from "./pages/Contact";
import "./css/App.css";

const App = () => {
  return (
    <TodoProvider>
      <Router>
        <div className="app-layout">
          <Sidebar />
          <div className="content">
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/about" element={<About />} />
              <Route path="/contact" element={<Contact />} />
            </Routes>
          </div>
        </div>
      </Router>
    </TodoProvider>
  );
};

export default App;