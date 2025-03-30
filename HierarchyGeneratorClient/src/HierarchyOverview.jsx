function HierarchyOverview({ hierarchyList }) {
  return (
    
      <ul className="list-none space-y-3">
        {hierarchyList.map((hierarchy) => (
          <li
            key={hierarchy.id}
            className="p-4 border border-gray-300 rounded-lg hover:bg-gray-100 hover:border-blue-500"
          >
            {hierarchy.name}
          </li>
        ))}
      </ul>
  );
}

export default HierarchyOverview;
