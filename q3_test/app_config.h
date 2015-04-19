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
	int connstate;
	void* ptr;
	void* commandPtr;
	int* server;
	int* reset;
	char* testName;
	char* commandName;
	char* execString;
	int* finished;
	int* breakDown;
	struct appConfigT *next;
} appConfig;

appConfig getConfig(void);
void printStack(void);