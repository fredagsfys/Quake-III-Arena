typedef enum simulatedError {
	CLIENT_DROPPED,
	SERVER_KICKED,
	SERVER_REJECT,
	CONNECT_FAIL,
	CONNECT_TIMEOUT,
	CONNECTED,
} simulatedError;

typedef struct appConfigT {
	simulatedError errorType;
	int* connstate;
	void* ptr;
	int* server;
	int* reset;
	char* testName;
	char* execString;
	int* finished;
	int* breakDown;
	int* timeout;
	struct appConfigT *first;
	struct appConfigT *next;
} appConfig;

appConfig getConfig(void);
void printStack(void);
int TestPassed(void);