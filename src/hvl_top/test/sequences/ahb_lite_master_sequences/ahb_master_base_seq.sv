`ifndef AHB_MASTER_BASE_SEQ_INCLUDED_
`define AHB_MASTER_BASE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class : ahb_master_base_seq
// Creating ahb_master_base_seq extends from uvm_sequence
//--------------------------------------------------------------------------------------------
class ahb_master_base_seq extends uvm_sequence#(ahb_master_tx);
  `uvm_object_utils(ahb_master_base_seq)

  `uvm_declare_p_sequencer(ahb_master_sequencer)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "ahb_master_base_seq");
  extern task body();

endclass : ahb_master_base_seq

//--------------------------------------------------------------------------------------------
// Constructor: new
//
// Parameters:
//  name - ahb_master_base_seq
//--------------------------------------------------------------------------------------------
function ahb_master_base_seq::new(string name = "ahb_master_base_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
//  Performs dynamic casting of p_sequencer and m_sequencer
//--------------------------------------------------------------------------------------------
task ahb_master_base_seq::body();

  // Dynamic casting of p_sequencer and m_sequencer
  if (!$cast(p_sequencer, m_sequencer)) begin
    `uvm_error(get_full_name(), "Virtual sequencer pointer cast failed")
  end

endtask : body

`endif
