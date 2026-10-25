`ifndef AHB2APB_VIRTUAL_BASE_SEQ_INCLUDED_
`define AHB2APB_VIRTUAL_BASE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: ahb_virtual_base_seq
// Holds handles to the actual master and slave sequencers.
//--------------------------------------------------------------------------------------------
class ahb2apb_virtual_base_seq extends uvm_sequence;
  `uvm_object_utils(ahb2apb_virtual_base_seq)

  // Declaring p_sequencer
  `uvm_declare_p_sequencer(ahb_virtual_sequencer)

  // Handle to the AHB master sequencer
  ahb_master_sequencer ahb_master_seqr_h;

  // Handles to the AHB slave sequencers
  apb_slave_sequencer apb_slave_seqr_h[];

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "ahb2apb_virtual_base_seq");
  extern task body();

endclass : ahb2apb_virtual_base_seq

//--------------------------------------------------------------------------------------------
// Constructor: new
//
// Parameters:
//  name - ahb_virtual_base_seq
//--------------------------------------------------------------------------------------------
function ahb_virtual_base_seq::new(string name = "ahb2apb_virtual_base_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Connects the virtual sequence to the actual master and slave sequencers.
//--------------------------------------------------------------------------------------------
task ahb2apb_virtual_base_seq::body();

  apb_slave_seqr_h = new[NO_OF_SLAVES];

  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

  foreach (apb_slave_seqr_h[i]) begin
    apb_slave_seqr_h[i] = p_sequencer.apb_slave_seqr_h[i];
  end

  ahb_master_seqr_h = p_sequencer.ahb_master_seqr_h;

endtask : body

`endif
