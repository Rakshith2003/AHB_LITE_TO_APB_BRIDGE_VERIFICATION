interface ahb_master_interface(input logic HCLK);

  logic        HRESETn;

  logic        HSEL;
  logic [31:0] HADDR;
  logic [1:0]  HTRANS;
  logic        HWRITE;
  logic [2:0]  HSIZE;
  logic [2:0]  HBURST;
  logic [31:0] HWDATA;

  logic        HREADY;
  logic        HREADYOUT;
  logic [31:0] HRDATA;
  logic        HRESP;

  // Clocking block for the master driver
  clocking driver_cb @(negedge HCLK);
    output HSEL;
    output HADDR;
    output HTRANS;
    output HWRITE;
    output HSIZE;
    output HBURST;
    output HWDATA;

    input  HREADY;
    input  HREADYOUT;
    input  HRDATA;
    input  HRESP;
    input  HRESETn;
  endclocking

  // Clocking block for the monitor
  clocking monitor_cb @(posedge HCLK);
    input HRESETn;
    input HSEL;
    input HADDR;
    input HTRANS;
    input HWRITE;
    input HSIZE;
    input HBURST;
    input HWDATA;
    input HREADY;
    input HREADYOUT;
    input HRDATA;
    input HRESP;
  endclocking

endinterface
