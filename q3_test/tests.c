#include "app_config.h"
#include "fff.h"
#include "unity.h"


int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);

void test(void) {

	/*Sys_CreateConsole();
	Com_InitSmallZoneMemory();
	Cbuf_Init();
	Com_InitZoneMemory();
	Cmd_Init();
	Cbuf_AddText("echo hej");
	Cbuf_Execute();
	while (1) {}*/
}

int WINAPI WinMain2(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
	appConfig config = { CONNECT_FAIL };

	int threadId;

	/*HANDLE h = CreateThread(
		NULL,	// LPSECURITY_ATTRIBUTES lpsa,
		0,		// DWORD cbStack,
		(LPTHREAD_START_ROUTINE)test,	// LPTHREAD_START_ROUTINE lpStartAddr,
		0,			// LPVOID lpvThreadParm,
		0,			//   DWORD fdwCreate,
		&threadId);*/

	RunApplication(config, hInstance, NULL, "", SW_SHOW);

	//WaitForSingleObject(h, INFINITE);
	//HANDLE* h2[1];
	//h2[0] = h;

	//MsgWaitForMultipleObjects(1, h2, 1, INFINITE, QS_ALLEVENTS);


}


