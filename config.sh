# Este script se ejecuta siempre que comienza el programa, pero solo hace su trabajo una vez.
if [ -d ./tasks ];
then
	return 0
else
	mkdir ./tasks
	return 0;
fi