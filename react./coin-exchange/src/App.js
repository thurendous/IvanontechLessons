import React, { Component } from "react";
import CoinList from "./components/CoinList/CoinList";
import AccountBalance from "./components/AccountBalance/AccountBalance";
import Header from "./components/Header";
import styled from "styled-components";

// you can import uuid to use as an id

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

const Div = styled.div`
  text-align: center;
  background: rgb(20, 56, 97);
  color: #ccc;
`;

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      balance: 1000,
      coinData: [
        {
          name: "Bitcoin",
          ticker: "BTC",
          price: 100000,
        },
        {
          name: "Ethereum",
          ticker: "ETH",
          price: 15000,
        },
        {
          name: "Tether",
          ticker: "USDT",
          price: 1,
        },
        {
          name: "Ripple",
          ticker: "XRP",
          price: 1.5,
        },
        {
          name: "Bitcoin cash",
          ticker: "BCH",
          price: 899.9,
        },
        {
          name: "Ethereum",
          ticker: "ETC",
          price: 1000,
        },
      ],
    };
  }
  render() {
    return (
      <Div className="App">
        <Header />
        <AccountBalance amount={this.state.balance} />
        <CoinList coinData={this.state.coinData} />
      </Div>
    );
  }
}

export default App;
