// ******************************************************************************************
// File         : vpihead.cpp
// Author       : RyanHunter
// Creating Date: Sun Apr 19 07:28:45 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef vpihead__cpp
#define vpihead__cpp

#include <stdio.h>

#include "vpi_user.h"
#include "vpi_user_cds.h"

int myvpi();

int myvpi()
{
	int argcont = 0;
	vpiHandle task, argI, argH;
	task = vpi_handle(vpiSysTfCall,NULL);
	argI = vpi_iterate(vpiArgument,task);
	while (argH = vpi_scan(argI))
	{
		argcont++;
	}
	vpi_printf("argument number by this calling: %d\n",argcont);
	return 0;
}


static s_vpi_systf_data callback_data[] = {
	{vpiSysTask,0,"$myvpi",myvpi,0,0,0},
	{0}
};


void setup_vpi_callback()
{
	vpi_register_systf(&callback_data[0]);
	return;
}



void (*vlog_startup_routines[MAX_SYSTFS])() =
{
	setup_vpi_callback,
	0
};

#endif
