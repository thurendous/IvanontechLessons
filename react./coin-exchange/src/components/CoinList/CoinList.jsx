import React, { Component } from 'react';
import Coin from "../Coin/Coin";
import styled from "styled-components";

const Table = styled.table`
margin: 50px auto 50px auto;
display: inline-block;
font-size: 1.75rem;
`

export default class CoinList extends Component {
    render() {
        return (
            <Table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Ticker</th>
                <th>Price</th>
              </tr>
            </thead>
            <tbody>
              {this.props.coinData.map(({ name, ticker, price }) => (
                <Coin key={ticker} name={name} ticker={ticker} price={price} />
              ))}
              {/* {[
                <Coin
                  name={this.state.coinData[0].name}
                  ticker={this.state.coinData[0].ticker}
                  price={this.state.coinData[0].price}
                />,
                <Coin
                  name={this.state.coinData[0].name}
                  ticker={this.state.coinData[0].ticker}
                  price={this.state.coinData[0].price}
                />,
                <Coin
                  name={this.state.coinData[2].name}
                  ticker={this.state.coinData[2].ticker}
                  price={this.state.coinData[2].price}
                />,
                <Coin
                  name={this.state.coinData[0].name}
                  ticker={this.state.coinData[0].ticker}
                  price={this.state.coinData[0].price}
                />,
              ]} */}
            </tbody>
          </Table>
        )
    }
}
