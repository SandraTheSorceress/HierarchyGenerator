import { useState } from "react";
import ThemeSelector from "./ThemeSelector";
import NodeAmountSelector from "./NodeAmountSelector";

export default function CreateHierarchy({
  setMessage,
  setMessageType,
  setView,
}) {
  const [name, setName] = useState("");
  const [selectedTheme, setSelectedTheme] = useState("FANTASY");
  const [l1Nodes, setL1Nodes] = useState("A_FEW");
  const [l2Nodes, setL2Nodes] = useState("NONE");
  const [l3Nodes, setL3Nodes] = useState("NONE");
  const [l4Nodes, setL4Nodes] = useState("NONE");
  const [l5Nodes, setL5Nodes] = useState("NONE");

  const handleThemeChange = (e) => {
    setSelectedTheme(e.target.value);
  };

  const handleL1NodesChange = (e) => {
    setL1Nodes(e.target.value);
  };

  const handleL2NodesChange = (e) => {
    const newValue = e.target.value;
    setL2Nodes(newValue);
    if (newValue === "NONE") {
      setL3Nodes("NONE");
    }
  };

  const handleL3NodesChange = (e) => {
    const newValue = e.target.value;
    setL3Nodes(newValue);
    if (newValue === "NONE") {
      setL4Nodes("NONE");
    }
  };

  const handleL4NodesChange = (e) => {
    const newValue = e.target.value;
    setL4Nodes(newValue);
    if (newValue === "NONE") {
      setL5Nodes("NONE");
    }
  };

  const handleL5NodesChange = (e) => {
    const newValue = e.target.value;
    setL5Nodes(newValue);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const payload = {
      name: name,
      theme: selectedTheme,
      l1: l1Nodes,
      l2: l2Nodes,
      l3: l3Nodes,
      l4: l4Nodes,
      l5: l5Nodes,
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

  const l1Options = [
    { value: "A_FEW", display: "A few" },
    { value: "SOME", display: "Some" },
    { value: "SURPRISE_ME", display: "Surprise me" },
  ];

  const l2Options = [
    { value: "NONE", display: "None" },
    { value: "A_FEW", display: "A few" },
    { value: "SOME", display: "Some" },
    { value: "SURPRISE_ME", display: "Surprise me" },
  ];

  const l3Options = [
    { value: "NONE", display: "None" },
    { value: "A_FEW", display: "A few" },
    { value: "SOME", display: "Some" },
    { value: "SURPRISE_ME", display: "Surprise me" },
  ];

  const l4Options = [
    { value: "NONE", display: "None" },
    { value: "A_FEW", display: "A few" },
    { value: "SOME", display: "Some" },
    { value: "SURPRISE_ME", display: "Surprise me" },
  ];

  const l5Options = [
    { value: "NONE", display: "None" },
    { value: "A_FEW", display: "A few" },
    { value: "SOME", display: "Some" },
    { value: "A_LOT", display: "A lot" },
    { value: "TONS", display: "Tons" },
    { value: "SURPRISE_ME", display: "Surprise me" },
  ];

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
                class="w-full bg-gray-50 px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition duration-150 ease-in-out"
                placeholder="Enter hierarchy name"
                type="text"
                onChange={(e) => setName(e.target.value)}
              />
            </div>

            <NodeAmountSelector
              label="How many L1 nodes do you want?"
              name="l1Nodes"
              options={l1Options}
              selected={l1Nodes}
              onChange={handleL1NodesChange}
            />

            <NodeAmountSelector
              label="How many L2 nodes do you want?"
              name="l2Nodes"
              options={l2Options}
              selected={l2Nodes}
              onChange={handleL2NodesChange}
            />

            {l2Nodes !== "NONE" && (
              <NodeAmountSelector
                label="How many L3 nodes do you want?"
                name="l3Nodes"
                options={l3Options}
                selected={l3Nodes}
                onChange={handleL3NodesChange}
              />
            )}

            {l3Nodes !== "NONE" && (
              <NodeAmountSelector
                label="How many L4 nodes do you want?"
                name="l4Nodes"
                options={l4Options}
                selected={l4Nodes}
                onChange={handleL4NodesChange}
              />
            )}

            {l4Nodes !== "NONE" && (
              <NodeAmountSelector
                label="How many L5 nodes do you want?"
                name="l5Nodes"
                options={l5Options}
                selected={l5Nodes}
                onChange={handleL5NodesChange}
              />
            )}

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
          <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
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
