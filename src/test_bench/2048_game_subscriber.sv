class subscriber extends uvm_component;
  
  `uvm_component_utils(subscriber)
  
  covergroup cg;
    
    cp_hard_reset:coverpoint Rst_n(
      bins low  = {0};
      bins high = {1};
    );
    
    cp_soft_reset:coverpoint Ui_in[4](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_direction_up:coverpoint Ui_in[0](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_direction_down:coverpoint Ui_in[1](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_direction_left:coverpoint Ui_in[2](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_direction_right:coverpoint Ui_in[3](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_unused_inputs:coverpoint Ui_in[5:7](
      bins low  = {3'b000};
      bins high = {[3'b001:3'b111]};
    );
    
    cp_unused_io:coverpoint Uio_in[0:7](
      bins low  = {8'h00};
      bins high = {[8'h01:8'hff]};
    );
    
    cp_tile_value:coverpoint {Uo_out[4:6],Uo_out[0:2]}(
      bins low  = {0};
      bins high = {1};
    );
    
    cp_hsync_value:coverpoint Uo_out[7](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_vsync_value:coverpoint Uo_out[3](
      bins low  = {0};
      bins high = {1};
    );
    
    cp_direction_soft_reset:cross cp_soft_reset,cp_direction_up,cp_direction_down,cp_direction_left,cp_direction_right(
      bins low  = {0};
      bins high = {1};
    );
    
  endgroup
  
  function new(string name = "subscriber",uvm_component parent);
    super.new(name,parent);
    cg=new();
    cg.sample();
  endfunction
  
endclass
