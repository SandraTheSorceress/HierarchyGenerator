import { useState } from "react";
import { daysAgo } from "../utils/utils";
import { ChevronRight, ChevronDown } from "lucide-react";

function HierarchyRow({ hierarchy, userInfo, onDeleteClick, onChangeNameClick }) {
  const [isExpanded, setIsExpanded] = useState(false);

  return (
    <>
      <tr
        key={hierarchy.id}
        className="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700 border-gray-200"
      >
        <th
          scope="row"
          className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white min-w-[40rem] flex items-center gap-2 cursor-pointer"
          onClick={() => setIsExpanded(!isExpanded)}
        >
          {/* Arrow Icon */}
          {isExpanded ? <ChevronDown size={24} /> : <ChevronRight size={24} />}
          {hierarchy.name}
        </th>

        <td
          className="px-6 py-4 cursor-pointer"
          onClick={() => setIsExpanded(!isExpanded)}
        >
          {daysAgo(hierarchy.createdDate)}
        </td>

        <td className="px-6 py-4 text-right">
          {userInfo && (
            <button
              className="min-w-[90px] inline-block px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-700 transition-colors"
              onClick={(e) => {
                onDeleteClick(hierarchy);
              }}
            >
              Delete
            </button>
          )}
        </td>

        <td className="px-6 py-4 text-right">
          {userInfo && (
            <button
              className="min-w-[90px] inline-block px-4 py-2 bg-blue-400 text-white rounded-md hover:bg-blue-700 transition-colors"
              onClick={(e) => {
                onChangeNameClick(hierarchy);
              }}
            >
              Change Name
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

      {isExpanded && (
        <tr className="bg-gray-100 dark:bg-gray-800">
          <td colSpan="4" className="px-6 py-4">
            <div className="bg-white dark:bg-gray-900 p-4 rounded-lg border dark:border-gray-700">
              <div className="space-y-3">
                <p className="text-sm font-medium text-gray-800 dark:text-gray-200">
                  <strong>Hierarchy ID:</strong>{" "}
                  <span className="text-gray-500 dark:text-gray-400">
                    {hierarchy.id}
                  </span>
                </p>
                <p className="text-sm font-medium text-gray-800 dark:text-gray-200">
                  <strong>Nodes:</strong>{" "}
                  <span className="text-gray-500 dark:text-gray-400">
                    {hierarchy.numberOfNodes}
                  </span>
                </p>
                <p className="text-sm font-medium text-gray-800 dark:text-gray-200">
                  <strong>Contacts:</strong>{" "}
                  <span className="text-gray-500 dark:text-gray-400">0</span>
                </p>
                <p className="text-sm font-medium text-gray-800 dark:text-gray-200">
                  <strong>Attributes:</strong>{" "}
                  <span className="text-gray-500 dark:text-gray-400">0</span>
                </p>
              </div>
            </div>
          </td>
        </tr>
      )}
    </>
  );
}

export default HierarchyRow;
