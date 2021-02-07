program TetrisUcabV7;
uses crt;
type
  RegJugadores = record     {variables del registro de usuario}
    nombre:string[80];
    ID:integer;
    Alias:string[30];
    FechaDeNacimiento:string[12];
    password:string[6];
    score:integer;
    abreviatura:string[3];
    correo:string[40];
  end;
  top = array[1..5] of record
          nombre: string[80];
          ID: integer;
          Alias : string[30];
          score : integer;
          abreviatura:string[3];
        end;
 Almacenado = file of RegJugadores;
 const
   ubicacion = ('Jugadores.dat');
   ubicacion2 = ('Reporte.dat');{ubicacion del archivo}
   pared = 9;

var Recorrer,x,y,Tope_Matriz,fila,b,c,velocidad,linea,contador,SumaP,NumFig,j:integer;

 MatrizPrincipal:array[1..12,1..12] of integer;  // Declaramos una matriz del campo de juego 12x12
 FigElegida: array[1..4] of integer;            // Figuras escogidas por usuario
 rango_azar:array[1..1000] of integer;         // Declaramos una matriz aleatoria para crear una secuencia numérica de la apariencia de las formas, para determinar la siguiente forma.

  Contador_Figuras:integer;    // Declarar el contador de las figuras caídas
  Puntos,i:integer;           // Declara una variable para guardar el resultado del juego (puntos del juego)
  minutos,segundos:integer;
  nro_mov,eleccion:integer; // Numero de movimientos y escoger en el programa
  mod_mov,tiempo:boolean;  // Activar movimientos en el cuerpo del programa
  jugadores:almacenado;   // Variables de registro de usuario
  dato:RegJugadores;
  estado:integer;
  respuesta:char;
  datoscorrectos,jugar,veldak:boolean;
  orden:top;
  reporte:file of top;
  auxNombre:string[80];
  auxEstado:string[3];
  valido:boolean;

FUNCTION Cifrado(texto:string):string;     {cifrado}
  var
    i : SmallInt;
  begin
    Cifrado:='';
    For i:=1 to length(texto) do
      Cifrado:=Cifrado+Chr((Ord(texto[i]))+2);
  end;
FUNCTION Descriptacion(texto:string):string; {Desencriptar}
  var
    i: Smallint;
    begin
    Descriptacion:='';
      For i:=1 to length(texto) do
        Descriptacion:=descriptacion+chr((Ord(texto[i]))-2);
    end;
FUNCTION busqueda(aliass: string; var jugadores: Almacenado): Integer;
  Var
    match: Boolean;		{Coincidencia}
    plantilla: RegJugadores;	{plantilla del registro}

  	Begin
  		match:=False;                   {inicializo la coincidencia}
  		Reset(jugadores);      			{abro el fichero}

  		  while not Eof(Jugadores) and not match do		{busco una coincidencia}
  			Begin
  				Read(Jugadores, plantilla);		{saco los datos}
  				 if plantilla.alias = aliass Then 		  	{comparo}
  				  match:=True;               		{si existe entonces hay una coincidencia}
  			End;

  		  if match=True Then
  			busqueda:=FilePos(Jugadores)-1
  		  Else
  			busqueda:=-1; 				{no le asigno 0 porque se inician en 0}
  	End;
Procedure validacion(cadena:string);
  // recibe la palabra
begin

     valido:=true;
     for i:=1 to length(cadena) do
         if ord(cadena[i]) in[46,65..90,97..122] then
         begin
           valido:=true;      // verificacion de letras introducidas
         end
           else
              valido := false;

     if valido=false then
     begin
           writeln('*** Por favor Coloque Datos Validos! Pulse [Enter]***');
           readkey;
           clrscr; // Limpiar Pantalla
     end;

end;
procedure EntradaDeDatos;
  var nuevo:integer;

    cadena:string;
  begin
    // Entrada de datos
    repeat
     writeln('******Entrada de datos******');

     repeat

      write(' Introduzca Su Nombre = ');
      readln(dato.nombre);
      cadena:=dato.nombre;
      validacion(cadena);

     until (valido = true) and (i = Length(cadena));

     repeat

      write(' Introduzca Su Alias = ');
      readln(dato.Alias);
      cadena:=dato.Alias;
      validacion(cadena);

      until (valido = true) and (i = Length(cadena));

      { VALIDACION DE ALIAS EN CASO DE QUE ESTE EN EL ARCHIVO }
          Nuevo:=busqueda(dato.alias, Jugadores);
          If (Nuevo < 0) then	{Si no existe...}
  	  Begin
                 write(' Clave de seguridad (maximo de 6) = ');
                 readln(dato.password);


            repeat
                    write(' Introduzca Su Correo Electronico = ');
                    readln(dato.correo);
                    cadena:=dato.correo;
                    validacion(cadena);

            until (valido = true) and (i = Length(cadena));

                 write(' Fecha de nacimiento = ');
                 readln(dato.FechaDeNacimiento);
                 repeat
                   if valido=false then
                    begin
                    clrscr;
                    end;
                                                WriteLn('> Amazonas-------------[1]');
  						WriteLn('> Anzoategui-----------[2]');
  						WriteLn('> Apure----------------[3]');
  						WriteLn('> Aragua---------------[4]');
  						WriteLn('> Barinas--------------[5]');    (* Menu de prcedencias. *)
  						WriteLn('> Bolivar--------------[6]');
  						WriteLn('> Carabobo-------------[7]');
  						WriteLn('> Cojedes--------------[8]');
  						WriteLn('> Delta Amacuro--------[9]');
  						WriteLn('> Distrito Capital-----[10]');
  						WriteLn('> Falcon---------------[11]');
  						WriteLn('> Guarico--------------[12]');
  						WriteLn('> Lara-----------------[13]');
  						WriteLn('> Merida---------------[14]');
  						WriteLn('> Miranda--------------[15]');
  						WriteLn('> Monagas--------------[16]');
  						WriteLn('> Nueva Esparta--------[17]');
  						WriteLn('> Portuguesa-----------[18]');
  						WriteLn('> Sucre----------------[19]');
  						WriteLn('> Tachira--------------[20]');
  						WriteLn('> Trujillo-------------[21]');
  						WriteLn('> Vargas---------------[22]');
  						WriteLn('> Yaracuy--------------[23]');
  						WriteLn('> Zulia----------------[24]');
                                                write(' SELECCIONE Estado de procedencia = ');
                                                Readln(estado);

                           if (estado<=0) or (estado>24) then
                            begin
                            writeln('Por favor escriba un lugar de procedencia valido!!!');
                            valido:=false;
                            end;

                 until (estado>0) and (estado<=24);

  						Case estado of
  							1:dato.abreviatura:='AMZ';
  							2:dato.abreviatura:='AZT';
  							3:dato.abreviatura:='APR';
  							4:dato.abreviatura:='ARG';
  							5:dato.abreviatura:='BRN';
  							6:dato.abreviatura:='BLV';
  							7:dato.abreviatura:='CRB';
  							8:dato.abreviatura:='COJ';     {Una vez seleccionado la variable}
  							9:dato.abreviatura:='DLA';     {procedencia obtendra su abreviacion}
  							10:dato.abreviatura:='CCS';
  							11:dato.abreviatura:='FAL';
  							12:dato.abreviatura:='GRC';
  							13:dato.abreviatura:='LRA';
  							14:dato.abreviatura:='MRD';
  							15:dato.abreviatura:='MIR';
  							16:dato.abreviatura:='MNG';
  							17:dato.abreviatura:='NVE';
  							18:dato.abreviatura:='PRT';
  							19:dato.abreviatura:='SCR';
  							20:dato.abreviatura:='TCH';
  							21:dato.abreviatura:='TRJ';
  							22:dato.abreviatura:='VRG';
  							23:dato.abreviatura:='YRC';
  							24:dato.abreviatura:='ZUL';
  				                end;


           dato.ID:= random(9999999)*3;
           dato.password:= Cifrado(dato.password);
           Writeln('Su ID de Usuario es ',dato.ID);
           writeln('Desea guardar este usuario SI[1] O NO[2]');
                repeat
                 respuesta := readkey;
                 until respuesta in['1','2'];

                {$I-} reset(jugadores); {$I+}   {abro el archivo}
                   if ioresult <> 0 then  {en caso de que el archivo no exista crea uno}
                      begin
                      rewrite(jugadores);
                      seek(jugadores,0);
                      write(jugadores,dato);
                      close(jugadores);
                      end
                   else
                       begin
                       seek(jugadores,filesize(jugadores));  {Si el archivo existe lo guardara al final}
                       write(jugadores,dato);
                       close(jugadores);
                       end;
                       clrscr;
      end
       else
            Begin
  	      Writeln;
  	      WriteLn('USTED SE HA REGISTRADO ANTERIORMENTE'); {Paso en caso de haberse registrado antes.}
  	      Write('Desea registrar otro jugador(No[1]/Si[2]) ');
  	      Readln(respuesta);
                clrscr;
  	  end;

     until (respuesta = '1');
     readkey;
  end;
procedure InicioDeSesion(var datosCorrectos:boolean);
  var
     verificador:boolean;
     Usuario,clave:string;
     peso:integer;
     respu:char;

   begin
    {$I-} reset(jugadores); {$I+}   {abro el archivo}
      if ioresult <> 0 then  {en caso de que el archivo no exista crea uno}
       begin
         writeln('  Error de archivo pulse [Enter]');
         readln;
         exit;
       end
       else
        begin
           verificador:=false;
           peso:=filesize(jugadores); {Verifico si el archivo contiene algun elemento}
           if peso<>0 then
            begin
            writeln('Ingrese su nombre o alias previamente registrado');
            readln(Usuario);
            Writeln('Ingrese su clave');
            readln(clave);
            while not Eof(Jugadores) and not verificador do		{busco una coincidencia}
  	             Begin
                           Read(jugadores, dato);
                           dato.password:=Descriptacion(dato.password);
  			  if (Usuario=dato.nombre) or (Usuario=dato.Alias) then  {Si existe la coincidencia entonces entro}
                              begin
                               if clave=dato.password then     {Si existe otra coincidencia entonces el usuario ingreso bien sus datos}
                                begin
                                   Writeln('Ha iniciado sesion correctamente ',dato.nombre);
                                   writeln;
                                   verificador:=true;
                                   writeln('Desea jugar con este usuario SI[1] O NO[2]');
                                   writeln;
                                    repeat
                                      respu := readkey;
                                     until respu in['1','2'];

                                      if respu='1' then
                                       begin
                                         datosCorrectos:=true;
                                         auxNombre:=dato.Alias;
                                         auxEstado:=dato.abreviatura;
                                         writeln('PRESIONE [ENTER]');
                                         readln;
                                       end;

                                end
                              end;
  	            End;
              if verificador=false then {Debido a que es un ciclo repetitivo si condiciono dentro me repetira varias veces la palabra por ello verifico al final}
               begin
                writeln('Ha ingresado incorrectamente sus datos pulse [Enter]');
                readln;
               end;
           end
           else
            begin
             Writeln('El archivo se encuentra totalmente vacio pulse [Enter]'); {En caso de que el archivo este totalmente vacio}
             readln;
            end;
        end;
      close(jugadores);
   end;
 procedure escoger;
 type arreglo=array[1..8] of boolean;
  var terminar:integer;
    lista:arreglo;
    tecla:char;
  begin
    terminar:=0;
    eleccion:=0;
    for i:=1 to 8 do
    lista[i]:=false; // inicializar

  repeat

      if lista[1]=false then  // verificar cuales figuras fueron escogidas
      begin
         gotoxy(1,2); write('[][][]'); // mostrar figura si no se ha escogido
         gotoxy(1,8); write('  1');
      end
      else
      begin
        Textcolor(10);
        gotoxy(1,20); write('[][][]');  // se desplaza hacia abajo si escogio la figura
        gotoxy(1,24); write('  1');
        textcolor(white);
      end;

      if lista[2]=false then
      begin
          gotoxy(10,2); write('[]');
          gotoxy(10,3); write('[]');
          gotoxy(10,4); write('[]');
          gotoxy(10,8); write(' 2');
      end
      else
      begin
        Textcolor(10);
        gotoxy(10,20); write('[]');
        gotoxy(10,21); write('[]');
        gotoxy(10,22); write('[]');
        gotoxy(10,24); write(' 2');
        textcolor(white);
      end;
      if lista[3]=false then
      begin
        gotoxy(20,2); write('[]');
        gotoxy(20,3); write('[]');
        gotoxy(20,4); write('[][]');
        gotoxy(20,8); write('   3');
      end
      else
      begin
        Textcolor(10);
        gotoxy(20,20); write('[]');
        gotoxy(20,21); write('[]');
        gotoxy(20,22); write('[][]');
        gotoxy(20,24); write('   3');
        textcolor(white);
      end;
      if lista[4]=false then
      begin
        gotoxy(30,2); write('  []');
        gotoxy(30,3); write('  []');
        gotoxy(30,4); write('[][]');
        gotoxy(30,8); write('   4');
      end
      else
      begin
        Textcolor(10);
        gotoxy(30,20); write('  []');
        gotoxy(30,21); write('  []');
        gotoxy(30,22); write('[][]');
        gotoxy(30,24); write('   4');
        textcolor(white);
      end;
      if lista[5]=false then
       begin
        gotoxy(40,2); write('[][]');
        gotoxy(40,3); write('[]');
        gotoxy(40,4); write('[]');
        gotoxy(40,8); write(' 5');
       end
      else
      begin
        Textcolor(10);
        gotoxy(40,20); write('[][]');
        gotoxy(40,21); write('[]');
        gotoxy(40,22); write('[]');
        gotoxy(40,24); write(' 5');
        textcolor(white);
      end;
      if lista[6]=false then
        begin
          gotoxy(50,2); write(' [][]');
          gotoxy(50,3); write('   []');
          gotoxy(50,4); write('   []');
          gotoxy(50,8); write('   6');
        end
      else
      begin
        Textcolor(10);
        gotoxy(50,20); write(' [][]');
        gotoxy(50,21); write('   []');
        gotoxy(50,22); write('   []');
        gotoxy(50,24); write('   6');
        textcolor(white);
      end;
      if lista[7]=false then
        begin
          gotoxy(60,2); write('[][][]');
          gotoxy(60,3); write('  [] ');
          gotoxy(60,4); write('  [] ');
          gotoxy(60,8); write('   7 ');
        end
      else
      begin
        Textcolor(10);
        gotoxy(60,20); write('[][][]');
        gotoxy(60,21); write('  [] ');
        gotoxy(60,22); write('  [] ');
        gotoxy(60,24); write('   7 ');
        textcolor(white);
      end;
      if lista[8]=false then
        begin
          gotoxy(70,2);write('  []  ');
          gotoxy(70,3);write('  []  ');
          gotoxy(70,4);write('[][][]');
          gotoxy(70,8);write('  8');
        end
      else
      begin
        Textcolor(10);
        gotoxy(70,20);write('  []  ');
        gotoxy(70,21);write('  []  ');
        gotoxy(70,22);write('[][][]');
        gotoxy(70,24);write('  8');
        textcolor(white);
      end;

        terminar:=terminar+1; // determina si ya se escogieron las 4 figuras
        gotoxy(30,14);
        writeln('Escoge 4 Figuras');
        gotoxy(30,15);
        readln(FigElegida[terminar]); // escoge un numero del 1 al 8
        eleccion:=(FigElegida[terminar]); // verificamos si ya esa figura esta escogida
        clrscr; // actualizar seleccion de figuras
        if (eleccion>8) or (eleccion<1) then
        begin
          gotoxy(30,18);
          Textcolor(12);
          writeln('>> Escoge una figura valida! ');
          terminar:=terminar-1;
        end
        else if lista[eleccion]=true then
        begin
          gotoxy(30,18);
          Textcolor(12);
          writeln('>> Ya escogiste esta figura!');
          terminar:=terminar-1;
        end
        else  // esa figura no se ha escogido se coloca en verdadero
        lista[eleccion]:=true;

    until terminar=4; // ya escogio 4 figuras

  end;
procedure modalidad;
begin
       clrscr;  // borrar pantalla
       writeln('Que modalidad desea jugar?');
       writeln('>> Por Movimientos (1)');
       writeln('>> Modo normal     (2)');
       writeln('>> Modo tiempo     (3)');
       readln(eleccion);

       case eleccion of
        1:
          begin
            mod_mov:=true;
            repeat
              writeln('Por Cuantos Movimientos Desea Jugar?');
              readln(nro_mov);

              if (nro_mov<0) or (nro_mov>100) then
                writeln('Por favor escriba un numero de movimiento valido!!');

            until (nro_mov>0) and (nro_mov<=100);
          end;
        3:
          begin
            tiempo:=true;
            repeat
              writeln('cuantos minutos deseas jugar? (Maximo 100 minutos)');
              readln(minutos);

              if (minutos<0) OR (minutos>100) then
                writeln('Por favor escriba un tiempo valido!!');

            until (minutos>0) AND(minutos<=100);
            segundos:=1; // segundos
          end;
       end;
end;
PROCEDURE cargando;
var rodar:integer;
begin
 rodar:=0;

 for i:=1 to 200 do
 begin
  Textcolor(LightGreen);
  gotoxy(35,10);
   write('Cargando...');
   rodar:=rodar+1;

   Textcolor(11);

   if rodar<5 then
   begin
      gotoxy(40,13);
      write('[]');  //cubo1

       gotoxy(38,16);
       write('  ');  // borrar anterior

         gotoxy(37,15);
       write('  ');   // borrar anterior
    end
    else if rodar<10 then
    begin
      gotoxy(42,14);
      write('[]');  //cubo2
    end
    else if rodar<15 then
      begin
        gotoxy(43,15); // cubo3
        write('[]');

        gotoxy(38,14);
         write('  ');    //borrar anterior
      gotoxy(40,13);
      write('  ');  //borrar anterior
        gotoxy(42,14);
      write('  ');  //cubo2
      end
    else if rodar<20 then
      begin
        gotoxy(42,16);
        write('[]');    // cubo4
      end
    else if rodar<25 then
      begin
        gotoxy(40,17);
        write('[]');   // subo5
      end
    else if rodar<30 then
      begin
       gotoxy(38,16);
       write('[]');  // cubo6

        gotoxy(43,15); // borrar anterior
        write('  ');

        gotoxy(42,16);
        write('  ');    // borrar anterior

       gotoxy(40,17);
        write('  ');   // borrar anterior
      end
    else if rodar<35 then
      begin
       gotoxy(37,15);
       write('[]');   // cubo7
      end
    else if rodar<40 then
      begin
         gotoxy(38,14);
         write('[]');    //cubo8
      end
      else if rodar>40 then
          rodar:=1;    // reiniciar cargando

      delay(1); // tiempo proceso
  end
end;
  // Procedimiento para dibujar celdas de campo
procedure Dibujar(x,y:integer);                 // Procedimiento k (x, y): dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
begin


  gotoxy(x*2+20,23-y);                      // Colocar el cursor de texto en la línea (X * 2 + 20) por X y (23-Y) la posición inicial del vaso
  if Recorrer=0 then
  begin
   write('. ');                 // Si ss = 0, se muestran dos símbolos con un fondo vacío entre comillas '. 'Para borrar los rastros del movimiento de la figura a través de la pantalla.

  end;
  if Recorrer=1 then
  begin
   write('[]');                 // ss = 1 entonces se emite el bloque de figuras de Tetris '[]'
  end;
  if Recorrer=pared then  // ss = 9 Los caracteres de ASCII # 124  paredes de Tetris '||'
  begin
    textcolor(LightCyan);
    write(chr(124),chr(124));
    textcolor (white);
  end;
  if (Recorrer=3) and (MatrizPrincipal[x,y]>0) then // si en donde hace la figura hay alguna cantidad entonces se para el juego
   Tope_Matriz:=1;    // ss = 3 y el índice de matriz no es un espacio vacío (el borde de vidrio), luego asigne pus = 1

  if (Recorrer=4) and (MatrizPrincipal[x,y]=0) then   // Escribir el numero de la figura que ha salido de forma aleatoria
   MatrizPrincipal[x,y]:=NumFig;


end;  // Fin del procedimiento para dibujar celdas k (x, y)
// procediemiento para dibujar formas
procedure Figura(x,y,n,s:integer); // El procedimiento fig (x, y, n, s) almacena información sobre los tipos de figuras de Tetris
begin

    if s=3 then
    Tope_Matriz:=0;

    Recorrer:=s;
    Dibujar(x,y);

    // NumFig sera el numero al azar de la figura que sera intercambiado por los numero de figura escogidos por el usuario
    case n of   // cambiar numero del 1 a 4 por numeros escogidos por el usuario para las figuras
       1:n:=FigElegida[1];
       2:n:=FigElegida[2];
       3:n:=FigElegida[3];
       4:n:=FigElegida[4];
    end;



    case n of  // figura escogidas por el usuario
     1:begin
          TextColor(white);
          Dibujar(x-1,y);
          Dibujar(x+1,y);
          Dibujar(x+1,y);
          // Patrón de forma 1
          //   [][][]
      end;


     2:begin
      TextColor(yellow);
      Dibujar(x,y+1);
      Dibujar(x,y-1);
      Dibujar(x,y-1);
      // Patrón de forma 2
      //   []
      //   []
      //   []

      end;

      3:
      begin
        Textcolor(12);
        Dibujar(x,y+1);
        Dibujar(x,y-1);
        Dibujar(x+1,y-1);
        // Patron de forma 3
        //   []
        //   []
        //   [][]
      end;

      4:
      begin
          Textcolor(13);
          Dibujar(x,y+1);
          Dibujar(x,y-1);
          Dibujar(x-1,y-1);
          // Patron de forma 4
          //     []
          //     []
          //   [][]
      end;

      5:
      begin
        Textcolor(10);
        Dibujar(x,y+1);
        Dibujar(x+1,y+1);
        Dibujar(x,y-1);
        // Patron de forma 5
        //   [][]
        //   []
        //   []
      end;
      6:
      begin
        Textcolor(yellow);
        Dibujar(x,y+1);
        Dibujar(x,y-1);
        Dibujar(x-1,y+1);
        // Patron de forma 6
        //   [][]
        //     []
        //     []
      end;
      7:
      begin
      Textcolor(12);
      Dibujar(x,y-1);
      Dibujar(x-1,y);
      Dibujar(x+1,y);
       Dibujar(x,y-2);
       // Patron de forma 7
      //   [][][]
      //     []
      //     []


      end;
      8:
      begin
        Textcolor(13);
        Dibujar(x+1,y);
        Dibujar(x-1,y);
        Dibujar(x,y+1);
         Dibujar(x,y+2);
         // Patron de forma 8

         //    []
        //     []
        //   [][][]
      end;

    end;
  end;  //  Fin del procedimiento de dibujo de figuras

//  Procedimiento de limpieza
procedure limpiar;
begin
  for x:=1 to 12 do
   for y:=1 to 12 do
       if (x=1) or (x=11) or (y=1) then
        MatrizPrincipal[x,y]:=pared
          else
            MatrizPrincipal[x,y]:=0;
          //Se dibuja el contorno del vidrio y se reinicia el vidrio
end;  //  Fin del procedimiento de limpieza de cristales *
//  Procedimiento para crear las paredes
procedure paredes;
begin
   for x:=1 to 11 do
   begin
    for y:=1 to 11 do
    begin
      Recorrer:=MatrizPrincipal[x,y];
      Dibujar(x,y);    // Llamada al procedimiento k (x, y) - dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
    end;
   end;

end; // Fin del procedimiento para extraer todo el vaso
procedure restar_mov;
begin
  if (mod_mov=true) and (nro_mov>0) then    //si se presiona una tecla se resta un movimiento TIENE que estar modalidad movimientos activado
              begin
                 if nro_mov<=10 then // colocar texto en rojo cuando quedan 10 movimientos
                  begin
                  nro_mov:=nro_mov-1;
                  gotoxy(55,11);
                  writeln('                  '); // borrar movimientos anteriores
                  textcolor(red);
                  gotoxy(55,11);
                  writeln('movimientos ',nro_mov);
                  end
                 else
                 begin
                  nro_mov:=nro_mov-1;
                  gotoxy(55,11);
                  textcolor(yellow);
                  writeln('movimientos ',nro_mov);
                 end;
  end;
end;
// Procedimiento para controlar y mover figuras usando el teclado
procedure control;
var
i:integer;
key:char;
  begin
    for i:=1 to 10 do
       begin
        delay(velocidad);     // Retraso basado en datos de la variable d
        key:=' ';
        if keypressed then
           key:=readkey;

     if nro_mov>=0 then // si no se acabaron los movimientos hacer
      begin
       if (key='a') OR (key='A') then                    // Si se presiona la tecla a, entonces izquierda <=== [a]
       begin

          restar_mov; // si se presiona la tecla se resta un movimiento
          Figura(x-1,y,NumFig,3);
          if Tope_Matriz=0 then
          begin
                Figura(x,y,NumFig,0);
                x:=x-1;
                Figura(x,y,NumFig,1);
          end;
       end;
       if (key='d') OR (key='D') then                    // Si se presiona la tecla d, entonces derecha    ===> [d]
        begin

          restar_mov; // si se presiona la tecla se resta un movimiento

          Figura(x+1,y,NumFig,3);
          if Tope_Matriz=0 then
           begin
             Figura(x,y,NumFig,0);
             x:=x+1;
             Figura(x,y,NumFig,1);
           end;
        end;
        if (key='s') OR (key='S') then
        begin
          restar_mov; // si se presiona la tecla se resta un movimiento
          velocidad:=1;  // Si se presiona la tecla s, la figura vuela hacia abajo = [s] =
        end;
        if (nro_mov<2) and (mod_mov=true) then // si queda menos de un movimiento se acelera el juego
        velocidad:=1;
       if nro_mov=0 then // si es ultimo movimiento restar para que no vuelva a entrar a el ciclo
       nro_mov:=nro_mov-1;

      end;
    end;
   // Fin del procedimiento para controlar y mover figuras usando el teclado
end;
// Procedimiento para crear una nueva forma actual y siguiente
procedure nuevafigura;
var FiguraActual,FiguraNext:integer;
frase:string;
begin
  FiguraNext:=rango_azar[Contador_Figuras+2]; // Definir la siguiente forma

  FiguraActual:=rango_azar[Contador_Figuras+1]; // Definir la forma actual numero al azar



   case FiguraActual of
    1:frase:=' En todo amar y servir ';
    2:frase:=' Dile NO a las drogas! ';
    3:frase:=' No contamines tu pais ';
    4:frase:=' Siembra una semilla ! ';
   end;

   gotoxy(20,2);write('         ',chr(92),chr(179),chr(186),'/');// \|||/
   gotoxy(20,3);write('         (O O)');
   gotoxy(20,4);write(chr(201),'======ooO-(_)-Ooo======',chr(187));
   gotoxy(20,5);write('                      '); // limpiar frase anterior
   gotoxy(20,5);write(chr(03),frase,chr(03)); // frase
   gotoxy(20,6);write(chr(200),'=======================',chr(188));


  NumFig:=FiguraActual;

                        gotoxy(55,10); writeln('               ');  // Borra la línea de puntos
                        gotoxy(55,10); writeln('Puntos: ', Puntos);    // Puntos por el éxito en el juego
                        gotoxy(55,12); writeln('Nombre: ',Upcase(dato.alias));
                        gotoxy(55,13); writeln('Origen: (',Upcase(dato.abreviatura),')');

                        gotoxy(55,2); writeln('RECORD: ',dato.score);
                        gotoxy(55,3); writeln('PROXIMA FIGURA ');    // Información sobre la siguiente forma
                        gotoxy(56,4); writeln('               ');    // Espacios, 15 piezas cada uno, para borrar los rastros de mostrar la siguiente figura del movimiento anterior
                        gotoxy(56,5); writeln('               ');      //
                        gotoxy(56,6); writeln('               ');      //
                        gotoxy(56,7); writeln('               ');      //
                        gotoxy(56,8); writeln('               ');      //
                        gotoxy(56,9); writeln('               ');      //
                        Figura(20,17,FiguraNext,1); // Dibuja una figura, que saldrá de la siguiente 20 = coordenada x, 17 = coordenada y, NextFigure = nn valor, 1 = [] de qué elemento se dibuja la figura



  textcolor(LightCyan);
  gotoxy(20,24);
  writeln('COLOCA LA BASURA EN SU LUGAR :)');
  textcolor(white);
end; // Fin del procedimiento para crear una nueva forma actual y siguiente
procedure ordenaarchivos;
  var
    da, tempo : RegJugadores;
    i, t : longint;
  begin

  {$I-} reset(jugadores); {$I+}
   if ioresult <> 0 then
   begin
       writeln('  Error de archivo pulse [Enter]');
       readln;
       exit;
   end
 else
    begin
     for i := 0 to filesize(jugadores) - 1 do
     begin
         seek(jugadores,i);
         read(jugadores,dato);
         for t := filesize(jugadores) - 1 downto i + 1 do
         begin
            seek(jugadores,t);
            read(jugadores,da);
            if dato.score<da.score then
            begin
               tempo := dato;
               dato := da;
               da := tempo;
               seek(jugadores,i);
               write(jugadores,dato);
               seek(jugadores,t);
               write(jugadores,da);
            end;
         end;
      end;
        close(jugadores);
    end;
  end;
procedure presentaordenados;
    var
       d : longint;
    begin
    {$I-} reset(jugadores); {$I+}
     if ioresult <> 0 then
     begin
       writeln('  Error de archivo pulse [Enter]');
       readln;
       exit;
     end
   else
      begin
         writeln('*** Datos Del Archivo ***');
         writeln;
         writeln(' Nombre               Puntaje          Estado');
         for d := 0 to filesize(jugadores) - 1 do
         begin
            seek(jugadores,d);
            read(jugadores,dato);
            gotoxy(3,4 + d);write(dato.Alias);
            gotoxy(25,4 + d);write(dato.score);
            gotoxy(41,4 + d);write(dato.abreviatura);
         end;
         close(jugadores);
      end;
      readln;
end;
procedure Top5;
  VAR
     k:longint;
  begin
  {$I-} reset(jugadores); {$I+}
   if ioresult <> 0 then
   begin
     writeln('  Error de archivo pulse [Enter]');
     readln;
     exit;
   end
 else
   begin
      veldak:=false;
      if filesize(jugadores)>=5 then
       begin
       For k:=1 to 5 do
        begin
          seek(jugadores,k-1);
          read(jugadores,dato);
          orden[k].nombre:= dato.nombre;
          orden[k].ID:= dato.ID;
          orden[k].Alias:= dato.Alias;
          orden[k].score:=dato.score;
          orden[k].abreviatura:=dato.abreviatura;
         end;
       close(jugadores)
       end
        else
         begin
           veldak:=true;
           writeln('EL ARCHIVO NO CONTIENE 5 JUGADORES PRESIONE [ENTER]');
         end;
   end;
   assign(reporte,ubicacion2);
   rewrite(reporte);
   write(reporte,orden);
   close(reporte);
  end;
procedure VisualizarTop5;
var
   M:integer;
begin

  {$I-} reset(jugadores); {$I+}
   if ioresult <> 0 then
   begin
     writeln('  Error de archivo pulse [Enter]');
     readln;
     exit;
   end
 else
 begin
    ordenaarchivos;
    Top5;
    if veldak=True then
     begin
     end
       else
         begin
       writeln('*** TOP 5 ***');
       writeln;
       writeln(' Nombre               Numero          Estado');
         For M:=1 to 5 do
          begin
          gotoxy(3,4 + M);write(orden[M].alias);
          gotoxy(25,4 + M);write(orden[M].score);
          gotoxy(39,4 + M);write(orden[M].abreviatura);
          end;
         end;
       readln;
     end;
  end;
procedure CalculoPuntaje;
begin
for y:=11 downto 2 do // Comprobando filas llenas
         begin // Comienza a verificar las filas llenas
          fila:=0;

          for x:=2 to 11 do
           begin
              if MatrizPrincipal[x,y]>0 then // si hay un elemento aumenta en +1
               fila:=fila+1;
           end;
          If fila=10 then // Si la suma de las celdas es 10, entonces la fila está llena, la matriz se movera hacia abajo
           begin // Comienza a cambiar la matriz
            contador:=0;
            linea:=linea+1; // lineas completadas , por cada linea se acelera el juego
            SumaP:=0; // Reiniciar suma
             for b:=y to 11 do
               for c:=1 to 11 do
                begin
                contador:=contador+1;
                 if contador<=10 then
                     SumaP:=SumaP+MatrizPrincipal[c,b];

                 MatrizPrincipal[c, b]:=MatrizPrincipal[c, b + 1]; // Desplaza la matriz hacia abajo
                end;
              Puntos:=Puntos+100*(SumaP-pared); // puntos actual + lo calculado -9 que es una columna de la pared

           end; // Fin del cambio de matriz
         end; // Fin de la comprobación de filas llenas
end;
procedure iniciar;
var
   long1, long2 : longint;
   enco,perdiste : boolean;
begin
           Repeat
           //INICIALIZAR

            nro_mov:=1;
            mod_mov:=false;
            tiempo:=false;
            minutos:=0;
            Puntos:=0;
            SumaP:=0;
            linea:=0;  //Lineas completadas
            long2 := 0;
            long1:=0;
            enco:=false;
            perdiste:=false;

                  reset(jugadores);
                  while not eof(jugadores) and not enco do
                    begin
                     long1:=long1+1;
                     read(Jugadores,dato);
                       if auxNombre =dato.Alias  then
                         begin
                         enco := true;
                         long2 := long1-1;
                        end;
                  end;

            // FIN INICIALIZAR

            Clrscr;                   // pantalla limpia

            escoger; // escoger figura

            modalidad; // escoger modalidad de juego

            cargando; // cargando partida

            randomize; // Encender el generador de números aleatorios  por cada iteración
             for i:=1 to 1000 do
               rango_azar[i]:=(1+ random(4));  // Crea una secuencia aleatoria, casi infinita para determinar la forma actual y la siguiente


            clrscr;    // Limpia la pantalla de la pantalla de bienvenida

             textcolor(Yellow);                       // La línea superior izquierda, preguntando "¿cómo jugar?"
             gotoxy(01,10);
             Writeln('    Controles ');
             Writeln;
             Writeln('  <A> izquierda');
             Writeln('  <D> Derecha');
             Writeln('  <S> Abajo');

            limpiar; // Procedimiento para poner a cero los espacios vacios de la matriz
            paredes; // Procedimiento para dibujar las paredes

             repeat // ¡Empieza a repetir el bucle principal del juego! Siempre que haya un espacio vacío en el campo para el movimiento y la aparición de nuevas piezas.

              nuevafigura; // Aquí se sabrá qué forma será la próxima y actual

                // Coordenadas de la aparicion de la nueva forma
                 if NumFig=8 then // si es la figura ocho, movemos su coordenada de aparicion un poco mas abajo
                   y:=9
                    else
                     y:= 11;

              x:= 6;
              Figura(x, y, NumFig, 3);
              velocidad:= 80-(linea * 3); //  velocidad del juego


                 { textcolor(white); // Para Visualizar en tiempo real los numeros de las figuras
                    cont:=0;
                    for i:=11 downto 1 do
                      begin
                        for j:=1 to 11 do
                          begin
                           cont:=cont+1;
                           write(st[j,i]);
                            if cont=11 then
                               begin
                                writeln;
                                cont:=0;
                               end;
                          end;
                    end; }

               if Tope_Matriz = 0 then // Si la celda está vacía y no hay colisión con el vidrio y los ladrillos colocados anteriormente en el vidrio
                begin // then
                 Repeat // repetir hasta colisión
                  Figura(x, y, NumFig, 1); // La figura actual se dibuja antes del movimiento, 1 = [] de qué elemento se dibuja la figura
                  control; // Llamar al procedimiento para el control de movimientos

                  if (tiempo=true) then // si funcion tiempo esta activado hacer
                   begin
                    //Mostrar tiempo en pantalla
                    textcolor(yellow);
                    if segundos>=0 then
                     begin
                      gotoxy(55,19);
                      write('             ');
                      gotoxy(55,19);
                      write(minutos,':',segundos);
                     end;


                     segundos:=segundos-1;

                     if segundos=-1 then
                      begin
                      perdiste:=true;
                         textcolor(12); // al acabarse el tiempo muestra mensaje en pantalla
                         gotoxy(55,16);
                         write('Se te acabo tu tiempo !');
                      end;

                     if (segundos=0) and (minutos>0) then  // si segundos llega a cero reiniciar tiempo
                      begin
                      segundos:=59;

                      if (minutos>0) then
                      minutos:=minutos-1;

                      end;
                   end;

                   Figura(x, y-1, NumFig, 3); // Dibuja una figura con un desplazamiento a lo largo del eje Y, siempre que ss = 3 y el índice de matriz no sea un espacio vacío (el borde del vidrio o el borde de las figuras), luego asigna pus = 1 y evita que la figura caiga un elemento antes del borde del vidrio
                    if Tope_Matriz = 0 then
                      begin
                       Figura(x, y, NumFig, 0);  // borra el rastro que deja la figura
                       y:= y-1;
                      end; // Se extrae una cifra de los elementos del campo de libro de pedidos vacío '. '
                until Tope_Matriz = 1; // Ocurrió una colisión

                Figura(x, y, NumFig, 4); // !!!!! Dibuja la figura actual que no se puede mover y escribe su posición en la matriz de elementos del libro de pedidos st []

                Contador_Figuras:=Contador_Figuras + 1; // Contador de cifras para depuración


                CalculoPuntaje;

                paredes; // Procedimiento para dibujar elementos de toda la cartera de pedidos
                Tope_Matriz:=0;
                end;


                  //Acabar por movimientos o tiempo
                if (nro_mov<1) or (minutos<0) then  // si se acaban los movimientos se termina el juego
                begin
                 perdiste:=true;
                  if mod_mov=true then
                    begin
                    textcolor(12); // color rojo
                    gotoxy(55,11);
                    writeln('                   '); // borrar mensaje anterior
                    gotoxy(55,11);
                   writeln('Sin Movimientos !');
                   end;
                end;
               until (Tope_Matriz = 1) OR (perdiste=true); // ¡Deja de repetir el ciclo principal del juego! Porque no hay espacio vacío.

              textcolor(11); //color azul
              gotoxy(55,15);
              writeln ('JUEGO CONCLUIDO!'); // Escribir "Fin del juego"



             // observar matriz con los numeros al finalizar juego
             contador:=0;
             for i:=11 downto 1 do
              begin
                 for j:=1 to 11 do
                  begin
                   contador:=contador+1;
                   write(MatrizPrincipal[j,i]);
                     if contador=11 then
                      begin
                      writeln;
                      contador:=0;
                      end;
                  end;
             end;

            repeat
            gotoxy(55,17);
            writeln('Deseas Continuar jugando? ');
            gotoxy(55,18);
            writeln('SI   [1]');
            gotoxy(55,19);
            writeln('NO   [2]');
            gotoxy(55,20);
            write('>>');
            gotoxy(57,20);
            readln(eleccion);
            gotoxy(57,20);
            write('     '); // si escoge opcion ivalida borra numero ingresado
                   if puntos>dato.score then
                     begin
                       if enco = true then
                        begin
                        dato.score:=puntos;
                        seek(jugadores,long2);
                        write(Jugadores,dato);
                        end;
                     end;
             until (eleccion=1) or (eleccion=2); // repetir hasta escoger opcion valida(numeros)

            until eleccion=2; // acabar ciclo si escoge que no desea continuar jugando
      close(Jugadores);
end;

procedure portada;
 begin
  TextColor(White);      // Establecer las letras en blanco

  GotoXY(39,3);  write('(c) COPYRIGHT Derechos Reservados');

  GotoXY(15,5);  write('[][][] [][][] [][][] [][][]     []   []    []');
  GotoXY(15,6);  write('  []   []       []   []   []    []    []  []');
  GotoXY(15,7);  write('  []   [][][]   []   [][][]     []      []');
  GotoXY(15,8);  write('  []   []       []   []    []   []    []  []');
  GotoXY(15,9);  write('  []   [][][]   []   []      [] []  []      []');

  GotoXY(8,14); write('CUIDA TU AMBIENTE :D');


  GotoXY(22,19); write('PROYECTO UCAB 2021');

  GotoXY(10,20); write('>> Presiona cualquier tecla para continuar! <<');

  ReadKey;                   // ¡Espere a que se presione cualquier tecla!}

  clrscr;// borrar pantalla
 end;
procedure Menu;
    var
      tec : char;
    begin
    jugar:=true;
    datosCorrectos:=false;
    repeat
        clrscr;
        writeln('**** Menu Principal ****');
        writeln;
        writeln('  1 : Registro De Usuario');
        writeln('  2 : Inicio de sesion ');
        writeln('  3 : Ver Archivos');
        writeln('  4 : TOP 5');
        writeln('  5 : JUGAR TETRIS');
        writeln('  6 : SALIR ');
        writeln;
        writeln('<<<< Elija Opcion >>>>');
        repeat
           tec := readkey;
        until tec in['1','2','3','4','5','6'];
        clrscr;
     case tec of
       '1' : EntradaDeDatos;
       '2' : InicioDeSesion(datosCorrectos);
       '3' : presentaordenados;
       '4' : VisualizarTop5;
       '5' : begin
               if (datosCorrectos=true) then
                 begin
                  if jugar=True then
                   begin
                   iniciar;
                   end;
                end
                  else
                    begin
                     writeln(' USTED NO HA INICIADO SESION PRESIONE [ENTER]');
                     readln;
                end;
            end;
       '6' : jugar:=false;
      end;

     until tec ='6';
    end;
// INICIAR PROGRAMA PRINCIPAL
begin
     auxNombre:='';
     auxEstado:='';
     assign(jugadores,ubicacion);
      {$I-} reset(jugadores); {$I+}   {abro el archivo}
       if ioresult <> 0 then  {en caso de que el archivo no exista crea uno}
        begin
         rewrite(jugadores);
        end;
     TextBackground(Blue); // colocar todo en fondo azul
     portada; // portada del proyecto
     Menu;{Menu antes de comenzar a jugar}
     writeln('FIN DEL PROGRAMA PRESIONE [ENTER]');
     readln;

End.

