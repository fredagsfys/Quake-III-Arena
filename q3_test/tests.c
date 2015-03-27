#include "app_config.h"
#include "fff.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void Cmd_Echo_f(void);

void test2(char* msg) {
	Cmd_AddCommand("echo2", Cmd_Echo_f);
	Cbuf_ExecuteText(2, msg);
};

void test(void) {

	appConfig config = { CONNECT_FAIL, &test2 };

	/*Sys_CreateConsole();
	Com_InitSmallZoneMemory();
	Cbuf_Init();
	Com_InitZoneMemory();
	Cmd_Init();
	Cbuf_AddText("echo hej");
	Cbuf_Execute();
	while (1) {}*/

	RunApplication(config, NULL, NULL, "", SW_SHOW);
}


int main(void) {

	int threadId;

	puts("Starting quake3...");

	HANDLE h = CreateThread(
		NULL,	// LPSECURITY_ATTRIBUTES lpsa,
		0,		// DWORD cbStack,
		(LPTHREAD_START_ROUTINE)test,	// LPTHREAD_START_ROUTINE lpStartAddr,
		0,			// LPVOID lpvThreadParm,
		0,			//   DWORD fdwCreate,
		&threadId);
	//WaitForSingleObject(h, INFINITE);

	puts("quake3 started!");

	char* line[1024];

	do {

		scanf("%s", line);
		
		if (strchr(line, 'run')) { // RUN TESTS

			puts("Running tests...");
			// DO SOMETHING

		}

	} while (!strchr(line, 'exit'));
}

int WINAPI WinMain2(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {



	//RunApplication(config, hInstance, NULL, "", SW_SHOW);


	//HANDLE* h2[1];
	//h2[0] = h;

	//MsgWaitForMultipleObjects(1, h2, 1, INFINITE, QS_ALLEVENTS);

	getchar();
}


