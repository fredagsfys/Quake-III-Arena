#include "app_config.h"
#include "fff.h"
#include "unity.h"

int RunApplication(appConfig config, HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);
int WINAPI WinMain2(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
	appConfig config = { CONNECT_FAIL };
	RunApplication(config, hInstance, NULL, "", SW_SHOW);
}


