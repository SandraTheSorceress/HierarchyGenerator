export default function NodeAmountSelector({ label, name, options, selected, onChange }) {
    return (
      <div className="mb-4">
        <label className="block text-gray-700 text-sm font-bold mb-2">{label}</label>
        <div className="flex gap-4 flex-wrap">
          {options.map(({ value, display }) => (
            <div key={value}>
              <input
                type="radio"
                id={`${name}-${value}`}
                name={name}
                value={value}
                checked={selected === value}
                onChange={onChange}
                className="mr-2"
              />
              <label htmlFor={`${name}-${value}`} className="text-sm text-gray-700">
                {display}
              </label>
            </div>
          ))}
        </div>
      </div>
    );
  }
  