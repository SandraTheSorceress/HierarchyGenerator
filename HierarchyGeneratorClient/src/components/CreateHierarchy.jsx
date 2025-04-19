// components/CreateHierarchy.jsx
export default function CreateHierarchy({ setMessage, setView }) {
    const handleSubmit = (e) => {
      e.preventDefault();
      fetch('/backend/api/hierarchy', {
        method: 'POST',
        body: JSON.stringify({ /* PUT BODY PAYLOAD HERE */ }),
        headers: {
          'Content-Type': 'application/json'
        }
      })
      .then(res => res.json())
      .then(() => {
        setMessage("✅ Hierarchy created successfully!");
        setTimeout(() => setMessage(''), 3000);
        setView('overview');
      })
      .catch(() => {
        setMessage("⚠️ Failed to create hierarchy.");
        setTimeout(() => setMessage(''), 3000);
      });
    };
  
    return (
      <div className="p-4">
        <h2 className="text-2xl font-bold mb-4">Create New Hierarchy</h2>
        <form onSubmit={handleSubmit}>
          {/* Your form fields here */}
          <input className="border p-2 mb-2 block w-full" placeholder="Hierarchy Name" />
          <div className="flex items-center gap-2 flex-wrap">
          <button type="submit" className="inline-block px-4 py-2 bg-blue-400 text-white rounded-md hover:bg-blue-700 transition-colors">
            Create
          </button>
          <button type="button" onClick={() => setView('overview')} className="inline-block px-4 py-2 bg-gray-400 text-white rounded-md hover:bg-gray-700 transition-colors">
            Cancel
          </button>
          </div>
        </form>
      </div>
    );
  }
  