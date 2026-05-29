// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BasicFiles {
    enum Status { Todo, Doing, Done }
    event StatusChanged(address indexed operator, Status status);

    mapping(address => Status) public statuses;

    function setStatus(Status status) external {
        require(status != Status.Todo, "status must advance");
        statuses[msg.sender] = status;
        emit StatusChanged(msg.sender, status);
    }
}
