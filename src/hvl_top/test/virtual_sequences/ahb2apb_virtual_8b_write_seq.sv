`ifndef APB2APB_VIRTUAL_8B_WRITE_SEQ_INCLUDED_
`define APB2APB_VIRTUAL_8B_WRITE_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class:ahb2 apb_virtual_8b_write_seq
//--------------------------------------------------------------------------------------------
class ahb2apb_virtual_8b_write_seq extends ahb2apb_virtual_base_seq;
  `uvm_object_utils(ahb2apb_virtual_8b_write_seq)

  ahb_master_8b_write_seq ahb_master_8b_write_seq_h;

  apb_slave_8b_write_seq apb_slave_8b_write_seq_h;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------

  extern function new(string name ="apb_virtual_8b_write_seq");
  extern task body();

endclass : ahb2apb_virtual_8b_write_seq


function ahb2apb_virtual_8b_write_seq::new(string name ="ahb2apb_virtual_8b_write_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task - body
// Creates and starts the 8bit data of master and slave sequences
//--------------------------------------------------------------------------------------------
task ahb2apb_virtual_8b_write_seq::body();
  super.body();
  ahb_master_8b_write_seq_h=ahb_master_8b_write_seq::type_id::create("ahb_master_8b_write_seq_h");
  apb_slave_8b_write_seq_h=apb_slave_8b_write_seq::type_id::create("apb_slave_8b_write_seq_h");
  
  fork
  begin
    forever begin
      if(!apb_slave_8b_write_seq_h.randomize() with {choose_packet_data_seq == 1; 
                                                                    }) begin
             `uvm_error(get_type_name(), "Randomization failed : Inside apb_virtual_8b_write_seq")
          end
      apb_slave_8b_write_seq_h.start(p_sequencer.apb_slave_seqr_h[0]);
    end
  end
join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(1) begin
          if(!ahb_master_8b_write_seq_h.randomize() with {address_seq == 32'h990;
                                                                    }) begin
            `uvm_error(get_type_name(), "Randomization failed : Inside apb_virtual_8b_write_seq.sv")
        end
        ahb_master_8b_write_seq_h.start(p_sequencer.ahb_master_seqr_h);
      end
    end

  join

 endtask : body

`endif
