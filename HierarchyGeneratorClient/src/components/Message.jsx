import React from 'react';

export default function Message({ message, messageType }) {
  if (!message) return null;

  const messageClasses = messageType === 'success' 
    ? 'fixed top-4 left-1/2 transform -translate-x-1/2 z-50 bg-green-100 border border-green-300 text-green-700 px-6 py-3 rounded-md shadow-lg' 
    : 'fixed top-4 left-1/2 transform -translate-x-1/2 z-50 bg-red-100 border border-red-300 text-red-700 px-6 py-3 rounded-md shadow-lg';

  return (
    <div className={`${messageClasses}`}>
      {message}
    </div>
  );
}
