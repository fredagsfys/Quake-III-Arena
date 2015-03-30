#include <Windows.h>
#include "app_config.h"
#include "fff.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void CL_Init(void);
int checkIfCommandExists(char* command);
int Sys_MilliSeconds(void);

void serverFunc(appConfig config) {

	puts("quake3 server started!");
	puts("");

	int start = Sys_MilliSeconds();
	fputs("Initializing client side...", stdout);
	CL_Init();
	printf("Done in %d ms", (Sys_MilliSeconds() - start));
	puts("");

	start = Sys_MilliSeconds();
	fputs("Connecting client to server...", stdout);
	Cbuf_ExecuteText(1, config.execString);
	printf("Done in %d ms", (Sys_MilliSeconds() - start));
	puts("");

	start = Sys_MilliSeconds();
	fputs("Setting server map to q3dm7...", stdout);
	Cbuf_ExecuteText(1, "map q3dm7");
	printf("Done in %d ms", (Sys_MilliSeconds() - start));
}

void server(void) {

	appConfig config;
	config.errorType = CONNECT_FAIL;
	config.isServer = TRUE;
	config.ptr = &serverFunc;
	config.execString = "connect 127.0.0.1";
	config.messageThreadId = 0;
	config.finished = FALSE;

	RunApplication(config, NULL, NULL, "", SW_SHOW);
}

HANDLE startThread(void* func, int* threadId) {
	
	HANDLE h = CreateThread(
		NULL,	// LPSECURITY_ATTRIBUTES lpsa,
		0,		// DWORD cbStack,
		(LPTHREAD_START_ROUTINE)func,	// LPTHREAD_START_ROUTINE lpStartAddr,
		0,			// LPVOID lpvThreadParm,
		0,			//   DWORD fdwCreate,
		&threadId);

	return h;
}

void startServer(void) {
	int threadId;
	HANDLE serverHandle = startThread(server, &threadId);
}

int equals(char* c1, char* c2) {
	if (!c1 || !c2) return 0;
	int i = 0;
	while (1) {
		if ((c1[i] == '\0' && c2[i] != '\0') ||
			(c1[i] != '\0' && c2[i] == '\0')) {
			return 0;
		}
		if (c1[i] != c2[i]) return 0;
		if (c1[i] == '\0' && c2[i] == '\0') break;
		i++;
	}
	return 1;
}

int main(void) {

	puts("--- Starting quake3 environment.. ---");
	puts("");
	startServer();
	char* line[1024];

	do {

		scanf("%s", line);

	} while (!equals(line, "exit"));
}







