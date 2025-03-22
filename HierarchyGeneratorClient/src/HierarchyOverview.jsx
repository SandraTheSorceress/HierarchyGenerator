function HierarchyOverview({hierarchyList}) {
    return (
      <ul>
        {
          hierarchyList.map( (hierarchy) => (
            <li key={hierarchy.id} style={{ listStyleType: "none" }}>{hierarchy.name}</li>
          ))
        }
      </ul>
    )
  }
  
  export default HierarchyOverview;