import { createRoot } from "react-dom/client";
import "./index.css";
import App from "./App.jsx";
import { GoogleOAuthProvider } from '@react-oauth/google';



createRoot(document.getElementById("root")).render(
    <GoogleOAuthProvider clientId="124048570352-kc8tmq3fm46tsu0meti06ivgp7p42f58.apps.googleusercontent.com">
        <App />
    </GoogleOAuthProvider>
);
