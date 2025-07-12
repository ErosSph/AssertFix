assert property (@(posedge point_add.clk) !point_add.reset&(point_add.x1==point_add.x2) |=> point_add.cond2==0);
assert property (@(posedge f3m_add.clk) ( f3_add.a0 & ~f3_add.a1) |(~f3_add.a0 & ~f3_add.a1 &  f3_add.b0 & ~f3_add.b1) |(~f3_add.a0 &  f3_add.a1 & ~f3_add.b0 &  f3_add.b1)==0 |=> f3_add.c0==1);
assert property (@(posedge point_add.clk) !point_add.reset&(point_add.y1==point_add.y2) |-> point_add.cond3==1);
assert property (@(posedge point_add.clk) !point_add.reset&(point_add.x1==point_add.x2) |=> point_add.cond2==0);
assert property (@(posedge func9.clk) (func9.x2[0] & func9.zero1)|-> !func9.x3);
assert property (@(posedge point_add.clk) (point_add.y1==point_add.y2) |->##1 point_add.cond3==1);
assert property (@(posedge func9.clk) func9.zero1|->func9.zero3);
assert property (@(posedge point_add.clk) !point_add.reset&(point_add.zero1 | point_add.zero2) |=> !point_add.use1);
assert property (@(posedge point_add.clk) (point_add.use1 | point_add.cond1)|=> point_add.done==1);
assert property (@(posedge point_add.clk) !point_add.reset&point_add.use1&point_add.x3a |-> !point_add.x3);
assert property (@(posedge point_add.clk) point_add.reset |-> point_add.y3==0);
assert property (@(posedge point_add.clk) point_add.use1==0&point_add.cond5&point_add.y3b |=> !point_add.x3);
assert property (@(posedge point_add.clk) point_add.use1==0 |=> point_add.x3==0);
assert property (@(posedge point_add.clk) ((point_add.use1 & point_add.zero3a) | point_add.cond1) |=> point_add.zero3);
genvar i;
generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = point_add.ins10.ins4.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = point_add.ins10.ins4.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = point_add.ins10.ins4.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice != expected_c));
        end
    end
endgenerate


generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin

            automatic  logic [1:0] a_slice = point_add.ins11.ins7.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = point_add.ins11.ins7.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = point_add.ins11.ins7.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[0];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};


            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice == !expected_c));
        end
    end
endgenerate


generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin

            automatic  logic [1:0] a_slice = point_add.ins11.ins8.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = point_add.ins11.ins8.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = point_add.ins11.ins8.C[(2*i) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};


            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice == expected_c));
        end
    end
endgenerate

generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin

            automatic  logic [1:0] a_slice = point_add.ins10.ins5.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = point_add.ins10.ins5.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = point_add.ins10.ins5.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[1];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[1];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};


            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (!c_slice == expected_c));
        end
    end
endgenerate
endmodule

