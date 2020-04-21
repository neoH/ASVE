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

	int vpi_net = 200;

	initial begin // {
		$display("before calling vpi, the vpi_net is: %0d",vpi_net);
		$set_net($urandom);
		$display("after calling vpi, the vpi_net is: %0d",vpi_net);
	end // }


	initial begin // {
		$shm_open("test.shm");
		$shm_probe(tb_top,"AC");
	end // }


endmodule // }

`endif
