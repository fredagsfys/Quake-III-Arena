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
	void* ptr;
	void* commandPtr;
	int* reset;
	char* commandName;
	char* execString;
	int* finished;
	struct appConfigT *next;
	struct appConfigT *prev;
} appConfig;

appConfig getConfig(void);