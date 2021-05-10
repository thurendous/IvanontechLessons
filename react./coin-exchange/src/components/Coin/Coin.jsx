
import React, { Component } from 'react'
import propTypes from "prop-types";// purpose: check the type of the variables
import styled from "styled-components";

const Td = styled.td`
border: 1px solid #ccc;
width: 25vh;
color: #ccc;
`

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
        this.props.handleRefresh(this.props.ticker);
        // const randomPercentage = 0.995 + Math.random() * 0.01;
        // this.setState(function(oldState) {
        //     return {
        //         price: oldState.price * randomPercentage
            // };
        // });
        // prevent the default action of submitting the form
    }

    render() {
        return (
                <tr>
                    <Td>{this.props.name}</Td>
                    <Td>{this.props.ticker}</Td>
                    <Td>${this.props.price}</Td>
                    <Td>
                        <form action="#" method="POST">
                            <button onClick={this.handleClick}>Refresh</button>
                        </form>
                    </Td>
                </tr>
        );
    }
}

Coin.propTypes = {
    name: propTypes.string.isRequired,
    ticker: propTypes.string.isRequired,
    price: propTypes.number.isRequired,
};