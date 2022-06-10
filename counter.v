`timescale 1 ns / 1 ps
//
`default_nettype none

module counter #(
    parameter integer COUNTER_WIDTH = 8
) (
    input  wire                     clk,
    input  wire                     rst,
    output reg  [COUNTER_WIDTH-1:0] dout
);

`ifdef COCOTB_SIM
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter);
  end
`endif

  always @(posedge clk) begin
    if (rst) begin
      dout <= 'd0;
    end else begin
      dout <= dout + 1;
    end
  end

endmodule

`default_nettype wire
