// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Basic Storage Contract
contract SimpleStorage {
    uint public storedData;

    constructor(uint initialValue) {
        storedData = initialValue;
    }

    function set(uint value) public {
        storedData = value;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}

// Simple Token Contract
contract SimpleToken {
    string public name = "SimpleToken";
    string public symbol = "SIM";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply; // Assign the entire supply to the creator
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    function balance(address _owner) public view returns (uint256) {
        return balanceOf[_owner];
    }
}

// Simple Voting Contract
contract Voting {
    mapping (address => uint) public votesReceived;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function vote(address candidate) public {
        require(msg.sender != owner, "Owner cannot vote");
        votesReceived[candidate] += 1;
    }

    function getVotes(address candidate) public view returns (uint) {
        return votesReceived[candidate];
    }

    function resetVotes(address candidate) public {
        require(msg.sender == owner, "Only the owner can reset votes");
        votesReceived[candidate] = 0;
    }
}