function daysAgo(dateString) {
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

function calculateRangeStart(hierarchyList) {
  if (hierarchyList.data.size == 0) {
    return 0;
  }
  var startRange = (hierarchyList.meta.page - 1) * hierarchyList.meta.limit;
  return startRange + 1;
}

function calculateRangeEnd(hierarchyList) {
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

function HierarchyOverview({ hierarchyList, setSearchQuery, setPage }) {
  const page_buttons = [];
  for (let i = 1; i <= hierarchyList.meta.totalPages; i++) {
    if(i == hierarchyList.meta.page){
      page_buttons.push(
        <li key={i}>
        <a
          href="#"
          aria-current="page"
          className="flex items-center justify-center px-3 h-8 leading-tight text-primary-600 bg-gray-200 border border-gray-300 hover:bg-gray-100 hover:text-primary-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
          {i}
        </a>
      </li>
    );
    } else {

      page_buttons.push(
        <li key={i}>
        <a
          href="#"
          onClick={() => setPage(i)}
          className="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
          >
          {i}
        </a>
      </li>
    );
  }
  }

  return (
    <div className="bg-gray-50 dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden mt-10">
      <div className="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0 md:space-x-4 p-4">
        <div className="w-full md:w-1/2">
          <form className="flex items-center">
            <label htmlFor="simple-search" className="sr-only">
              Search
            </label>
            <div className="relative w-full">
              <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                <svg
                  aria-hidden="true"
                  className="w-5 h-5 text-gray-500 dark:text-gray-400"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    fillRule="evenodd"
                    d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                    clipRule="evenodd"
                  />
                </svg>
              </div>
              <input
                type="text"
                id="simple-search"
                className="bg-gray-50 border border-gray-300 text-gray-900 
                text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 
                block w-2/5 pl-10 p-2 dark:bg-gray-700 dark:border-gray-600
                 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Search"
                required=""
                onChange={(event) => {
                  setPage(1)
                  setSearchQuery(event.target.value)
                }}
              />
            </div>
          </form>
        </div>
      </div>

      <div className="relative overflow-x-auto shadow-md sm:rounded-lg px-2">
        <table className="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
          <thead className="text-xs text-gray-700 uppercase dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th scope="col" className="px-6 py-3">
                Name
              </th>
              <th scope="col" className="px-6 py-3">
                Created
              </th>
              <th scope="col" className="px-6 py-4"></th>
              <th scope="col" className="px-6 py-4"></th>
            </tr>
          </thead>
          <tbody>
            {hierarchyList.data.map((hierarchy) => (
              <tr
                key={hierarchy.id}
                className="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 border-gray-200"
              >
                <th
                  scope="row"
                  className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white min-w-[40rem]"
                >
                  {hierarchy.name}
                </th>
                <td className="px-6 py-4">{daysAgo(hierarchy.createdDate)}</td>
                <td className="px-6 py-4">
                  <a
                    href="#"
                    className="font-medium text-red-600 dark:text-red-500 hover:underline"
                  >
                    Delete
                  </a>
                </td>
                <td className="px-6 py-4">
                  <a
                    href="#"
                    className="font-medium text-blue-600 dark:text-blue-500 hover:underline"
                  >
                    Download
                  </a>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <nav
          className="flex items-center flex-column flex-wrap md:flex-row justify-between p-4"
          aria-label="Table navigation"
        >
          <span className="text-sm font-normal text-gray-500 dark:text-gray-400 mb-4 md:mb-0 block w-full md:inline md:w-auto">
            Showing{" "}
            <span className="font-semibold text-gray-900 dark:text-white">
              {calculateRangeStart(hierarchyList)}-
              {calculateRangeEnd(hierarchyList)}
            </span>{" "}
            of{" "}
            <span className="font-semibold text-gray-900 dark:text-white">
              {hierarchyList.meta.total}{" "}
            </span>
            hierarchies
          </span>
          <ul className="inline-flex -space-x-px rtl:space-x-reverse text-sm h-8">
            { page_buttons }
          </ul>
        </nav>
      </div>
    </div>
  );
}

export default HierarchyOverview;
