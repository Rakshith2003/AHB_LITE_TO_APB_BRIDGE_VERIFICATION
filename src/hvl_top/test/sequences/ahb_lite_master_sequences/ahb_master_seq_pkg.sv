`ifndef AHB_MASTER_SEQ_PKG_INCLUDED_
`define AHB_MASTER_SEQ_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package : ahb_master_seq_pkg
//  Includes all the master seq files declared
//--------------------------------------------------------------------------------------------
package ahb_master_seq_pkg;

  //-------------------------------------------------------
  // Importing UVM Pkg and including globall and master packages
  //-------------------------------------------------------
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import ahb_global_pkg::*;
  import ahb_master_pkg::*;

  //-------------------------------------------------------
  // Including required apb master seq files
  //-------------------------------------------------------
  `include "ahb_master_base_seq.sv"
  `include "ahb_master_8b_write_seq.sv"

endpackage : ahb_master_seq_pkg

`endif

