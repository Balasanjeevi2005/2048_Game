class seq extends uvm_sequence#(transactions);
  
  `uvm_object_utils(seq)
  transactions req;
  
  function new(string name = "seq",);
    super.new(name);
  endfunction
  
  task body();
    req = transactions::type_id::create("req");
    start_item(req);
    req.randomize();
    finish_item(req);  
  endtask
  
endclass
