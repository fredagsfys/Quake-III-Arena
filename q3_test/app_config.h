#include <Windows.h>

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
} appConfig;

