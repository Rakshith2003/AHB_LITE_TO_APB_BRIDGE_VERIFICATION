class ahb_master_monitor extends uvm_monitor;

  `uvm_component_utils(ahb_master_monitor)

  virtual ahb_master_interface vif;

  uvm_analysis_port #(ahb_master_seq_item) ....;


  function new(string name = "ahb_master_monitor",uvm_component parent = null);
    super.new(name, parent);
    ....= new("...", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual ahb_master_interface)::get(this, "", "vif", vif))
      `uvm_fatal("AHB_MON", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
    ahb_master_seq_item seq_item;

    forever begin

      //  Detect an accepted AHB address phase
      // HSEL && HREADY && valid HTRANS
      //  Capture address, direction, size and burst
      // Capture write data in the data phase
      //  Capture read data and response
      // : Publish completed transaction using .write(seq_item)
      //send every ahb bus transaction to scoreboard
    end
  endtask

endclass
