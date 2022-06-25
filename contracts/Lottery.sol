//SPDX-License-Identifier:MIT


pragma solidity 0.8.8;
error Raffle__NeedMoreETH_ToEnter();
contract Lottery {

    uint256 private immutable i_entranceFee;
    address payable[]  private  players;

    constructor(uint256 entranceFee){
        i_entranceFee=entranceFee;
    }

    function  getEntranceFee()  public view returns (uint256) {
        return i_entranceFee;
        
    }

    function enterRaffle()  public payable {
        if(msg.value<i_entranceFee){
            revert Raffle__NeedMoreETH_ToEnter();
        }
        players.push(payable(msg.sender));
        
    }
}
