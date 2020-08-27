//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract Primary {
  function execute(address target) public returns(bytes memory) {
    (bool success, bytes memory data) = target.delegatecall(
      abi.encodeWithSignature("execute()")
    );
    if (!success) {
      if (data.length > 0) {
        revert(string(data));
      } else {
        revert("delegatecall failed");
      }
    }
    return data;
  }
}
