{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "pragma solidity ^0.6.0;\n",
    "\n",
    "import \"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol\";\n",
    "\n",
    "\n",
    "contract AssociateProfitSplitter {\n",
    "    using SafeMath for uint;\n",
    "    \n",
    "    address payable owner = msg.sender;\n",
    "    address payable employee_one;\n",
    "    address payable employee_two;\n",
    "    address payable employee_three;\n",
    "    \n",
    "    mapping(address => uint) balances;\n",
    "    \n",
    "    modifier onlyOwner() {\n",
    "            require(msg.sender == owner);\n",
    "            _;\n",
    "        }\n",
    "    \n",
    "    constructor(address payable _one, address payable _two, address payable _three) public{\n",
    "        employee_one = _one;\n",
    "        employee_two = _two;\n",
    "        employee_three = _three;\n",
    "    }\n",
    "    \n",
    "    \n",
    "    function balance() public view returns (uint) {\n",
    "        require(address(this).balance > 0, \"The deposit function is not working properly\");\n",
    "    }\n",
    "    \n",
    "    function deposit() public payable onlyOwner{\n",
    "        uint amount = msg.value.div(3);\n",
    "        \n",
    "        balances[msg.sender] = balances[msg.sender].sub(amount);\n",
    "        balances[employee_one] = balances[employee_one].add(amount);\n",
    "        balances[employee_two] = balances[employee_two].add(amount);\n",
    "        balances[employee_three] = balances[employee_three].add(amount);\n",
    "        \n",
    "        uint remainder = msg.value.sub(amount.mul(3));\n",
    "        msg.sender.transfer(remainder);\n",
    "    }\n",
    "    \n",
    "    fallback() external {\n",
    "        deposit;\n",
    "    }\n",
    "}"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
