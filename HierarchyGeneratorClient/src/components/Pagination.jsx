function Pagination({ currentPage, totalPages, onPageChange }) {
    const pageButtons = [];
  
    for (let i = 1; i <= totalPages; i++) {
      const isActive = i === currentPage;
      pageButtons.push(
        <li key={i}>
          <a
            href="#"
            onClick={(e) => {
              e.preventDefault();
              if (!isActive) onPageChange(i);
            }}
            className={`flex items-center justify-center px-3 h-8 leading-tight 
              border ${isActive ? "bg-gray-200 text-primary-600" : "bg-white text-gray-500"} 
              hover:bg-gray-100 hover:text-primary-700 dark:bg-gray-800 dark:border-gray-700 
              dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white`}
          >
            {i}
          </a>
        </li>
      );
    }
  
    return (
      <ul className="inline-flex -space-x-px rtl:space-x-reverse text-sm h-8">
        {pageButtons}
      </ul>
    );
  }
  
  export default Pagination;