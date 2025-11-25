// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract DIOVoting {

    mapping (string => uint256) public votesReceived;
    string[] public candidateList;

    constructor(string[] memory candidateNames) {
        candidateList = candidateNames;
    }

    function totalVotesFor(string memory candidate) public view returns (uint256) {
        require(validCandidate(candidate), "Invalid candidate");
        return votesReceived[candidate];
    }

    function voteForCandidate(string memory candidate) public {
        require(validCandidate(candidate), "Invalid candidate");
        votesReceived[candidate] += 1;
    }

    function validCandidate(string memory candidate) public view returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (
                keccak256(bytes(candidateList[i])) ==
                keccak256(bytes(candidate))
            ) {
                return true;
            }
        }
        return false;
    }
}