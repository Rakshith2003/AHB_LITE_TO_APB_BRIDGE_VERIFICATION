`ifndef AHB2APB_TEST_PKG_INCLUDED_
`define AHB2APB_TEST_PKG_INCLUDED_

//-----------------------------------------------------------------------------------------
// Package: ahb2apb base_test
//  Includes all the files written to run the simulation
//--------------------------------------------------------------------------------------------
package ahb2apb_test_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import ahb2apb_global_pkg::*;
  import ahb2apb_master_pkg::*;
  import apb_slave_pkg::*;
  import ahb2apb_env_pkg::*;
  import ahb_master_seq_pkg::*;
  import apb_slave_seq_pkg::*;
  import ahb2apb_virtual_seq_pkg::*;
  
  //-------------------------------------------------------
  // Including the base_test files
  //-------------------------------------------------------
  `include "ahb2apb_base_test.sv"
  `include "ahb2apb_8b_write_test.sv"

endpackage : ahb2apb_test_pkg

`endif

