#include "stdafx.h"
#include "CppUnitTest.h"
#include "fff.h"
#include "ui_local.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace q3_test
{		
	TEST_CLASS(UnitTest1)
	{
	public:
		
		TEST_METHOD(TestMethod1)
		{
			// TODO: Your test code here
			trap_Cmd_ExecuteText(EXEC_APPEND, "echo Hej");
		}

	};
}