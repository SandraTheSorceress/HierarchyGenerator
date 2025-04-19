import { useState } from "react";
import ThemeSelector from "./ThemeSelector";

export default function CreateHierarchy({
  setMessage,
  setMessageType,
  setView,
}) {
  const [name, setName] = useState("");
  const [selectedTheme, setSelectedTheme] = useState("fantasy");

  const handleThemeChange = (e) => {
    setSelectedTheme(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const payload = {
      name: name,
      theme: "FANTASY",
      l1: "A_FEW",
      l2: "NONE",
      l3: "NONE",
      l4: "NONE",
      l5: "NONE",
    };

    fetch("/backend/api/hierarchy", {
      method: "POST",
      body: JSON.stringify(payload),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => {
        if (!res.ok) throw new Error("Request failed");
      })
      .then(() => {
        setMessageType("success");
        setMessage("Hierarchy created successfully!");
        setTimeout(() => setMessage(""), 3000);
        setView("overview");
      })
      .catch(() => {
        setMessageType("error");
        setMessage("Failed to create hierarchy.");
        setTimeout(() => setMessage(""), 3000);
      });
  };

  return (
    <div>
      <h1 className="text-4xl font-bold mb-4 text-center">
        Generate New Hierarchy
      </h1>

      <div className="p-4 flex items-start gap-8">
        <div className="flex-1">


          <form onSubmit={handleSubmit}>
            <div class="mb-4">
              <label
                class="block text-gray-700 text-sm font-bold mb-2"
                for="name"
              >
                Name your hierarchy
              </label>
              <input
                id="name"
                class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition duration-150 ease-in-out"
                placeholder="Enter hierarchy Name"
                type="text"
                onChange={(e) => setName(e.target.value)}
              />
            </div>

            <div className="flex items-center gap-2 flex-wrap">
              <button
                type="submit"
                className="inline-block px-4 py-2 bg-blue-400 text-white rounded-md hover:bg-blue-700 transition-colors"
              >
                Create
              </button>
              <button
                type="button"
                onClick={() => setView("overview")}
                className="inline-block px-4 py-2 bg-gray-400 text-white rounded-md hover:bg-gray-700 transition-colors"
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
        <div className="flex-1">
        <label
                class="block text-gray-700 text-sm font-bold mb-2"
                for="name"
              >
                Choose a theme
              </label>
          <ThemeSelector
            selectedTheme={selectedTheme}
            handleThemeChange={handleThemeChange}
          />
        </div>
      </div>
    </div>
  );
}
