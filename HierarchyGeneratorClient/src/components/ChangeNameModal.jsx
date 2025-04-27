import React from "react";

function ChangeNameModal({ currentName, onConfirm, onCancel, setNewNameInputValue, newNameInputValue }) {
  const title = `Change name for "${currentName}"`
  return (
    <div className="fixed inset-0 bg-opacity-30 backdrop-blur-sm flex items-center justify-center z-50">
      <div className="bg-white dark:bg-gray-800 rounded-2xl shadow-2xl p-6 w-full max-w-md">
        <h2 className="text-xl font-semibold text-gray-800 dark:text-white mb-2">
          {title}
          </h2>
        <p className="text-gray-600 dark:text-gray-300 mb-4">
          <input type="text"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg 
                      focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 
                      dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 
                      dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      onChange={(e) => setNewNameInputValue(e.target.value)}
                      value={newNameInputValue}

          ></input>
        </p>
        <div className="flex justify-end gap-3">
          <button
            onClick={onCancel}
            className="px-4 py-2 rounded-md border border-gray-300 text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700"
          >
            Cancel
          </button>
          <button
            onClick={onConfirm}
            className="px-4 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-700"
          >
            Save
          </button>
        </div>
      </div>
    </div>
  );
}

export default ChangeNameModal;