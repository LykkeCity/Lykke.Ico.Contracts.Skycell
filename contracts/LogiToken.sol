pragma solidity ^0.4.21;

/*
 *  To simplify flow and deploying process we don't use MiniMe Controller functionality,
 *  instead we extend it through inheritance.
 *
 *  See https://github.com/Giveth/minime for details of MiniMe.
 */

import "./MiniMeToken.sol";

/**
 * @title Smart Containers LOGI token contract 
 */
contract LogiToken is MiniMeToken {
    /**
     * @dev Logi constructor just parametrizes the MiniMeToken constructor
     */
    function LogiToken() public MiniMeToken(
        new MiniMeTokenFactory(), // no external token factory
        0x0,                      // no parent token
        0,                        // no parent token - no snapshot block number
        "LogiToken",              // Token name
        18,                       // Decimals
        "LOGI",                   // Symbol
        false                     // Disable transfers for time of minting
    ) {}

    uint256 public constant maxSupply = 100 * 1000 * 1000 * 10**uint256(decimals); // use the smallest denomination unit to operate with token amounts

    /**
     * @dev Finishes minting process and throws out the controller.
     */
    function finishMinting() public onlyController() {
        assert(totalSupply() <= maxSupply); // ensure hard cap
        enableTransfers(true); // turn-on transfers
        changeController(address(0x0)); // ensure no new tokens will be created
    }
}