
import React, { Component } from 'react'
import "./Coin.css";
import propTypes from "prop-types";// purpose: check the type of the variables

export default class Coin extends Component {
    constructor(props) {
        super(props);
        this.state = {
            price: this.props.price,
        }
        this.handleClick = this.handleClick.bind(this);
    }


    /*
    componentDidMount() {
        const callback = () => {
            // set the state
            const randomPercentage = 0.95 + Math.random() * 0.01
        
            // DONT'T do this: 
            // this.state.price = this.state.price * randomPercentage;
            this.setState( function (oldState) {
                return {price: oldState.price * randomPercentage};
            // or this.setState({price: this.sate.price * randomPercentage})
        });
    }
        setInterval( callback, 1000);
    }
    */
    handleClick(event) {
        event.preventDefault();
        const randomPercentage = 0.995 + Math.random() * 0.01;
        this.setState(function(oldState) {
            return {
                price: oldState.price * randomPercentage
            };
        });
        // prevent the default action of submitting the form
    }

    render() {
        return (
                <tr className="coin-row">
                    <td>{this.props.name}</td>
                    <td>{this.props.ticker}</td>
                    <td>${this.state.price}</td>
                    <td>
                        <form action="#" method="POST">
                            <button onClick={this.handleClick}>Refresh</button>
                        </form>
                    </td>
                </tr>
        );
    }
}

Coin.propTypes = {
    name: propTypes.string.isRequired,
    ticker: propTypes.string.isRequired,
    price: propTypes.number.isRequired,
};