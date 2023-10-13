cd ..
cd .tasks
echo "Diga el titulo de la tarea: "
read title
echo "Diga la descripcion de la tarea: "
read description
if [ -f "$title.txt" ];
then
	echo "Ya la tarea existe"
else
	echo $description > "$title.txt"
	echo "Se creo la tarea"
fi
return 0