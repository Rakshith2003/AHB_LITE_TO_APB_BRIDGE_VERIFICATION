class ahb_master_seq_item extends uvm_sequence_item;

  rand bit [31:0] addr;
  rand bit [31:0] data;
  rand bit        write;
  rand bit [2:0]  size;
  rand bit [2:0]  burst;

       bit [31:0] rdata;
       bit        resp;

  `uvm_object_utils_begin(ahb_master_seq_item)
    `uvm_field_int(addr,  UVM_ALL_ON)
    `uvm_field_int(data,  UVM_ALL_ON)
    `uvm_field_int(write, UVM_ALL_ON)
    `uvm_field_int(size,  UVM_ALL_ON)
    `uvm_field_int(burst, UVM_ALL_ON)
    `uvm_field_int(rdata, UVM_ALL_ON)
    `uvm_field_int(resp,  UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "ahb_master_seq_item");
    super.new(name);
  endfunction

endclass
