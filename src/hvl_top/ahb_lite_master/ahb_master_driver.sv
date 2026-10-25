class ahb_master_driver extends uvm_driver #(ahb_master_seq_item);

  `uvm_component_utils(ahb_master_driver)

  virtual ahb_master_interface vif;

  function new(string name = "ahb_master_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual ahb_master_interface)::get(this, "", "vif", vif))
      `uvm_fatal("AHB_DRV", "Virtual interface not set")
  endfunction

  task run_phase(uvm_phase phase);
 

    forever begin
      seq_item_port.get_next_item(req);

      // : Drive AHB address and control phase
      //  Drive HWDATA in the following data phase
      //  Wait for HREADY/HREADYOUT as appropriate
      //  Capture HRDATA and HRESP for reads/responses

      drive_transfer();

      seq_item_port.item_done();
    end
  endtask

  virtual task drive_transfer();

    // TODO: Implement AHB-Lite transfer timing

  endtask

endclass
