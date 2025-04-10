import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";
import PacmanLoader from "react-spinners/PacmanLoader";

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [page, setPage] = useState(1);

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
  }, [searchQuery, page]);

  return (
    <div className="p-5">
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
        <p style={{ color: "red" }}>{error}</p>
      ) : (
          <HierarchyOverview hierarchyList={hierarchies} setSearchQuery={setSearchQuery} setPage={setPage} />
      )}
    </div>
  );
}

export default App;
