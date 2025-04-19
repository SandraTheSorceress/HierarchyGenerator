import logo from "../assets/logo.png";

function Header({ title }) {
  return (
    <header className="flex">
      <img src={logo} alt="Logo" className="w-30 pt-2" />
      <div>
        <h1 className="text-4xl font-bold text-blue-900">Hierarchy</h1>
        <h1 className="text-4xl font-bold text-blue-900 pl-5">Generator</h1>
      </div>
    </header>
  );
}

export default Header;
