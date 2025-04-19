import { useState } from "react";
import theme_fantasy from "../assets/theme_fantasy.jpg";
import theme_space from "../assets/theme_space.jpg";
import theme_viking from "../assets/theme_viking.jpg";

export default function CreateHierarchy({
  setMessage,
  setMessageType,
  setView,
}) {
  const [name, setName] = useState("");
  const [selectedTheme, setSelectedTheme] = useState("fantasy");

  const themeImages = {
    fantasy: theme_fantasy,
    space: theme_space,
    viking: theme_viking,
  };

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
      <h1 className="text-4xl font-bold mb-4 text-center">Create New Hierarchy</h1>
    
    <div className="p-4 flex items-start gap-8">
      <div className="flex-1">
        <h2 className="text-2xl font-bold mb-4">Name hierarchy</h2>
        <form onSubmit={handleSubmit}>
          <input
            className="border p-2 mb-2 block w-full"
            placeholder="Hierarchy Name"
            onChange={(e) => setName(e.target.value)}
          />
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
      <h2 className="text-2xl font-bold mb-4">Choose a theme</h2>
        <div className="mb-4">
          <label className="mr-4">
            <input
              type="radio"
              name="theme"
              value="fantasy"
              checked={selectedTheme === "fantasy"}
              onChange={handleThemeChange}
              className="mr-2"
            />
            Fantasy
          </label>
          <label className="mr-4">
            <input
              type="radio"
              name="theme"
              value="space"
              checked={selectedTheme === "space"}
              onChange={handleThemeChange}
              className="mr-2"
            />
            Space
          </label>
          <label>
            <input
              type="radio"
              name="theme"
              value="viking"
              checked={selectedTheme === "viking"}
              onChange={handleThemeChange}
              className="mr-2"
            />
            Viking
          </label>
        </div>
        
        {/* Image based on selected theme */}
        <img
          src={themeImages[selectedTheme]}
          alt={`${selectedTheme} theme`}
          className="w-full h-auto rounded-3xl shadow-lg"
        />
      </div>
    </div>
    </div>
  );
}
