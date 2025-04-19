export function daysAgo(dateString) {
  
    const givenDate = new Date(dateString);
    const now = new Date();
  
    // Calculate difference in milliseconds
    const diffInMs = now - givenDate;
  
    // Convert to days
    const diffInDays = Math.floor(diffInMs / (1000 * 60 * 60 * 24));
  
    if (diffInDays === 0) return "Today";
    if (diffInDays === 1) return "1 day ago";
    return `${diffInDays} days ago`;
  }

  export function calculateRangeStart(hierarchyList) {
    if (hierarchyList.data.size == 0) {
      return 0;
    }
    var startRange = (hierarchyList.meta.page - 1) * hierarchyList.meta.limit;
    return startRange + 1;
  }
  
  export function calculateRangeEnd(hierarchyList) {
    if (hierarchyList.data.size == 0) {
      return 0;
    }
    var startRange = calculateRangeStart(hierarchyList);
    var endRange = startRange + (hierarchyList.meta.limit - 1);
    if (endRange > hierarchyList.meta.total) {
      return hierarchyList.meta.total;
    }
    return endRange;
  }