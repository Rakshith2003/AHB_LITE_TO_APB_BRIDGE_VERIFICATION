class ahb_master_agent extends uvm_agent;
  ahb_master_driver    ahb_drv;
  ahb_master_sequencer ahb_seqr;
  ahb_master_monitor   ahb_mon;
  
  `uvm_component_utils(ahb_master_agent)

  function new (string name = "ahb_master_agent", uvm_component parent);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
      ahb_drv = ahb_master_driver::type_id::create("ahb_drv", this);
      ahb_seqr = ahb_master_sequencer::type_id::create("ahb_seqr", this);
      ahb_mon = ahb_master_monitor::type_id::create("ahb_mon", this);
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
      ahb_drv.seq_item_port.connect(ahb_seqr.seq_item_export);
  endfunction:connect_phase

endclass:nco_active_agent
