import "./App.css";
import { useEffect, useState } from "react";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";

function App() {

  const [hierarchies, setHierarchies] = useState([]);

  useEffect(() => {
    fetch("/api/hierarchy")
      .then((response) => response.json())
      .then((data) => setHierarchies(data));
  }, []);

  return (
    <>
      <Header title="Hierarchy Generator" />
      <HierarchyOverview hierarchyList={hierarchies} />
    </>
  );
};

export default App;
