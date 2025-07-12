assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.a == tate_pairing.xp && tate_pairing.b == tate_pairing.yp && tate_pairing.t == 0);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.start |-> tate_pairing.cycle_counter == 0);
assert property (@(posedge duursma_lee_algo.clk) duursma_lee_algo.reset |-> duursma_lee_algo.done);
assert property (@(posedge f36m.clk) disable iff (!f36m.reset) f36m.done |=> $stable(f36m.done) or f36m.reset);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.done == 2);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset)tate_pairing.K != (tate_pairing.K >> 1));
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.a == tate_pairing.v3 && tate_pairing.b != tate_pairing.v4);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset)$bits(tate_pairing.x1) != 194);
assert property (@(posedge duursma_lee_algo.clk) disable iff (!duursma_lee_algo.reset)duursma_lee_algo.b !== 'x && duursma_lee_algo.a !== 'z);
assert property (@(posedge duursma_lee_algo.clk) disable iff (!duursma_lee_algo.reset)duursma_lee_algo.a == 'x);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.y2 != tate_pairing.x1 && tate_pairing.y2 != tate_pairing.y1 && tate_pairing.y2 == tate_pairing.x2);
assert property (@(posedge duursma_lee_algo.clk) disable iff (!duursma_lee_algo.reset) $stable(duursma_lee_algo.yr) |-> duursma_lee_algo.done);
assert property (@(posedge duursma_lee_algo.clk) $rose(duursma_lee_algo.done) |-> duursma_lee_algo.out);
assert property (@(posedge duursma_lee_algo.clk) disable iff (!duursma_lee_algo.reset) duursma_lee_algo.yr != tate_pairing.y1);
assert property (@(posedge tate_pairing.clk) tate_pairing.reset |-> $stable(tate_pairing.x1) throughout (!tate_pairing.done));
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) tate_pairing.reset |=> !tate_pairing.done);
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) ##1 !$stable(tate_pairing.done) or !$stable(tate_pairing.out));
assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) ($changed(tate_pairing.x1) || $changed(tate_pairing.x2) || $changed(tate_pairing.y2) || $changed(tate_pairing.y1)) |->($changed(tate_pairing.x1) && $changed(tate_pairing.x2) && $changed(tate_pairing.y2) && $changed(tate_pairing.y1)));
genvar i;
generate
    for(i=0; i<97 ; i=i+1) begin: assertion_instance
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins2.ins1.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins2.ins1.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins2.ins1.C[(2*i+1) : 2*i];

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

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset)(c_slice != expected_c));
        end
    end
endgenerate


generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins2.ins2.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins2.ins2.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins2.ins2.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[1];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b0) |
                (~a0 & ~a1 & ~b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};
            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice == expected_c));
        end
    end
endgenerate

generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins2.ins3.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins2.ins3.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins2.ins3.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
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
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins3.ins1.A[(2*i) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins3.ins1.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins3.ins1.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[1];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset)(c_slice == expected_c));
        end
    end
endgenerate


generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin

            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins3.ins2.A[(2*i+1) : i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins3.ins2.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins3.ins2.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & b0 &  b1) ;
            automatic  logic [1:0] expected_c = {c1, c0};

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice == expected_c));
        end
    end
endgenerate

generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins3.ins3.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins3.ins3.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins3.ins3.C[(2*i+1) : 2*i];

            automatic  logic a1= a_slice[1];
            automatic  logic a0= a_slice[0];

            automatic  logic b1= b_slice[1];
            automatic  logic b0= b_slice[0];

            automatic  logic c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
            automatic  logic c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b0) ;
            automatic  logic [1:0] expected_c = {c0, c1};

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (!c_slice == expected_c));
        end
    end
endgenerate


generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins6.ins11.ins5.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins6.ins11.ins5.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins6.ins11.ins5.C[(2*i+1) : 2*i];

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

            ap_check: assert property (@(posedge tate_pairing.clk) (c_slice == $stable(expected_c));
        end
    end
endgenerate

generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins6.ins11.ins6.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins6.ins11.ins6.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins6.ins11.ins6.C[(2*i+1) : 2*i];

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

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice ->##1 expected_c));
        end
    end
endgenerate

generate
    for(i=0; i<97 ; i=i+1) begin
        always_comb begin
            automatic  logic [1:0] a_slice = tate_pairing.ins2.ins6.ins11.ins7.A[(2*i+1) : 2*i];
            automatic  logic [1:0] b_slice = tate_pairing.ins2.ins6.ins11.ins7.B[(2*i+1) : 2*i];
            automatic  logic [1:0] c_slice = tate_pairing.ins2.ins6.ins11.ins7.C[(2*i+1) : 2*i];

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

            ap_check: assert property (@(posedge tate_pairing.clk) disable iff (!tate_pairing.reset) (c_slice == $rose(expected_c)));
        end
    end
endgenerate