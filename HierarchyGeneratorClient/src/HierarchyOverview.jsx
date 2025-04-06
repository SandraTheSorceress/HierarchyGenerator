function daysAgo(dateString) {
  const givenDate = new Date(dateString);
  const now = new Date();

  // Calculate difference in milliseconds
  const diffInMs = now - givenDate;

  // Convert to days
  const diffInDays = Math.floor(diffInMs / (1000 * 60 * 60 * 24));

  if (diffInDays === 0) return 'Today';
  if (diffInDays === 1) return '1 day ago';
  return `${diffInDays} days ago`;
}

function HierarchyOverview({ hierarchyList }) {
  return (
    <div className="relative overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" class="px-6 py-3">
              Name
            </th>
            <th scope="col" class="px-6 py-3">
              Created
            </th>
            <th scope="col" class="px-6 py-4">
              
            </th>
            <th scope="col" class="px-6 py-4">
              
              </th>
          </tr>
        </thead>
        <tbody>
        {hierarchyList.map((hierarchy) => (
          <tr  key={hierarchy.id} class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 border-gray-200">
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white min-w-[40rem]">
                {hierarchy.name}
              </th>
              <td class="px-6 py-4">
                {daysAgo(hierarchy.createdDate)}
              </td>
              <td class="px-6 py-4">
                <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Delete</a>
              </td>
              <td class="px-6 py-4">
                <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Download</a>
              </td>
          </tr>
        ))}
        </tbody>
      </table>
    </div>
  );
}

export default HierarchyOverview;
