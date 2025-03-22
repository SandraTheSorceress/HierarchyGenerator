import "./App.css";
import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";

function App() {
  const [hierarchies, setHierarchies] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch("/api/hierarchy")
      .then((response) => response.json())
      .then((data) => setHierarchies(data))
      .catch((err) => {
        setError(
          "⚠️ Something went wrong fetching the hierarchy. Please try again later."
        );
      });
  }, []);

  return (
    <>
      <Header title="Hierarchy Generator" />
      {!error ? (
        <HierarchyOverview hierarchyList={hierarchies} />
      ) : (
        <p style={{ color: "red" }}>{error}</p>
      )}
    </>
  );
}

export default App;
