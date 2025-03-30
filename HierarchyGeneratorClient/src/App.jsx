import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch("/backend/api/hierarchy")
      .then((response) => response.json())
      .then((data) => setHierarchies(data))
      .catch((err) => {
        setError(
          "⚠️ Something went wrong fetching the hierarchy. Please try again later."
        );
      });
  }, []);

  return (
    <div>
      <Header title="Hierarchy Generator" />
      {!error ? (
        <div className="flex items-center justify-center pt-7">
          <HierarchyOverview hierarchyList={hierarchies} />
        </div>
      ) : (
        <p style={{ color: "red" }}>{error}</p>
      )}
    </div>
  );
}

export default App;
