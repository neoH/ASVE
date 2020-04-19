// ******************************************************************************************
// File         : ifc.sv
// Author       : RyanHunter
// Creating Date: Sat Apr 18 10:02:53 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ifc__sv
`define ifc__sv

`timescale 1ns/1ps

interface ifc #(PW = 32) (input logic CLK, input logic RSTN); // {

	logic [PW-1:0] PA; // physical address

	// simple handshake signals 
	logic QVALID,QREADY;

	logic PVALID,PREADY;

	event req_e,rsp_e;


	always @(posedge CLK or negedge RSTN) begin // {
		if (~RSTN) begin // {
			event qe,pe; 
			req_e = null; rsp_e = null; // destroy old event queues
			req_e = qe; rsp_e = pe; // assign new event to req_e,rsp_e
		// }
		end else begin // {
			if ((QVALID) === 1'b1) begin // {
				event qe;
				->req_e; // triggering req event
				req_e = null; // clear
				req_e = qe;
			end // }

			if ((PVALID) === 1'b1) begin // {
				event pe;
				->rsp_e; // triggering rsp event
				rsp_e = null;
				rsp_e = pe;
			end // }

		end // }
	end // }


	clocking mcb @(posedge CLK); // {
		default output #1;
		output PREADY,QVALID;
	endclocking // }

	clocking scb @(posedge CLK); // {
		default output #1step;
		output QREADY,PVALID;
	endclocking // }


	modport master (
		clocking mcb,
		input QREADY, PVALID, RSTN,
		output QVALID, PREADY
	);

	modport slave  (
		clocking scb,
		output QREADY, PVALID,
		input QVALID, PREADY, RSTN
	);


endinterface // }



`endif
