function HierarchyOverview({hierarchies}) {
    return (
      <ul>
        {
          hierarchies.map( (hierarchy) => (
            <li key={hierarchy.id} style={{ listStyleType: "none" }}>{hierarchy.name}</li>
          ))
        }
      </ul>
    )
  }
  
  export default HierarchyOverview;