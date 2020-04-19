// ******************************************************************************************
// File         : master.sv
// Author       : RyanHunter
// Creating Date: Sat Apr 18 10:12:11 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef master__sv
`define master__sv


// HIGHLIGHT, when we want use a modport of a parameterized interface, we can declare just interface
// keyword in port list of a module declaration instead of declaring the
// interface_identifier.modport_name, thus can make use using parameterized interface when
// connecting with this module.
module master (interface IF); // {

	bit [3:0] qcount,pcount;

	// for request processor, use a request qcount
	always @(IF.mcb or negedge IF.RSTN) begin // {
		if (~IF.RSTN) begin // {
			qcount <= 'h0;
		// }
		end else begin // {
			if (qcount[0]) begin // {
				IF.mcb.QVALID <= 1'b1;
			// }
			end else begin // {
				IF.mcb.QVALID <= 1'b0;
			end // }

			// always given a qcount a random value
			qcount <= $urandom;
		end // }
	end // }



endmodule // }



`endif
