`ifndef AHB2APB_ENV_PKG_INCLUDED_
`define AHB2APB_ENV_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: ahb2apb_env_pkg
// Includes all the files related to apb env
//--------------------------------------------------------------------------------------------
package ahb2apb_env_pkg;
  
  //-------------------------------------------------------
  // Importing uvm packages
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //-------------------------------------------------------
  // Importing the required packages
  //-------------------------------------------------------
  import ahb2apb_global_pkg::*;
  import ahb_master_pkg::*;
  import apb_slave_pkg::*;

  //-------------------------------------------------------
  // Including the required files
  //-------------------------------------------------------
  `include "ahb2apb_env_config.sv"
  `include "ahb2apb_virtual_sequencer.sv"
  `include "ahb2apb_scoreboard.sv"
  `include "ahb2apb_env.sv"

endpackage : ahb2apb_env_pkg

`endif

