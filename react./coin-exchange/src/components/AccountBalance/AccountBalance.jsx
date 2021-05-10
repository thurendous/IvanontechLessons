import React, { Component } from "react";
import PropTypes from "prop-types";
import styled from "styled-components";


const Section = styled.section`
  border: 1px solid red; 
  font-size: 2rem;
  text-align: left;
  padding: 1rem 0rem 1.5rem 5rem;
` 
const ButtonShowHide = styled.button`
font-size: 1em;
  margin: 1em;
  padding: 0.25em 1em;
  border: 2px solid palevioletred;
  border-radius: 3px;
  color:  palevioletred;
`

export default class AccountBalance extends Component {


  render() {
    const showBalance = this.props.showBalance;
    const balance = this.props.balance;
    const buttonText = showBalance ? "hide balance" :`show balance`;
    return (
    <Section>
      Account Balance: ${showBalance?balance:`****`}
      <ButtonShowHide onClick={this.props.toggleHideBalance}>{buttonText}</ButtonShowHide>
    </Section>);
  }
}

AccountBalance.propTypes = { 
  // data type checks
  amount: PropTypes.number.isRequired,
};
