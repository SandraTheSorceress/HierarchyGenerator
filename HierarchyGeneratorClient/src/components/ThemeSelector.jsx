import React from "react";
import theme_fantasy from "../assets/theme_fantasy.jpg";
import theme_space from "../assets/theme_space.jpg";
import theme_viking from "../assets/theme_viking.jpg";

const themeImages = {
  FANTASY: theme_fantasy,
  SPACE: theme_space,
  VIKING: theme_viking,
};

export default function ThemeSelector({ selectedTheme, handleThemeChange }) {
  return (
    <div className="mb-4">
      <div className="flex gap-4 items-center">
        <label className="mr-4">
          <input
            type="radio"
            name="theme"
            value="FANTASY"
            checked={selectedTheme === "FANTASY"}
            onChange={handleThemeChange}
            className="mr-2"
          />
          Fantasy
        </label>
        <label className="mr-4">
          <input
            type="radio"
            name="theme"
            value="SPACE"
            checked={selectedTheme === "SPACE"}
            onChange={handleThemeChange}
            className="mr-2"
          />
          Space
        </label>
        <label>
          <input
            type="radio"
            name="theme"
            value="VIKING"
            checked={selectedTheme === "VIKING"}
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
