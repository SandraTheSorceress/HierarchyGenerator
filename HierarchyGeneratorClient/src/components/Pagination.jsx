import { calculateRangeStart, calculateRangeEnd } from "../utils/utils";

function Pagination({ hierarchyList, onPageChange }) {
  const pageButtons = [];

  for (let i = 1; i <= hierarchyList.meta.totalPages; i++) {
    const isActive = i === hierarchyList.meta.page;
    pageButtons.push(
      <li key={i}>
        <a
          href="#"
          onClick={(e) => {
            e.preventDefault();
            if (!isActive) onPageChange(i);
          }}
          className={`flex items-center justify-center px-3 h-8 leading-tight 
              border ${
                isActive
                  ? "bg-gray-200 text-primary-600"
                  : "bg-white text-gray-500"
              } 
              hover:bg-gray-100 hover:text-primary-700 dark:bg-gray-800 dark:border-gray-700 
              dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white`}
        >
          {i}
        </a>
      </li>
    );
  }

  return (
    <>
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
        {pageButtons}
      </ul>
    </>
  );
}

export default Pagination;
