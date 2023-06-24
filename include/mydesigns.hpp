#pragma once
#include<QString>


//foo namespace to force the linker to link the backing library composed only of qml files
namespace fooDesign 
{
	QString fooPrint(void);
};
