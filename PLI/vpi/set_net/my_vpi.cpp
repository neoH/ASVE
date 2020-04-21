// ******************************************************************************************
// File         : my_vpi.cpp
// Author       : RyanHunter
// Creating Date: Tue Apr 21 20:13:10 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


#ifndef my_vpi__cpp
#define my_vpi__cpp

#include "vpi_user.h"
#include "vpi_user_cds.h" // for cadence eda


int set_net();


int set_net()
{
	vpiHandle task,argI,argH;
	vpiHandle net;
	s_vpi_value val;

	task = vpi_handle(vpiSysTfCall,NULL);

	argI = vpi_iterate(vpiArgument,task);

	argH = vpi_scan(argI);

	net = vpi_find_by_name("tb_top.vpi_net",NULL);

	if (net == NULL)
	{
		vpi_printf("ERROR: no vpi net found\n");
		return 1;
	}

	vpi_get_value(argH,&val);

	s_vpi_time s_time;

	s_time.format = vpiNoDelay;
	s_time.High = 0;
	s_time.Low  = 0;

	vpi_put_value(net,&val,&s_time,vpiNoDelay);


	return 0;
}




s_vpi_systf_data sysTfList[] = {
	{vpiSysTask,0,"$set_net",set_net,0,0,0},
	{0}
};

void set_vpi()
{
	vpi_register_tf(&sysTfList[0]);
	return;
}


void (*vlog_startup_routines[MAX_SYSTFS])() = 
{
	set_vpi,
	0
};


#endif
