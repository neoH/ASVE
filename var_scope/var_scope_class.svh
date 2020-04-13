// ******************************************************************************************
// File         : var_scope_class.svh
// Author       : RyanHunter
// Creating Date: Mon Apr 13 09:10:44 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef var_scope_class__svh
`define var_scope_class__svh

class for_var_scope_class; // {
	function new(); // {
	endfunction // }

endclass // }


class var_scope_class; // {

	for_var_scope_class fcq[$];

	function new (string name = "var_scope_class");
	endfunction

	function void for_test_00(); // {
		for_var_scope_class fc = new();
		$display("handle of fc: %0d",fc);
		fcq.push_back(fc);
	endfunction // }


	function void test_00(); // {
		for_test_00();
		$display("size of fcq: %0d",fcq.size());
		$display("handle of fcq: %0d",fcq[0]);
	endfunction // }


endclass // }


`endif
