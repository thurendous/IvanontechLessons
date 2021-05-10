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

class App extends Component {
  state = {
    balance: 1000,
    showBalance: true,
    coinData: [
      {
        name: "Bitcoin",
        ticker: "BTC",
        balance: 0.5,
        price: 100000,
      },
      {
        name: "Ethereum",
        ticker: "ETH",
        balance: 40,
        price: 15000,
      },
      {
        name: "Tether",
        ticker: "USDT",
        balance: 1,
        price: 1,
      },
      {
        name: "Ripple",
        ticker: "XRP",
        balance: 2,
        price: 1.5,
      },
      {
        name: "Bitcoin cash",
        ticker: "BCH",
        price: 899.9,
        balance: 2,
      },
      {
        name: "Ethereum classic",
        ticker: "ETC",
        balance: 22,
        price: 1000,
      },
    ],
  };
  // constructor(props) {
  //   super(props);
  // above is generated automatically DELETED

  // this.handleRefresh = this.handleRefresh.bind(this);
  // this.toggleHideBalance = this.toggleHideBalance.bind(this);
  // }

  toggleHideBalance = () => {
    this.setState({
      showBalance: !this.state.showBalance,
    });
  };

  handleRefresh = (valueChangeTicker) => {
    const newCoinData = this.state.coinData.map(
      // ({ ticker, name, price, balance }) => {
      ({ values }) => {
        let newPrice = price;
        let newValues = { ...values };
        if (valueChangeTicker === ticker) {
          const randomPercentage = 0.995 + Math.random() * 0.01;
          newValues.newPrice *= randomPercentage;
        }
        return newValues;
      }
    );
    this.setState({ coinData: newCoinData });
    console.log(valueChangeTicker);
    console.log(newCoinData);
  };

  render() {
    return (
      <Div className="App">
        <Header />
        <AccountBalance
          showBalance={this.state.showBalance}
          balance={this.state.balance}
          toggleHideBalance={this.toggleHideBalance}
        />
        <CoinList
          coinData={this.state.coinData}
          handleRefresh={this.handleRefresh}
          showBalance={this.state.showBalance}
        />
      </Div>
    );
  }
}

export default App;
