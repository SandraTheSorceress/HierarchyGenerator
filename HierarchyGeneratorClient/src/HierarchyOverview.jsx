function HierarchyOverview({hierarchyList}) {
    return (
      <ul>
        {
          hierarchyList.map( (hierarchy) => (
            <li key={hierarchy.id}>{hierarchy.name}</li>
          ))
        }
      </ul>
    )
  }
  
  export default HierarchyOverview;