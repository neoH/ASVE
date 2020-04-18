// ******************************************************************************************
// File         : slave.sv
// Author       : RyanHunter
// Creating Date: Sat Apr 18 10:12:13 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef slave__sv
`define slave__sv


module slave (interface IF); // {

	process thread;

	task reset_detector(); // {
		wait (IF.RSTN === 1'b0);
		// drive all slave signal to X
		IF.scb.QREADY <= 1'bx;
		IF.scb.PVALID <= 1'bx;
		wait (IF.RSTN === 1'b1); // finish reset
		@IF.scb;
		IF.scb.QREADY <= 1'b0;
		IF.scb.PVALID <= 1'b0;
	endtask // }

	task main_processor(); // {
		forever begin // {
			int delay = $urandom_range(1,20);
			@IF.req_e; // wait for request start
			repeat (delay) @(IF.scb); // wait a random delay from 1~20 cycle
			IF.scb.QREADY <= 1'b1;
			@(IF.scb); // 1 cycle later
			IF.scb.QREADY <= 1'b0; // de-assert ready
			delay = $urandom_range(0,20); // random delay
			repeat (delay) @(IF.scb); // wait a random delay from 0~20 cycle
			IF.scb.PVALID <= 1'b1; // set PVALID
			@(IF.scb);
			IF.scb.PVALID <= 1'b0; // de-assert PVALID
		end // }
	endtask // }


	initial begin // {
		fork // {
			forever reset_detector();
			begin // {
				wait (IF.RSTN === 1'b1); // wait reset done
				thread = process::self();
				main_processor();
			end // }

		join // }

	end // }




endmodule // }



`endif
