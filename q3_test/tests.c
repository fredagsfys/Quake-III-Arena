#include <Windows.h>
#include "app_config.h"
#include "fff.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void CL_Init(void);
int checkIfCommandExists(char* command);
int Sys_MilliSeconds(void);
int clientIntialized = 0;
int mapSet = 0;

static int REJECT_ALL_CLIENTS;

void serverFunc(appConfig config) {

	int start = Sys_MilliSeconds();
	if (!clientIntialized) {
		fputs("Initializing client side...", stdout);
		CL_Init();
		printf("Done in %d ms", (Sys_MilliSeconds() - start));
		puts("");
		clientIntialized = 1;
	} else {
		puts("Client already initialized, skipping...");
	}

	start = Sys_MilliSeconds();
	if (!mapSet) {
		fputs("Setting server map to q3dm7...", stdout);
		Cbuf_ExecuteText(1, "map q3dm7");
		printf("Done in %d ms", (Sys_MilliSeconds() - start));
		puts("");
		mapSet = 1;
	} else {
		puts("Map already set, skipping...");
	}

	start = Sys_MilliSeconds();
	fputs("Connecting client to server...", stdout);
	Cbuf_ExecuteText(1, config.execString);
	printf("Done in %d ms", (Sys_MilliSeconds() - start));
	puts("");
	puts("");

}

void server(void) {

	appConfig config;	
	config.errorType = CONNECT_FAIL;
	config.ptr = &serverFunc;
	config.execString = "connect 127.0.0.1";
	config.finished = FALSE;

	appConfig config2;
	config2.errorType = CONNECT_FAIL;
	config2.ptr = &serverFunc;
	config2.execString = "";
	config2.finished = FALSE;
	config2.prev = &config;
	config2.next = 0;

	config.next = &config2;

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

	puts("Starting quake3 environment...");
	puts("");
	startServer();
	char* line[1024];

	do {

		scanf("%s", line);

	} while (!equals(line, "exit"));
}







