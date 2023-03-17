// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testGetNumber() public {
        assertEq(counter.getNumber(), 0);
    }

    function testFailGetNumber() public {
        assertEq(counter.getNumber(), 4);
    }

    function testSetNumber() public {
        counter.setNumber(2);
        assertEq(counter.getNumber(), 2);
    }

    function testCannotSetNumberMoreThanFive() public {
        vm.expectRevert("Number must be less than 5");
        counter.setNumber(6);
    }
}
