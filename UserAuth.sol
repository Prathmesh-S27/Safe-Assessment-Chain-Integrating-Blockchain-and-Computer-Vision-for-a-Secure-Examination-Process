//SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract UserAuth {
    struct User {
        address userAddress;
        bytes32 usernameHash;
        bytes32 passwordHash;
    }

    mapping(address => User) private users;

    // Register a new user
    function registerUser(string memory _username, string memory _password) public {
        require(users[msg.sender].userAddress == address(0), "User already registered");

        // Store hash of username and password for privacy
        users[msg.sender] = User({
            userAddress: msg.sender,
            usernameHash: keccak256(abi.encodePacked(_username)),
            passwordHash: keccak256(abi.encodePacked(_password))
        });
    }

    // Verify login
    function loginUser(string memory _username, string memory _password) public view returns (bool) {
        User memory user = users[msg.sender];
        require(user.userAddress != address(0), "User not registered");

        // Verify username and password match stored hashes
        return (user.usernameHash == keccak256(abi.encodePacked(_username)) &&
                user.passwordHash == keccak256(abi.encodePacked(_password)));
    }

    // Check if a user is registered
    function isUserRegistered() public view returns (bool) {
        return users[msg.sender].userAddress != address(0);
    }
}
