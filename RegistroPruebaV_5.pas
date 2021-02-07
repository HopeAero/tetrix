program RegistroPruebaV_5;
uses crt;
type
  RegJugadores =record     {variables del registro de usuario}
    nombre:string[80];
    ID:integer;
    Alias:string[10];
    FechaDeNacimiento:string[12];
    password:string[6];
    score:integer;
    abreviatura:string[3];
    correo:string[40];
  end;
 Almacenado = file of RegJugadores;
 const
   ubicacion = ('C:\Users\david_000\Documents\Mis archivos recibidos\Jugadores.dat'); {ubicacion del archivo}

 var
   jugadores:almacenado;
   dato:RegJugadores;
   estado:integer;
   respuesta:char;


function Cifrado(texto:string):string;     {cifrado}
var
  i : SmallInt;
begin
  Cifrado:='';
  For i:=1 to length(texto) do
    Cifrado:=Cifrado+Chr((Ord(texto[i]))+2);
end;

function Descriptacion(texto:string):string; {Desencriptar}
var
  i: Smallint;
  begin
  Descriptacion:='';
    For i:=1 to length(texto) do
      Descriptacion:=descriptacion+chr((Ord(texto[i]))-2);
  end;

Function busqueda(aliass: string; var jugadores: Almacenado): Integer;
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

procedure EntradaDeDatos;
var nuevo:integer;
begin
  // Entrada de datos
  repeat
   writeln('******Entrada de datos******');
   writeln;
   write(' Nombre = ');
   readln(dato.nombre);
   write(' Alias = ');
   readln(dato.Alias);
     	{ VALIDACION DE ALIAS EN CASO DE QUE ESTE EN EL ARCHIVO }
	Nuevo:=busqueda(dato.alias, Jugadores);
        If (Nuevo < 0) then	{Si no existe...}
	  Begin
               write(' Clave de seguridad (maximo de 6) = ');
               readln(dato.password);
               write(' Correo electronico = ');
               readln(dato.correo);
               write(' Fecha de nacimiento = ');
               readln(dato.FechaDeNacimiento);
               writeln (' Estado de procedencia = ');

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
						Write('> SELECCIONE: ');
						Readln(estado);

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
procedure InicioDeSesion;
var
   verificador:boolean;
   Usuario,clave:string;
   peso:integer;
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
                               Writeln('Ha iniciado sesion correctamente pulse [Enter]');
                               readln;
                               verificador:=true;
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
 end;
procedure menu;
  var
    tec : char;
  begin
  repeat
      clrscr;
      writeln('**** Menu Principal ****');
      writeln;
      writeln('  1 : Registro De Usuario');
      writeln('  2 : Inicio de sesion ');
      writeln('  3 : Ver Archivos');
      writeln('  4 : Salir');
      writeln;
      writeln('<<<< Elija Opcion >>>>');
      repeat
         tec := readkey;
      until tec in['1','2','3','4'];
      clrscr;
   case tec of
 '1' : EntradaDeDatos;
 '2' : InicioDeSesion;
 '3' : presentaordenados;
   end;
   until tec = '4';
  end;
begin
   assign(jugadores,ubicacion);
   {$I-} reset(jugadores); {$I+}   {abro el archivo}
    if ioresult <> 0 then  {en caso de que el archivo no exista crea uno}
     begin
      rewrite(jugadores);
     end;
  menu;
end.  
