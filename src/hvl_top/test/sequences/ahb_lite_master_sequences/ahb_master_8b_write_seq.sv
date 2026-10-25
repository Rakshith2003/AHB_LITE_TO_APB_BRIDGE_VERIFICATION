`ifndef AHB_MASTER_8B_WRITE_SEQ_INCLUDE_
`define AHB_MASTER_8B_WRITE_SEQ_INCLUDE_

//--------------------------------------------------------------------------------------------
// Class: ahb_master_8b_write_seq
// Extends the ahb_master_base_seq and randomizes the request item
//--------------------------------------------------------------------------------------------
class ahb_master_8b_write_seq extends ahb_master_base_seq;
  `uvm_object_utils(ahb_master_8b_write_seq)

  // Variable: address
  // Used to store the address to pass to the write and read sequence
  rand bit [ADDRESS_WIDTH-1:0] address_seq;

  // Variable: cont_write_read
  // Used to count the writes and reads
  rand bit cont_write_read_seq;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "ahb_master_8b_write_seq");
  extern task body();

endclass : ahb_master_8b_write_seq

//--------------------------------------------------------------------------------------------
// Constructor: new
//
// Parameters:
//  name - ahb_master_8b_write_seq
//--------------------------------------------------------------------------------------------
function ahb_master_8b_write_seq::new(string name = "ahb_master_8b_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: body
// Creates the request of type AHB master transaction and randomizes the request.
//--------------------------------------------------------------------------------------------
task ahb_master_8b_write_seq::body();
  super.body();

  req = ahb_master_tx::type_id::create("req");

  start_item(req);

  if (!req.randomize() with {
        haddr == address_seq;
        hsize == BIT_8;
        hwrite == WRITE;
      }) begin
    `uvm_fatal("AHB", "Randomization failed");
  end

  req.haddr = address_seq;
  req.print();

  finish_item(req);

endtask : body

`endif
