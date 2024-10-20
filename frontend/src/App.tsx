// import './App.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Layout from './pages/Layout';
import Home from './pages/home';
import NoPage from './pages/NoPage';
import DonorsSearch from './pages/donorsSearch';
import Profiles from './pages/profiles';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="DonorsSearch" element={<DonorsSearch />} />
          <Route path="Profiles" element={<Profiles />} />
          <Route path="*" element={<NoPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
