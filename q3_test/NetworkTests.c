#include <Windows.h>
#include "app_config.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
void Cbuf_ExecuteText(int exec_when, const char *text);
void CL_Init(void);
int checkIfCommandExists(char* command);
int Sys_MilliSeconds(void);
int clientIntialized = 0;
int mapSet = 0;
HANDLE conHandle;
appConfig activeTestConfig;

#define MAX_TEST_CASES 10

typedef struct testCase {
	void* testFunction;
	char* testName;
	appConfig testConfig;
} testCase;

testCase testCases[MAX_TEST_CASES];

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

	setColor(Color.green);
	printf(config.testName);
	setColor(Color.gray);

	int time = setupEnviroment();
	execConfig(config, time);

	if (config.reset) {
		puts("\n:::Resetting game state...:::\n");
		clientIntialized = 0;
		mapSet = 0;
	}
}

void configSetup(void) {

	appConfig config;	
	config.testName = "TEST # 1 - Player tries to connect to a online game.\n";
	config.errorType = CONNECT_FAIL;
	config.ptr = &threadFunc;
	config.execString = "connect 127.0.0.1";
	config.finished = FALSE;
	config.reset = FALSE;
	config.server = 1;
	//config.next = NULL;

	appConfig config2;
	config2.testName = "TEST # 2 - Player tries to disconnect from a online game.\n";
	config2.errorType = CONNECT_FAIL;
	config2.ptr = &threadFunc;
	config2.execString = "";
	config2.finished = FALSE;
	config2.prev = &config;
	config2.next = 0;
	config2.reset = FALSE;

	config.next = &config2;

	appConfig config3;
	config3.testName = "TEST # 3 - Connected player gets kicked by host.\n";
	config3.errorType = CONNECT_FAIL;
	config3.ptr = &threadFunc;
	config3.execString = "kick HSKINGEN2";
	config3.finished = FALSE;
	config3.prev = &config2;
	config3.next = 0;
	config3.reset = TRUE;

	config2.next = &config3;

	RunApplication(config, NULL, NULL, "", SW_SHOW);
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

void startQuake(void) {
	int threadId;
	HANDLE threadHandle = startThread(&configSetup, &threadId);
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
	for (int i = 0; i < MAX_TEST_CASES; i++)
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
			testCases[i] = tc;
			return;
		}
	}
}

void setupTests()
{
	// CREATE ALL TESTS HERE AND BIND TO FUNCTIONS
	testCase testCaseOne;
	testCaseOne.testFunction = &clientConnectivity;
	testCaseOne.testName = "Client connectvity";
	
	appConfig config;
	config.testName = "TEST # 1 - Player tries to connect to a online game.\n";
	config.errorType = CONNECT_FAIL;
	config.ptr = &threadFunc;
	config.execString = "connect 127.0.0.1";
	config.finished = FALSE;
	config.reset = FALSE;
	config.server = TRUE;
	config.next = NULL;

	testCaseOne.testConfig = config;

	addTestCase(testCaseOne);

	testCase testCaseTwo;
	testCaseTwo.testFunction = &threadFunc;
	testCaseTwo.testName = "Disconnect client";
	addTestCase(testCaseTwo);

	testCase testCaseThree;
	testCaseThree.testFunction = &threadFunc;
	testCaseThree.testName = "Kick client";
	addTestCase(testCaseThree);

	testCase testCaseFour;
	testCaseFour.testFunction = &threadFunc;
	testCaseFour.testName = "Do the rumba";
	addTestCase(testCaseFour);

	testCase testCaseFive;
	testCaseFive.testFunction = &threadFunc;
	testCaseFive.testName = "YOLO";
	addTestCase(testCaseFive);
}

int main(void) {

	conHandle = GetStdHandle(STD_OUTPUT_HANDLE);
	setupColors();
	setupTests();

	puts("Starting quake3 environment...");
	puts("");

	char* line[1024];
	printf("Select tests to run\n\n");
	printTestCases();
	puts("");

	do {

		scanf("%s", line);

		int number = atoi(line);
		if (number <= MAX_TEST_CASES && number > 0 && testCases[number].testName != NULL)
		{
			number--;
			int threadId;
			testCase tc = testCases[number];
			activeTestConfig = tc.testConfig;
			void(*test)(void) = tc.testFunction;
			HANDLE threadHandle = startThread(&test, &threadId);
		}

		if (equals(line, "start")) {
			startQuake();
		}

	} while (!equals(line, "exit"));
}







