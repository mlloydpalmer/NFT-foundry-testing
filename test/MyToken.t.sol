// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "src/MyToken.sol";
import "openzeppelin-contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "openzeppelin-contracts/proxy/transparent/ProxyAdmin.sol";

contract MyTokenTest is Test {
    MyToken implementationV1;
    MyToken wrappedProxyV1;
    ProxyAdmin admin;
    TransparentUpgradeableProxy proxy;
    address alice = address(0xA11CE);


    function setUp() public {
        // vm.startPrank(alice);
        implementationV1 = new MyToken();
        admin = new ProxyAdmin();
        proxy = new TransparentUpgradeableProxy(address(implementationV1), address(admin), "");
        wrappedProxyV1 = MyToken(address(proxy));
        wrappedProxyV1.initialize();
    }

    function testBalanceOf() public {
        console.log("balance before %s",wrappedProxyV1.balanceOf(address(this)));
        wrappedProxyV1.mint(address(this), 5);
        console.log("balance after %s", wrappedProxyV1.balanceOf(address(this)));
    }
}