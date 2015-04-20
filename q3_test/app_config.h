typedef enum simulatedError {
	CLIENT_DROPPED,
	SERVER_KICKED,
	SERVER_REJECT,
	CONNECT_FAIL,
	CONNECT_TIMEOUT,
	CONNECTED,
} simulatedError;

typedef struct printStack_s {
	char* line;
	struct printStack_s *next;
	struct printStack_s *prev;
	struct printStack_s *last;
	int* combinedLength;
} printStack_s;

typedef struct appConfigT {
	simulatedError errorType;
	void* printStackPtr;
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
void printStack(void);