import React from "react";
import theme_fantasy from "../assets/theme_fantasy.jpg";
import theme_space from "../assets/theme_space.jpg";
import theme_viking from "../assets/theme_viking.jpg";

const themeImages = {
  fantasy: theme_fantasy,
  space: theme_space,
  viking: theme_viking,
};

export default function ThemeSelector({ selectedTheme, handleThemeChange }) {
  return (
    <div className="mb-4">
      <div className="flex gap-4 items-center">
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
      <div className="mt-4">
        <img
          src={themeImages[selectedTheme]}
          alt={`${selectedTheme} theme`}
          className="w-full h-auto rounded-3xl shadow-lg"
        />
      </div>
    </div>
  );
}
