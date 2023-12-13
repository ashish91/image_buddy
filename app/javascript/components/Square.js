import React from "react"
import { Component } from 'react';

export default class Square extends Component {
  constructor(props) {
    super(props);
  }

  handleClick() {
    console.log('clicked!');
  }

  render() {
    const { value } = this.props;
    return (
      <button
        className="square"
        onClick={this.handleClick}
      >{value}</button>
    )
  }
}
