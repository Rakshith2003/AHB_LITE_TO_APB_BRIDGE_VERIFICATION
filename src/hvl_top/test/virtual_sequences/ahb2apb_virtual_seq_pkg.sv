`ifndef AHB2APB_VIRTUAL_SEQ_PKG_INCLUDED_
`define AHB2APB_VIRTUAL_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : ahb2apb_virtual_seq_pkg
// Includes all the virtual sequence files declared
//--------------------------------------------------------------------------------------------
package ahb2apb_virtual_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg
  //-------------------------------------------------------
   `include "uvm_macros.svh"
  import uvm_pkg::*;
  import ahb2apb_global_pkg::*;
  import ahb2apb_env_pkg::*;
  import ahb_master_pkg::*;
  import apb_slave_pkg::*;
  import ahb_master_seq_pkg::*;
  import apb_slave_seq_pkg::*;

  //-------------------------------------------------------
  // Including required AHB virtual sequence files
  //-------------------------------------------------------
  `include "ahb2apb_virtual_base_seq.sv"
  `include "ahb2apb_virtual_8b_write_seq.sv"

endpackage : ahb2apb_virtual_seq_pkg

`endif
