`ifndef AHB2APB_8B_WRITE_TEST_INCLUDED_
`define AHB2APB_8B_WRITE_TEST_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: ahb2apb_8b_write_test
// Extends the base test and starts the virtual sequence of 8 bit
//--------------------------------------------------------------------------------------------
class ahb2apb_8b_write_test extends ahb2apb_base_test;
  `uvm_component_utils(ahb2apb_8b_write_test)
  
  ahb2apb_virtual_8b_write_seq ahb2apb_virtual_8b_seq_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "ahb2apb_8b_write_test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : ahb2apb_8b_write_test

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - ahb2apb_8b_write_test
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function ahb2apb_8b_write_test::new(string name = "ahb2apb_8b_write_test", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: run_phase
//  Creates the ahb2apb_virtual_8b_seq sequnce and starts the 8b virtual sequences
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task ahb2apb_8b_write_test::run_phase(uvm_phase phase);
  
  ahb2apb_virtual_8b_seq_h = ahb2apb_virtual_8b_write_seq::type_id::create("ahb2apb_virtual_8b_seq_h");
  `uvm_info(get_type_name(),$sformatf("ahb2apb_8b_write_test"),UVM_LOW);
  phase.raise_objection(this);
    ahb2apb_virtual_8b_seq_h.start(ahb2apb_env_h.ahb2apb_virtual_seqr_h);
  phase.drop_objection(this);

endtask : run_phase

`endif

