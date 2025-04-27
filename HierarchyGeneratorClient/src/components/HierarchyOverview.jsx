import { useState } from "react";

import Pagination from "./Pagination";
import SearchBar from "./SearchBar";
import DeleteConfirmationModal from "./DeleteConfirmationModal";
import ChangeNameModal from "./ChangeNameModal";
import HierarchyRow from "./HierarchyRow";

function HierarchyOverview({
  hierarchyList,
  setSearchQuery,
  setPage,
  refreshPage,
  setMessage,
  setView,
  userInfo,
  googleToken,
}) {
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const [showChangeNameModal, setShowChangeNameModal] = useState(false);
  const [selectedHierarchy, setSelectedHierarchy] = useState(null);
  const [newNameInputValue, setNewNameInputValue] = useState(null);

  function deleteHierarchy(hierarchy) {
    fetch(`/backend/api/hierarchy/${hierarchy.id}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${googleToken}`,
      },
    })
      .then((response) => {
        if (!response.ok) throw new Error("Failed to delete");
        refreshPage();
        setMessage(`${hierarchy.name} is deleted`);
        setTimeout(() => setMessage(""), 3000);
      })
      .catch((error) => {
        console.error("Error:", error);
        setMessage("Failed to delete");
        setTimeout(() => setMessage(""), 3000);
      });
  }

  function changeNameHierarchy(hierarchyId, newName) {

    const payload = {
      newName: newName,
    };

    fetch(`/backend/api/hierarchy/${hierarchyId}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${googleToken}`,
      },
      body: JSON.stringify(payload),
    })
      .then((response) => {
        if (!response.ok) throw new Error("Failed to update name");
        refreshPage();
        setMessage(`Hierarchy with id ${hierarchyId} has changed name to ${newName} .`);
        setTimeout(() => setMessage(""), 3000);
      })
      .catch((error) => {
        console.error("Error:", error);
        setMessage("Failed to change name");
        setTimeout(() => setMessage(""), 3000);
      });
  }

  return (
    <div className="bg-gray-50 dark:bg-gray-800 relative shadow-md sm:rounded-lg overflow-hidden mt-10">
      <div className="p-4">
        <div className="flex items-center gap-2 flex-wrap">
          <SearchBar
            onSearch={(query) => {
              setPage(1);
              setSearchQuery(query);
            }}
          />
          {userInfo && (
            <button
              className="inline-block px-4 py-2 bg-green-400 text-white rounded-md hover:bg-green-700 transition-colors"
              onClick={() => setView("create")}
            >
              New Hierarchy
            </button>
          )}
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
                Last modified
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
              <HierarchyRow
                key={hierarchy.id}
                hierarchy={hierarchy}
                userInfo={userInfo}
                onDeleteClick={(hierarchy) => {
                  setSelectedHierarchy(hierarchy);
                  setShowDeleteModal(true);
                }}
                onChangeNameClick={(hierarchy) => {
                  setNewNameInputValue(hierarchy.name)
                  setSelectedHierarchy(hierarchy);
                  setShowChangeNameModal(true);
                }}
              />
            ))}
          </tbody>
        </table>
        <nav
          className="flex items-center flex-column flex-wrap md:flex-row justify-between p-4"
          aria-label="Table navigation"
        >
          <Pagination
            hierarchyList={hierarchyList}
            onPageChange={setPage}
          />
        </nav>
      </div>
      {showDeleteModal && selectedHierarchy && (
        <DeleteConfirmationModal
          title="Confirm Deletion"
          message={`Are you sure you want to delete "${selectedHierarchy.name}"? This action cannot be undone.`}
          onConfirm={() => {
            deleteHierarchy(selectedHierarchy);
            setShowDeleteModal(false);
            setSelectedHierarchy(null);
          }}
          onCancel={() => {
            setShowDeleteModal(false);
            setSelectedHierarchy(null);
          }}
        />
      )}
      {showChangeNameModal && selectedHierarchy && (
        <ChangeNameModal
          currentName={selectedHierarchy.name}
          newNameInputValue={newNameInputValue}
          setNewNameInputValue={setNewNameInputValue}
          onConfirm={() => {
            changeNameHierarchy(selectedHierarchy.id, newNameInputValue);
            setShowChangeNameModal(false);
            setSelectedHierarchy(null);
          }}
          onCancel={() => {
            setShowChangeNameModal(false);
            setSelectedHierarchy(null);
          }}
        />
      )}
    </div>
  );
}

export default HierarchyOverview;
