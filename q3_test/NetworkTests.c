#include <Windows.h>
#include <DbgHelp.h>
#include "app_config.h"
#include "../code/game/q_shared.h"

#pragma comment(lib, "Dbghelp.lib")

#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void CL_Init(void);
int checkIfCommandExists(char* command);
int Sys_MilliSeconds(void);
appConfig PlayerConnectsToGame();
appConfig PlayerDisconnectsFromGame();
appConfig PlayerKickedFromGame();
int clientIntialized = 0;
int mapSet = 0;
HANDLE conHandle;
appConfig activeTestConfig;
appConfig tearDownConfig;

appConfig* allocConfig(int size)
{
	appConfig *curr, *head, *first;
	head = NULL;

	for (int i = 0; i < size; i++)
	{
		curr = (appConfig*)malloc(sizeof(appConfig));
		curr->next = head;
		head = curr;
	}

	curr = head;

	return curr;
}

void printStack(void)
{
	unsigned int   i;
	void         * stack[100];
	unsigned short frames;
	SYMBOL_INFO  * symbol;
	HANDLE         process;

	process = GetCurrentProcess();

	SymInitialize(process, NULL, TRUE);

	frames = CaptureStackBackTrace(0, 100, stack, NULL);
	symbol = (SYMBOL_INFO *)calloc(sizeof(SYMBOL_INFO) + 256 * sizeof(char), 1);
	symbol->MaxNameLen = 255;
	symbol->SizeOfStruct = sizeof(SYMBOL_INFO);

	for (i = 0; i < frames; i++)
	{
		SymFromAddr(process, (DWORD64)(stack[i]), 0, symbol);

		printf("%i: %s - 0x%0X\n", frames - i - 1, symbol->Name, symbol->Address);
	}

	free(symbol);
}

#define MAX_TEST_CASES 10

typedef struct testCase {
	void* testFunction;
	char* testName;
	appConfig testConfig;
} testCase;

testCase testCases[MAX_TEST_CASES];
int testCaseAmount;

void clientConnectivity(void)
{
	RunApplication(activeTestConfig, NULL, NULL, "", SW_SHOW);
}

typedef struct color_
{
	int* white;
	int* gray;
	int* blue;
	int* green;
	int* red;
	int* yellow;
} color_;

color_ Color;

void setColor(int* color)
{
	SetConsoleTextAttribute(conHandle, color);
}

void setupClient()
{
	int start = Sys_MilliSeconds();
	if (!clientIntialized) {
		fputs("Initializing client side...", stdout);
		CL_Init();
		printf("Done in %d ms", (Sys_MilliSeconds() - start));
		puts("");
		clientIntialized = 1;
	}
	else {
		puts("Client already initialized, skipping...");
	}
}

void setupMap(char* map)
{
	int start = Sys_MilliSeconds();
	if (!map) map = "q3dm7";
	if (!mapSet) {
		fputs("Setting server map to q3dm7...", stdout);
		char* m[20];
		sprintf(m, "map %s", map);
		Cbuf_ExecuteText(1, m);
		printf("Done in %d ms", (Sys_MilliSeconds() - start));
		puts("");
		mapSet = 1;
	}
	else {
		puts("Map already set, skipping...");
	}
}

void execConfig(appConfig config, int time)
{
	if (config.execString == "") {
		puts("Config had no execString, skipping...\n");
	}
	else {
		printf("Running execString: ");
		setColor(Color.yellow);
		printf(config.execString);
		setColor(Color.gray);
		Cbuf_ExecuteText(1, config.execString);

		printf("\n - TEST DONE in %d ms", (Sys_MilliSeconds() - time));

		puts("");
		puts("");
	}
}

int setupEnviroment()
{
	int first = Sys_MilliSeconds();
	setupClient();
	setupMap(NULL);
	return first;
}

void threadFunc(appConfig config) {

	if (config.breakDown)
	{
		puts("\nBreaking down quake...\n");
		Cbuf_ExecuteText(1, config.execString);
		
		puts("\n:::Resetting game state...:::\n");
		clientIntialized = 0;
		mapSet = 0;

		// Assert
		int expected = TRUE;
		int actual = IsStateEqualTo((appConfig*)config.first->connstate);
		TEST_ASSERT_EQUAL_INT(expected, actual);
		int result = TestPassed();

		puts("Test complated!");
		puts("");
		printf("Expected: %d\n", expected);
		printf("  Actual: %d\n\n", actual);
		printf("Test ");
		if (result)
		{
			setColor(Color.green);
			printf("PASSED");
		} 
		else
		{
			setColor(Color.red);
			printf("FAILED");
		}
		setColor(Color.gray);
		puts("");
		puts("");

		return;
	}

	setColor(Color.green);
	printf(config.testName);
	setColor(Color.gray);

	int time = setupEnviroment();
	execConfig(config, time);

	// Act

	if (config.reset) {
		puts("\n:::Resetting game state...:::\n");
		clientIntialized = 0;
		mapSet = 0;
	}
}

HANDLE startThread(void* func, int* threadId) {
	
	return CreateThread(
		NULL,	// LPSECURITY_ATTRIBUTES lpsa,
		0,		// DWORD cbStack,
		(LPTHREAD_START_ROUTINE)func,	// LPTHREAD_START_ROUTINE lpStartAddr,
		0,			// LPVOID lpvThreadParm,
		0,			//   DWORD fdwCreate,
		&threadId);
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

void printTestCases()
{
	int count = 1;
	for (int i = 0; i < testCaseAmount; i++)
	{
		if (testCases[i].testName != NULL)
		{
			printf("%d - %s\n", i+1, testCases[i].testName);
			count++;
		}
	}
	printf("\n%d - Run all test cases\n", count);
}

void setupColors()
{
	Color.white = 15;
	Color.blue = 1;
	Color.green = 2;
	Color.red = 12;
	Color.gray = 7;
	Color.yellow = 6;
}

void addTestCase(testCase tc)
{
	for (int i = 0; i < MAX_TEST_CASES; i++)
	{
		if (testCases[i].testName == NULL)
		{
			testCaseAmount = i + 1;
			testCases[i] = tc;
			return;
		}
	}
}

void initTearDownConfig()
{
	tearDownConfig.ptr = &threadFunc;
	tearDownConfig.execString = "quit";
	tearDownConfig.finished = FALSE;
	tearDownConfig.next = 0;
	tearDownConfig.reset = TRUE;
	tearDownConfig.breakDown = TRUE;
}

void setupTests()
{
	// BREAKDOWN CONFIG INIT
	initTearDownConfig();

	// Arrange 
	testCase testCaseOne;
	testCaseOne.testFunction = &clientConnectivity;

	// Act 1
	testCaseOne.testName = "Client connectivity";
	testCaseOne.testConfig = PlayerConnectsToGame();
	addTestCase(testCaseOne);

	// Act 2
	testCaseOne.testName = "Client disconnects";
	testCaseOne.testConfig = PlayerDisconnectsFromGame();
	addTestCase(testCaseOne);

	// Act 3
	testCaseOne.testName = "Client kicked from game";
	testCaseOne.testConfig = PlayerKickedFromGame();
	addTestCase(testCaseOne);
}

void runTest(int testIndex) {
	int threadId;
	testCase tc = testCases[testIndex];
	if (tc.testConfig.ptr != 0xcccccccc)
	{
		activeTestConfig = tc.testConfig;
		HANDLE threadHandle = startThread(tc.testFunction, &threadId);


	}
	
}

int main(void) {

	conHandle = GetStdHandle(STD_OUTPUT_HANDLE);
	setupColors();
	setupTests();

	puts("Starting quake3 test environment...");
	puts("");

	char* line[1024];
	printTestCases();
	printf("\nSelect test to run: ");

	do {

		scanf("%s", line);
		system("cls");

		int number = atoi(line);
		if (number <= MAX_TEST_CASES && number > 0)
		{
			number--;

			if (number == testCaseAmount)
			{
				for (int i = 0; i < testCaseAmount; i++)
				{
					if (testCases[i].testName != NULL)
						runTest(i);
				}
			}
			else
			{
				if (testCases[number].testName != NULL)
					runTest(number);
			}
		}

	} while (!equals(line, "exit"));
}

appConfig PlayerConnectsToGame(){

	// Assign
	appConfig* ac = allocConfig(2);
	ac->testName = "TEST # 1 - Player tries to connect to a online game.\n";
	ac->errorType = CONNECT_FAIL;
	ac->ptr = &threadFunc;
	ac->execString = "connect 127.0.0.1";
	ac->finished = FALSE;
	ac->reset = FALSE;
	ac->server = TRUE;
	ac->connstate = (int)CA_CONNECTED;
	ac->breakDown = FALSE;
	ac->first = ac;

	ac->next = &tearDownConfig;
	ac->next->first = ac;

	return *ac;
}

appConfig PlayerDisconnectsFromGame() {

	// Assign
	appConfig* ac = allocConfig(2);
	ac->testName = "Arranging game state.\n";
	ac->errorType = CONNECT_FAIL;
	ac->ptr = &threadFunc;
	ac->execString = "connect 127.0.0.1";
	ac->finished = FALSE;
	ac->reset = FALSE;
	ac->server = TRUE;
	ac->breakDown = FALSE;

	ac->next->testName = "TEST # 2 - Player tries to disconnect from a online game.\n";
	ac->next->errorType = CONNECT_FAIL;
	ac->next->ptr = &threadFunc;
	ac->next->execString = "disconnect";
	ac->next->finished = FALSE;
	ac->next->next = NULL;
	ac->next->breakDown = FALSE;
	ac->next->reset = FALSE;
	
	return *ac;
}

appConfig PlayerKickedFromGame(){

	// Assign
	appConfig* ac = allocConfig(2);
	ac->testName = "Arranging game state";
	ac->errorType = CONNECT_FAIL;
	ac->ptr = &threadFunc;
	ac->execString = "connect 127.0.0.1";
	ac->finished = FALSE;
	ac->reset = FALSE;
	ac->server = TRUE;
	ac->breakDown = FALSE;

	ac->next->testName = "TEST # 3 - Connected player gets kicked by host.\n";
	ac->next->errorType = CONNECT_FAIL;
	ac->next->ptr = &threadFunc;
	ac->next->execString = "kick HSKINGEN";
	ac->next->finished = FALSE;
	ac->next->next = NULL;
	ac->next->breakDown = FALSE;
	ac->next->reset = TRUE;

	return *ac;
}








