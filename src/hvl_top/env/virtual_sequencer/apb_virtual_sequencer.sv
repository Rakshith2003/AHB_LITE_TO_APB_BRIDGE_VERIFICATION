`ifndef VIRTUAL_SEQUENCER_INCLUDED_
`define VIRTUAL_SEQUENCER_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: ahb2apb_virtual_sequencer
//  Creates master and slave sequences here
//--------------------------------------------------------------------------------------------
class ahb2apb_virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(ahb2apb_virtual_sequencer)

  //Variable: master_seqr_h
  //Declaring master sequencer handle
  ahb_master_sequencer ahb_master_seqr_h;

  //Variable: slave_seqr_h
  //Declaring slave sequencer handle
  apb_slave_sequencer apb_slave_seqr_h[];

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "ahb2apb_virtual_sequencer", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);

endclass : ahb2apb_virtual_sequencer

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - ahb2apb_virtual_sequencer
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function ahb2apb_virtual_sequencer::new(string name = "ahb2apb_virtual_sequencer",uvm_component parent = null);
  super.new(name, parent);
  ahb2apb_slave_seqr_h = new[NO_OF_SLAVES];
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// Builds the master and slave sequencers here.
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_virtual_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

`endif

