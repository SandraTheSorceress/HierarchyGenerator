import logo from "./assets/logo.png";

function Header({ title }) {
  return (
    <header className="flex items-center justify-center pt-7">
      <img src={logo} alt="Logo" className="w-48 pt-10" />
      <div>
        <h1 className="text-6xl font-bold text-blue-900">Hierarchy</h1>
        <h1 className="text-6xl font-bold text-blue-900 pl-20">Generator</h1>
      </div>
    </header>
  );
}

export default Header;
