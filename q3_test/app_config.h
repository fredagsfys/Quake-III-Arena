

typedef enum simulatedError {
	CLIENT_DROPPED,
	SERVER_KICKED,
	CONNECT_FAIL,
	CONNECT_TIMEOUT,
	CONNECTED,
} simulatedError;

typedef struct configStruct {
	simulatedError errorType;
	void* ptr;
	void* commandPtr;
	char* commandName;
	char* execString;
	int* finished;
	int* messageThreadId;
	int* isServer;
} appConfig;

