import "./App.css";
import React, { Component } from "react";
import Coin from "./components/Coin/Coin";
import logo from "./logo.svg";

// export default class App extends Component {
//   render() {
//     return <div></div>;
//   }
// }

// export default class App extends Component {
//   render() {
//     return <div></div>;
//   }
// }

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} alt="logo" className="App-logo" />
        <h1>Coin Exchange</h1>
      </header>
      <table className="cointable">
        <thead>
          <tr>
            <th>Name</th>
            <th>Ticker</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          <Coin name="Bitcoin" ticker="BTC" price={9999.99} />
          <Coin name="Ethereum" ticker="ETH" price={3400.99} />
          <Coin name="Tether" ticker="ETH" price={299.99} />
          <Coin name="Ripple" ticker="XRP" price={0.1} />
        </tbody>
      </table>
    </div>
  );
}

export default App;
