assert property (@(posedge keccak.clk) disable iff(keccak.reset)!keccak.padder_.in_ready & keccak.padder_.buffer_full |-> keccak.padder_.out == $past(keccak.padder_.out));
assert property (@(posedge keccak.clk) disable iff(keccak.reset) keccak.padder_.out_ready == 1'b1 |-> ##1 keccak.padder_.buffer_full == 1'b1);
assert property (@(posedge keccak.clk)$bits(keccak.in) == 65);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.is_last == 1'b1 & keccak.buffer_full == 1'b1 |-> keccak.buffer_full == 1'b0);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.is_last == 1'b1 & keccak.out_ready == 1'b0 |-> ##[0:5] keccak.out_ready == 1'b1);
assert property (@(posedge keccak.clk)$bits(keccak.byte_num) != 3);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)(keccak.reset == 1'b1) |-> ##1 keccak.buffer_full == 1'b0);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.is_last == 1'b1 & keccak.buffer_full == 1'b1 |-> ##8 keccak.buffer_full == 1'b1);
assert property (@(posedge keccak.clk)(keccak.reset == 1'b1) |-> ##1 keccak.out == 1'b1);
assert property (@(posedge keccak.clk)(keccak.reset == 1'b1) |-> keccak.out_ready == 1'b0);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.out_ready == 1'b1 |-> $stable(keccak.out));
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.p0.byte_num == 1 |-> keccak.padder_.p0.out == 64'h0100000000000000);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.p0.byte_num == 1 |-> keccak.padder_.p0.out == {keccak.padder_.p0.in[63:56], 56'h01000000000001});
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.p0.byte_num == 4 |-> keccak.padder_.p0.out == {keccak.padder_.p0.in[63:40], 40'h0100000000});
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.p0.byte_num == 7 |-> keccak.padder_.p0.out == {keccak.padder_.p0.in[63:8],  8'h00});
assert property (@(posedge keccak.clk) disable iff(keccak.reset)$changed(keccak.f_permutation_.rconst_.i) |-> keccak.f_permutation_.rconst_.rc1[0] == keccak.f_permutation_.rconst_.i[0] | keccak.f_permutation_.rconst_.i[2] | keccak.f_permutation_.rconst_.i[3] | keccak.f_permutation_.rconst_.i[5] | keccak.f_permutation_.rconst_.i[6] | keccak.f_permutation_.rconst_.i[7] | keccak.f_permutation_.rconst_.i[9] | keccak.f_permutation_.rconst_.i[11]);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)$changed(keccak.f_permutation_.rconst_.i) |-> keccak.f_permutation_.rconst_.rc1[0] == keccak.f_permutation_.rconst_.i[0] | keccak.f_permutation_.rconst_.i[2] | keccak.f_permutation_.rconst_.i[3] | keccak.f_permutation_.rconst_.i[5] | keccak.f_permutation_.rconst_.i[6] | keccak.f_permutation_.rconst_.i[7] | keccak.f_permutation_.rconst_.i[10] && keccak.f_permutation_.rconst_.i[11]);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)$changed(keccak.f_permutation_.rconst_.i) |->keccak.f_permutation_.rconst_.rc2[0] == keccak.f_permutation_.rconst_.i[3] | keccak.f_permutation_.rconst_.i[3] | keccak.f_permutation_.rconst_.i[6] | keccak.f_permutation_.rconst_.i[7]);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.buffer_full != keccak.padder_.out_ready);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)!keccak.padder_.in_ready & keccak.padder_.buffer_full |->##1 keccak.padder_.out != keccak.padder_.out);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.padder_.f_ack == 1'b1 |-> ##1 keccak.padder_.buffer_full == 1'b1);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)keccak.f_permutation_.ack |-> keccak.f_permutation_.in_ready == 1'b0);
assert property (@(posedge keccak.clk) disable iff(keccak.reset)(keccak.f_permutation_.out_ready & keccak.f_permutation_.in_ready) |=> keccak.f_permutation_.out_ready);
assert property (@(posedge keccak.clk) disable iff (keccak.reset)(keccak.in_ready && !keccak.buffer_full) ##[1:$] (keccak.buffer_full));
assert property (@(posedge keccak.clk) disable iff (keccak.reset) (!keccak.out_ready && $rose(keccak.out_ready)) |=> !$isunknown(keccak.out) && !$isunknown(keccak.out_ready));
assert property (@(posedge keccak.clk) $rose(keccak.reset) ##1 !keccak.out_ready ##[1:$] keccak.out_ready |-> !($stable(keccak.out)));
assert property (@(posedge keccak.clk) keccak.reset |-> !keccak.in_ready);
assert property (@(posedge keccak.clk) keccak.reset ##1 keccak.in_ready |-> !$isunknown(keccak.in_ready));  
assert property (@(posedge keccak.clk) $rose(keccak.reset) |=> !keccak.out_ready);
assert property (@(posedge keccak.clk) $rose(keccak.reset) |-> !keccak.out_ready[*3]); 


endmodule   

bind keccak keccak_sva keccak_sva_inst();

`endif