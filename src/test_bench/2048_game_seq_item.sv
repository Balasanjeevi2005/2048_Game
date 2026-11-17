class transactions extends uvm_sequence_item#(transactions);
  
  rand bit Rst_n;
  rand logic ena;
  rand logic[7:0]Ui_in,Uio_in;;
  logic[7:0]Uo_out,Uio_out,Uio_oe;
  
  `uvm_component_utils(transactions)
  
  function new(string name = "transactions",uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
