import "./App.css";
import Header from "./Header";
import HierarchyOverview from "./HierarchyOverview";

function App() {

  const items = [
    {
      "id": 1,
      "name": "Hierarchy 1",
      "numberOfNodes": 1,
      "createdDate": "2025-03-22T14:30:00",
      "lastModified": "2025-03-22T14:30:00"
    },
    {
      "id": 2,
      "name": "Hierarchy 2",
      "numberOfNodes": 5,
      "createdDate": "2025-03-22T14:30:00",
      "lastModified": "2025-03-22T14:30:00"
    },
    {
      "id": 3,
      "name": "Hierarchy 3",
      "numberOfNodes": 7,
      "createdDate": "2025-03-22T14:30:00",
      "lastModified": "2025-03-22T14:30:00"
    },
    {
      "id": 4,
      "name": "Hierarchy 4",
      "numberOfNodes": 9,
      "createdDate": "2025-03-22T14:30:00",
      "lastModified": "2025-03-22T14:30:00"
    }
  ];

  return (
    <div>
      <Header title="Hierarchy Generator" />
      <HierarchyOverview hierarchies={items} />
    </div>
  );
}

export default App;
