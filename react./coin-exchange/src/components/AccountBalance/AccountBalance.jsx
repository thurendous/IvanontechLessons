import React, { Component } from "react";
import PropTypes from "prop-types";
import styled from "styled-components";


const Section = styled.section`
  border: 1px solid red; 
  font-size: 2rem;
  text-align: left;
  padding: 1rem 0rem 1.5rem 5rem;
` 

export default class AccountBalance extends Component {
  render() {
    return (
    <Section>
      Account Balance: ${this.props.amount}
    </Section>);
  }
}

AccountBalance.propTypes = { 
  // data type checks
  amount: PropTypes.number.isRequired,
};
