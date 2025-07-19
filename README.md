// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BridgeL2 {
    address public admin;
    event Mint(address indexed user, uint256 amount);

    constructor() {
        admin = msg.sender;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, "Only admin");
        emit Mint(to, amount);
    }
}
