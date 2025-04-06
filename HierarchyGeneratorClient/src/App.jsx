import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";
import PacmanLoader from "react-spinners/PacmanLoader";

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/backend/api/hierarchy")
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
  }, []);

  return (
    <div>
      <Header title="Hierarchy Generator" />

      {loading ? (
        <div className="flex items-center justify-center pt-7">
          <PacmanLoader
            color="#642392"
            size={150}
            aria-label="Loading Spinner"
            data-testid="loader"
          />
        </div>
      ) : error ? (
        <p style={{ color: "red" }}>{error}</p>
      ) : (
        <div className="flex items-center justify-center pt-7">
          <HierarchyOverview hierarchyList={hierarchies} />
        </div>
      )}
    </div>
  );
}

export default App;
