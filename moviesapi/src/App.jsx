import NavBar from './components/NavBar';
import './css/App.css';
import MovieCard from "./components/MovieCard"
import Home from './pages/home';
import { Routes, Route } from 'react-router-dom';
import Favorites from './pages/Favorites';


function App() {// component
  const movieNumber = 1;


  return (
    <div>
    <NavBar />
     <main className='main-content'>
      <Routes>
        <Route path="/" element={<Home  />}/>
        <Route path="/favorites" element={<Favorites />}/>
      </Routes>


     </main>
    
    </div>
  )
}


export default App
