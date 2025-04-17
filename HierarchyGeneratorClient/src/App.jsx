import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";
import PacmanLoader from "react-spinners/PacmanLoader";
import errorImage from "./assets/error.png";

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [page, setPage] = useState(1);
  const [refreshFlag, setRefreshFlag] = useState(false);
  const [message, setMessage] = useState('');

  const refreshPage = () => {
    setRefreshFlag(prev => !prev);
  };

  useEffect(() => {
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
  }, [searchQuery, page, refreshFlag]);

  return (
    <div className="p-5">
      {message && (
          <div className="fixed top-4 left-1/2 transform -translate-x-1/2 z-50 bg-red-100 border border-red-300 text-red-700 px-6 py-3 rounded-md shadow-lg">
          {message}
        </div>
      )}
      <Header title="Hierarchy Generator" />

      {loading ? (
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
          <HierarchyOverview hierarchyList={hierarchies} setSearchQuery={setSearchQuery} setPage={setPage} refreshPage={refreshPage} setMessage={setMessage} />
      )}
    </div>
  );
}

export default App;
