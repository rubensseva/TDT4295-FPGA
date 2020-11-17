
module artix7_pll
(
    // Inputs
     input           clkref_i

    // Outputs
    ,output          clkout0_o
    ,output          clkout1_o
);





wire clkref_buffered_w;
wire clkfbout_w;
wire clkfbout_buffered_w;
wire pll_clkout0_w;
wire pll_clkout0_buffered_w;
wire pll_clkout1_w;
wire pll_clkout1_buffered_w;

// Input buffering
IBUF IBUF_IN
(
    .I (clkref_i),
    .O (clkref_buffered_w)
);

// Clocking primitive
PLLE2_BASE
#(
    .BANDWIDTH("OPTIMIZED"),      // OPTIMIZED, HIGH, LOW
    .CLKFBOUT_PHASE(0.0),         // Phase offset in degrees of CLKFB, (-360-360)
    .CLKIN1_PERIOD(40.0),         // Input clock period in ns resolution
    .CLKFBOUT_MULT(40),     // VCO=1000MHz

    // CLKOUTx_DIVIDE: Divide amount for each CLKOUT(1-128)
    .CLKOUT0_DIVIDE(20), // CLK0=50MHz
    .CLKOUT1_DIVIDE(4), // CLK1=250MHz

    // CLKOUTx_DUTY_CYCLE: Duty cycle for each CLKOUT
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT3_DUTY_CYCLE(0.5),

    // CLKOUTx_PHASE: Phase offset for each CLKOUT
    .CLKOUT0_PHASE(0.0),
    .CLKOUT1_PHASE(0.0),
    .CLKOUT2_PHASE(0.0),
    .CLKOUT3_PHASE(0.0),

    .DIVCLK_DIVIDE(1),            // Master division value (1-56)
    .REF_JITTER1(0.0),            // Ref. input jitter in UI (0.000-0.999)
    .STARTUP_WAIT("TRUE")         // Delay DONE until PLL Locks ("TRUE"/"FALSE")
)
u_pll
(
    .CLKFBOUT(clkfbout_w),
    .CLKOUT0(pll_clkout0_w),
    .CLKOUT1(pll_clkout1_w),
    .CLKOUT2(),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(),
    .PWRDWN(1'b0),
    .RST(1'b0),
    .CLKIN1(clkref_buffered_w),
    .CLKFBIN(clkfbout_buffered_w)
);

BUFH u_clkfb_buf
(
    .I(clkfbout_w),
    .O(clkfbout_buffered_w)
);

//-----------------------------------------------------------------
// CLK_OUT0
//-----------------------------------------------------------------
BUFG u_clkout0_buf
(
    .I(pll_clkout0_w),
    .O(pll_clkout0_buffered_w)
);

assign clkout0_o = pll_clkout0_buffered_w;


//-----------------------------------------------------------------
// CLK_OUT1
//-----------------------------------------------------------------
BUFG u_clkout1_buf
(
    .I(pll_clkout1_w),
    .O(pll_clkout1_buffered_w)
);

assign clkout1_o = pll_clkout1_buffered_w;






endmodule
