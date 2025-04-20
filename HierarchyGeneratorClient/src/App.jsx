import { useEffect, useState } from "react";
import Header from "./components/Header";
import HierarchyOverview from "./components/HierarchyOverview";
import PacmanLoader from "react-spinners/PacmanLoader";
import CreateHierarchy from "./components/CreateHierarchy";
import errorImage from "./assets/error.png";
import Message from "./components/Message";
import { GoogleLogin } from '@react-oauth/google';

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [page, setPage] = useState(1);
  const [refreshFlag, setRefreshFlag] = useState(false);
  const [messageType, setMessageType] = useState('')
  const [message, setMessage] = useState('');
  const [view, setView] = useState('overview');

  const handleLoginSuccess = (credentialResponse) => {
    console.log(credentialResponse);
  };

  const refreshPage = () => {
    setRefreshFlag(prev => !prev);
  };

  useEffect(() => {
    if (view !== 'overview') return;

    fetch(`/backend/api/hierarchy?search=${searchQuery}&page=${page}&limit=5`)
      .then((response) => response.json())
      .then((data) => {
        setHierarchies(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(
          "⚠️ Something went wrong fetching the hierarchy. Please try again later."
        );
        setLoading(false);
      });
  }, [searchQuery, page, refreshFlag, view]);

  return (
    <div className="p-5">
      <Message message={message} messageType={messageType} />
      <Header title="Hierarchy Generator" />
      <div style={{ padding: 40 }}>
      <h2>Login with Google</h2>
      <GoogleLogin
        onSuccess={handleLoginSuccess}
        onError={() => console.log("Login Failed")}
      />
    </div>

      {view === 'create' ? (
        <CreateHierarchy setMessage={setMessage} setView={setView} setMessageType={setMessageType} />
      ) : loading ? (
        <div className="flex items-center justify-center pt-7">
          <PacmanLoader
            color="oklch(0.379 0.146 265.522)"
            size={150}
            aria-label="Loading Spinner"
            data-testid="loader"
          />
        </div>
      ) : error ? (
        <div className="fixed inset-0 z-50 flex flex-col items-center justify-center">
          <h1 className="text-6xl font-bold text-red-800 mb-2">
            Ooops
          </h1>
          <img
            src={errorImage}
            alt="Error"
            className="mb-4 w-128"
          />
          <h2 className="text-3xl font-bold text-red-800 mb-2">
            The dog broke the server
          </h2>
          <p className="text-lg text-red-600">{message}</p>
        </div>
      ) : (
          <HierarchyOverview hierarchyList={hierarchies} 
          setSearchQuery={setSearchQuery} 
          setPage={setPage} 
          refreshPage={refreshPage} 
          setMessage={setMessage}
          setView={setView}
           />
      )}
    </div>
  );
}

export default App;
