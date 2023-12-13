import React from "react"
import { Component } from 'react';

import { useEffect, useState } from 'react';

const SearchBar = (props) => {

  const onKeyDown = (e) => {
    if (e.key == 'Enter' && e.target.value.length > 0) {
      window.location.href = '/posts/search?title=' + e.target.value;
    }
  }

  return (
    <div>
      <input type="text"
        placeholder="Search Images"
        onKeyDown={onKeyDown}
        defaultValue={props.title}
      />
    </div>
  );
}

export default SearchBar;
