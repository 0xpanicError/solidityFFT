// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FFT} from "../src/fft.sol";

contract FFTTest is Test {
    FFT public fft;

    function setUp() public {
        fft = new FFT();
    }

    function testFFT() public {
        int[8] memory re = [int(0), 1, 3, 4, 4, 3, 1, 0];
        int[8] memory im = [int(0), 1, 3, 4, 4, 3, 1, 0];
        for (uint i = 0; i < 8; i++) {
            re[i] *= 1e18;
            im[i] *= 1e18;
        }
        (re, im) = fft.fft(re, im);
        assertApproxEqAbs(re[0], 16 * 1e18, 1e15);
        assertApproxEqAbs(im[0], 16 * 1e18, 1e15);
        assertApproxEqAbs(re[1], -4828 * 1e15, 1e15);
        assertApproxEqAbs(im[1], -11656 * 1e15, 1e15);
        assertApproxEqAbs(re[2], 0 * 1e18, 1e15);
        assertApproxEqAbs(im[2], 0 * 1e18, 1e15);
        assertApproxEqAbs(re[3], -343 * 1e15, 1e15);
        assertApproxEqAbs(im[3], 828 * 1e15, 1e15);
        assertApproxEqAbs(re[4], 0 * 1e18, 1e15);
        assertApproxEqAbs(im[4], 0 * 1e18, 1e15);
        assertApproxEqAbs(re[5], 828 * 1e15, 1e15);
        assertApproxEqAbs(im[5], -343 * 1e15, 1e15);
        assertApproxEqAbs(re[6], 0 * 1e18, 1e15);
        assertApproxEqAbs(im[6], 0 * 1e18, 1e15);
        assertApproxEqAbs(re[7], -11656 * 1e15, 1e15);
        assertApproxEqAbs(im[7], -4828 * 1e15, 1e15);
    }
}
