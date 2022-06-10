import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def counter_test(dut):
    """Test the counter design."""

    # Reset
    dut.rst.value = 1

    # Drive clock
    for cycle in range(10):
        dut.clk.value = 0
        await Timer(5, units="ns")
        # dut.clk.value = 1
        if cycle >= 3:
            dut.rst.value = 0
        dut.clk.value = 1
        dut._log.info("dout is %s", dut.dout.value)
        await Timer(5, units="ns")
