pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundableCrowdsale.sol";

contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundableCrowdsale {
    
    constructor(
        uint rate,
        address payable wallet,
        PupperCoin token
        
    )
        Crowdsale(rate, wallet, token) public
        CappedCrowdsale(300)
        TimedCrowdsale(now, now + 24 weeks)
        RefundableCrowdsale(250)
        
    {
        
    }
}

contract PupperCoinSaleDeployer {

    address payable owner;
    address public token_sale_address;
    address public token_address;
    uint closingTime = now + 24 weeks;
    
    modifier onlyOwner {
        require(msg.sender == owner, "You do not own this contract!");
        _;
    }
    
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
        
        
    {
        
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);
        
        PupperCoinSale token_sale = new PupperCoinSale(1, wallet, token);
        token_sale_address = address(token_sale);
        
    
        token.addMinter(token_sale_address);
        token.renounceMinter();
        
    }
    function hasClosed() public view returns (bool) {
        return now > closingTime;
    }
    
    function finalize() onlyOwner public {
        require(hasClosed());
    }
}


