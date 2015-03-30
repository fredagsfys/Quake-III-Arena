#include <Windows.h>
#include "app_config.h"
#include "fff.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void Cmd_Echo_f(void);
void CL_Connect_f(void);
void CL_Init(void);
int checkIfCommandExists(char* command);

void clientFunc(appConfig config) {

	puts("quake3 client started!");
	puts("");
	puts("Starting test one, creating command 'echo2' and using it");

	/*Cmd_RemoveCommand(config.commandName);
	Cmd_AddCommand(config.commandName, config.commandPtr);

	BOOL hej = checkIfCommandExists(config.commandName);
	if (hej) {
		Cbuf_ExecuteText(1, "echo2 echo2 was found");
		puts("Echo2 was found. Test successful!");
	}*/
}

void serverFunc(appConfig config) {

	puts("quake3 server started!");
	puts("");
	puts("Starting test one, creating command 'echo2' and using it");

	Cmd_RemoveCommand(config.commandName);
	Cmd_AddCommand(config.commandName, config.commandPtr);
	CL_Init();

	BOOL hej = checkIfCommandExists(config.commandName);
	if (hej) {
		Cbuf_ExecuteText(1, config.execString);
		//puts("Echo2 was found. Test successful!");
	}
}

void client(void) {

	appConfig config;
	config.errorType = CONNECT_FAIL;
	config.isServer = FALSE;
	config.ptr = &clientFunc;
	config.commandName = "echo2";
	config.commandPtr = &Cmd_Echo_f;
	config.execString = "echo2 1234123123";
	config.messageThreadId = 0;
	config.finished = FALSE;

	RunApplication(config, NULL, NULL, "", SW_SHOW);
}

void server(void) {

	appConfig config;
	config.errorType = CONNECT_FAIL;
	config.isServer = TRUE;
	config.ptr = &serverFunc;
	config.commandName = "connect";
	config.commandPtr = &CL_Connect_f;
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

void startClient(void) {
	int threadId;
	HANDLE clientHandle = startThread(client, &threadId);
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

	char* line[1024];

	do {

		scanf("%s", line);

		if (equals(line, "client")) {
			startClient();
		}

		if (equals(line, "server")) {
			startServer();
		}

	} while (!equals(line, "exit"));
}







