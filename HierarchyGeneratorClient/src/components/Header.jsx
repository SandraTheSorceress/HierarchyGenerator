import logo from "../assets/logo.png";
import { GoogleLogin } from "@react-oauth/google";
import { jwtDecode } from "jwt-decode";

function Header({
  userInfo,
  setGoogleToken,
  setUserInfo,
  setMessage,
  setMessageType,
  setView
}) {
  const handleLoginSuccess = (credentialResponse) => {
    const token = credentialResponse.credential;
    const decoded = jwtDecode(token);

    setGoogleToken(token);
    setUserInfo(decoded);

    setMessageType("success");
    setMessage(`Hello ${decoded.given_name}! You have been logged in`);
    setTimeout(() => setMessage(""), 3000);

    console.log("Google Token:", token);
    console.log("User Info:", decoded);
  };

  return (
    <header className="flex justify-between items-start w-full px-4 py-2">
      <div className="flex items-start">
        <img src={logo} alt="Logo" className="w-30 pt-2" />
        <div>
          <h1 className="text-4xl font-bold text-blue-900">Hierarchy</h1>
          <h1 className="text-4xl font-bold text-blue-900 pl-5">Generator</h1>
        </div>
      </div>
      <div className="flex flex-col items-end">
        {userInfo ? (
          <div className="flex flex-col items-end text-sm text-gray-700">
            <p className="mb-1">
              Logged in as <strong>{userInfo.given_name}</strong>
            </p>
            <button
              onClick={() => {
                setView("overview");
                setGoogleToken(null);
                setUserInfo(null);
                setMessageType("success");
                setMessage("You have been logged out.");
                setTimeout(() => setMessage(""), 3000);

              }}
              className="px-4 py-2 bg-gray-400 text-white rounded-full shadow hover:bg-gray-700 transition duration-200 text-sm"
            >
              Logout
            </button>
          </div>
        ) : (
          <GoogleLogin
            onSuccess={handleLoginSuccess}
            onError={() => console.log("Login Failed")}
          />
        )}
      </div>
    </header>
  );
}

export default Header;
