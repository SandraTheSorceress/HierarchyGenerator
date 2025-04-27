import { daysAgo } from "../utils/utils";

function HierarchyRow({ hierarchy, userInfo, onDeleteClick }) {
    return (
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
  
        <td className="px-6 py-4 text-right">
          {userInfo && (
            <button
              className="min-w-[90px] inline-block px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-700 transition-colors"
              onClick={() => onDeleteClick(hierarchy)}
            >
              Delete
            </button>
          )}
        </td>
  
        <td className="px-6 py-4 text-right">
          <a
            href={`/backend/api/hierarchy/${hierarchy.id}/download`}
            className="min-w-[90px] inline-block px-4 py-2 bg-blue-400 text-white rounded-md hover:bg-blue-700 transition-colors"
          >
            Download
          </a>
        </td>
      </tr>
    );
  }
  
  export default HierarchyRow;
  