import { daysAgo, calculateRangeStart, calculateRangeEnd } from "../utils/utils";
import Pagination from "./Pagination";

function deleteHierarchy(hierarchy, setMessage, refreshPage) {
  fetch(`/backend/api/hierarchy/${hierarchy.id}`, {
    method: 'DELETE',
  })
  .then((response) => {
    if (!response.ok) throw new Error('Failed to delete');
    refreshPage();
    setMessage(`${hierarchy.name} is deleted`);

    // Clear the message after 5 seconds
    setTimeout(() => setMessage(''), 5000);
  })
  .catch((error) => {
    console.error('Error:', error);
    setMessage('Failed to delete');
    setTimeout(() => setMessage(''), 3000);
  });
}



function HierarchyOverview({ hierarchyList, setSearchQuery, setPage, refreshPage, setMessage }) {
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
                  <button
                    className="inline-block px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-700 transition-colors"
                    onClick={
                      () => {
                        deleteHierarchy(hierarchy, setMessage, refreshPage);
                      }
                    }
                  >
                    Delete
                  </button>
                </td>
                <td className="px-6 py-4">
                  <a
                    href={`/backend/api/hierarchy/${hierarchy.id}/download`}
                    className="inline-block px-4 py-2 bg-blue-400 text-white rounded-md hover:bg-blue-700 transition-colors"
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
          <Pagination
            currentPage={hierarchyList.meta.page}
            totalPages={hierarchyList.meta.totalPages}
            onPageChange={setPage}
          />
        </nav>
      </div>
    </div>
  );
}

export default HierarchyOverview;
