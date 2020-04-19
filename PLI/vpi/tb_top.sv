// ******************************************************************************************
// File         : tb_top.sv
// Author       : RyanHunter
// Creating Date: Tue Apr  7 09:05:59 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef tb_top__sv
`define tb_top__sv


module tb_top; // {

	logic tb_clk,tb_rstn;

	initial begin // {
		tb_clk = 1'b0;
		forever #5ns tb_clk <= ~tb_clk;
	end // }

	initial begin // {
		tb_rstn = 1'b0;
		#100ns;
		tb_rstn = 1'b1;
		#100us;
		$finish;
	end // }

	initial begin // {
		$shm_open("test.shm");
		$shm_probe(tb_top,"AC");
	end // }



	ifc #(64) mif(tb_clk,tb_rstn);

	master mst(mif.master);
	slave  slv(mif.slave);


	initial begin // {
		$myvpi(1,2,3,4);
	end // }


endmodule // }

`endif
