//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract Proposal {
  event Debug();

  function execute() public {
    emit Debug();
  }
}
