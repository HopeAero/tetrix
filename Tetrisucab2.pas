program Tetrisucab2;
uses crt;

var ss,nn,x,y,pus,a,b,c,d,lin:integer;

st:array[1..12,1..22] of integer;            (*Declaramos una matriz del campo de juego 12x22[12x22]*)

randmas:array[1..1000] of integer;         // Declaramos una matriz aleatoria de rand para crear una secuencia numérica de la apariencia de las formas, para determinar la siguiente forma.

  Contador_Figuras:integer;                     // Declarar el contador de las figuras caídas
              // Declara variables para mostrar información sobre la siguiente forma actual y nueva
  Puntos:integer;                             // Declara una variable para guardar el resultado del juego (puntos del juego)
  i:integer;                   // Declara un contador de bucles en el cuerpo principal del programa
  var fig1,fig2,fig3,fig4,fig5,fig6,fig7,fig8:boolean;
  eleccion,terminar:integer;

  var nro_mov:integer; // numero de movimientos
  mod_mov:boolean;
 procedure portada;
 begin
  TextColor(White);      // Establecer las letras en blanco
  TextBackGround(Blue);           // Establecer el color de fondo de las letras en azul
  GotoXY(8,14); writeln('CUIDA TU AMBIENTE');
  TextColor(White);
  GotoXY(15,5);  writeln('[][][] [][][] [][][] [][][]     []   []    []');
  GotoXY(15,6);  writeln('  []   []       []   []   []    []    []  []');
  GotoXY(15,7);  writeln('  []   [][][]   []   [][][]     []      []');
  GotoXY(15,8);  writeln('  []   []       []   []    []   []    []  []');
  GotoXY(15,9);  writeln('  []   [][][]   []   []      [] []  []      []');

  GotoXY(39,3);TextBackGround(Red);   write('(c) COPYRIGHT XD');
  GotoXY(22,19);TextBackGround(Red);  write('PROYECTO UCAB 2020');
  TextBackground(Blue); TextBackGround(Blue); TextColor(White);

  ReadKey;                   // ¡Espere a que se presione cualquier tecla!}

  clrscr;// borrar pantalla
 end;

 procedure escoger;

  begin

    fig1:=false;
    fig2:=false;
    fig3:=false;
    fig4:=false;
    fig5:=false;
    fig6:=false;
    fig7:=false;
    fig8:=false;

    terminar:=0;
    repeat
      terminar:=terminar+1;


        if fig1=false then
         begin
          gotoxy(1,2); write('[][][]');
          gotoxy(1,8); write('  1');
         end;

      if fig2=false then
      begin
        gotoxy(10,2); write('[]');
        gotoxy(10,3); write('[]');
        gotoxy(10,4); write('[]');
        gotoxy(10,8); write(' 2');
      end;

      if fig3=false then
       begin
        gotoxy(20,2); write('[]');
        gotoxy(20,3); write('[]');
        gotoxy(20,4); write('[][]');
        gotoxy(20,8); write('   3');
       end;


      if fig4=false then
       begin
        gotoxy(30,2); write('  []');
        gotoxy(30,3); write('  []');
        gotoxy(30,4); write('[][]');
        gotoxy(30,8); write('   4');
       end;

      if fig5=false then
       begin
        gotoxy(40,2); write('[][]');
        gotoxy(40,3); write('[]');
        gotoxy(40,4); write('[]');
        gotoxy(40,8); write(' 5');
       end;

      if fig6=false then
        begin
          gotoxy(50,2); write(' [][]');
          gotoxy(50,3); write('   []');
          gotoxy(50,4); write('   []');
          gotoxy(50,8); write('   6');
        end;

      if fig7=false then
        begin
          gotoxy(60,2); write('[][][]');
          gotoxy(60,3); write('  [] ');
          gotoxy(60,4); write('  [] ');
          gotoxy(60,8); write('   7 ');
        end;


      if fig8=false then
        begin
          gotoxy(70,2);write('  []  ');
          gotoxy(70,3);write('  []  ');
          gotoxy(70,4);write('[][][]');
          gotoxy(70,8);write('  8');
        end;

        gotoxy(30,14);writeln('Puedes escoger solo 4 figuras!');
        gotoxy(30,15);writeln('>> Selecciona una figura!');

        write('>> ');

        readln(eleccion);
        clrscr; // borrar pantalla
        case eleccion of

         1:begin
              if fig1=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig1:=true;
            end;

         2:begin
              if fig2=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig2:=true;
            end;
         3:begin
              if fig3=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig3:=true;
            end;
         4:begin
              if fig4=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig4:=true;
            end;
         5:begin
              if fig5=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig5:=true;
            end;
         6:begin
              if fig6=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig6:=true;
            end;
         7:begin
              if fig7=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig7:=true;
            end;
         8:begin
              if fig8=true then
              begin
                   gotoxy(30,18);
                   Textcolor(12);
                   writeln('>> Ya escogiste esta figura!');
                   terminar:=terminar-1;
              end
              else
                  fig8:=true;
             end
         else
           begin
            gotoxy(26,18);
            Textcolor(12);
            writeln('>> Escoge una figura valida! <<');
            terminar:=terminar-1;
          end;
        end;

        gotoxy(1,18);
        writeln('Figuras Seleccionadas >>');

        if fig1=true then
        begin
        Textcolor(10);
        gotoxy(1,20); write('[][][]');
        gotoxy(1,24); write('  1');
        textcolor(white);
        end;

      if fig2=true then
      begin
        Textcolor(10);
        gotoxy(10,20); write('[]');
        gotoxy(10,21); write('[]');
        gotoxy(10,22); write('[]');
        gotoxy(10,24); write(' 2');
        textcolor(white);
        end;

      if fig3=true then
      begin
        Textcolor(10);
        gotoxy(20,20); write('[]');
        gotoxy(20,21); write('[]');
        gotoxy(20,22); write('[][]');
        gotoxy(20,24); write('   3');
        textcolor(white);
        end;


      if fig4=true then
      begin
        Textcolor(10);
        gotoxy(30,20); write('  []');
        gotoxy(30,21); write('  []');
        gotoxy(30,22); write('[][]');
        gotoxy(30,24); write('   4');
        textcolor(white);
      end;

      if fig5=true then
      begin
        Textcolor(10);
        gotoxy(40,20); write('[][]');
        gotoxy(40,21); write('[]');
        gotoxy(40,22); write('[]');
        gotoxy(40,24); write(' 5');
        textcolor(white);
      end;

      if fig6=true then
      begin
        Textcolor(10);
        gotoxy(50,20); write(' [][]');
        gotoxy(50,21); write('   []');
        gotoxy(50,22); write('   []');
        gotoxy(50,24); write('   6');
        textcolor(white);
      end;

      if fig7=true then
      begin
        Textcolor(10);
        gotoxy(60,20); write('[][][]');
        gotoxy(60,21); write('  [] ');
        gotoxy(60,22); write('  [] ');
        gotoxy(60,24); write('   7 ');
        textcolor(white);
      end;


      if fig8=true then
      begin
        Textcolor(10);
        gotoxy(70,20);write('  []  ');
        gotoxy(70,21);write('  []  ');
        gotoxy(70,22);write('[][][]');
        gotoxy(70,24);write('  8');
        writeln;
      end;

   until terminar=4;
  end;

  // Procedimiento para dibujar celdas de campo
procedure k(x,y:integer);                 // Procedimiento k (x, y): dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
begin
  gotoxy(x*2+20,23-y);                      // Coloque el cursor de texto en la línea (X * 2 + 30) por X y (24-Y) la posición inicial del vaso
  if ss=0 then write('. ');                 // Si ss = 0, se muestran dos símbolos con un fondo vacío entre comillas '. 'Para borrar los rastros del movimiento de la figura a través de la pantalla.
  if ss=1 then write('[]');                 // ss = 1 entonces se emite el bloque de figuras de Tetris, a partir de dos caracteres entre comillas '[]'
  if ss=2 then
  begin
    textcolor(LightCyan);
    write(chr(124),chr(124));
    textcolor (white);
  end;    // ss = 2 then los caracteres de ASCII # 124 se generan para dibujar los bordes de las paredes Tetris '||'
  if (ss=3) and (st[x,y]>0) then
   pus:=1;    // ss = 3 y el índice de matriz no es un espacio vacío (el borde de vidrio o el borde de las figuras), luego asigne pus = 1

  if ss=4 then
   st[x,y]:=1;            // ss = 4 luego escribe 1 en el arreglo del libro de pedidos st: arreglo [1..12,1..22]                   //

end;  // Fin del procedimiento para dibujar celdas k (x, y)

// procediemiento para dibujar formas
procedure fig(x,y,n,s:integer); // El procedimiento fig (x, y, n, s) almacena información sobre los tipos de figuras de Tetris
begin

    if s=3 then pus:=0;                    // Si s = 3 entonces haz pus = 0
    ss:=s; k(x,y);                    // Haga ss = sy llame al procedimiento k (x, y)

    if (fig1=true) and (n=1) then
     begin
          TextColor(10);
          k(x-1,y);
          k(x+1,y);
          k(x+2,y);       // Patrón de forma 2    (n=2)
    end                  //   [][][][]
    else if (fig2=true) and (n=2) then
    begin
      TextColor(yellow);
      k(x,y+1);
      k(x,y-1);
      k(x,y-2);       // Patrón de forma 3    (n=3)
      //   []
      //   []
      //   []
      //   []
    end
    else if (fig3=true) and (n=3) then
    begin
      Textcolor(12);
      k(x,y+1);
      k(x,y-1);
      k(x+1,y-1);      // Plantilla de forma 9    (n=9)
      //   []
      //   []
      //   [][]
    end
    else if (fig4=true) and (n=4) then
    begin
      Textcolor(13);
      k(x,y+1);
      k(x,y-1);
      k(x-1,y-1);       // Plantilla de forma 7    (n=7)
      //     []
      //     []
      //   [][]
    end
    else if (fig5=true) and (n=1) then
    begin

      Textcolor(10);
      k(x,y+1);
      k(x+1,y+1);
      k(x,y-1);     // Plantilla de forma 5 (n = 5)
      //   [][]
      //   []
      //   []
    end
    else if (fig6=true) and (n=2) then
    begin
      Textcolor(yellow);
      k(x,y+1);
      k(x,y-1);
      k(x-1,y+1);      // Plantilla de forma 11   (n=11)
      //   [][]
      //     []
      //     []
    end
    else if (fig7=true) and (n=3) then
    begin
      Textcolor(12);
      k(x,y-1);
      k(x-1,y);
      k(x+1,y);        // Plantilla de forma 18   (n=18)
      //   [][][]
      //     []
    end
    else if (fig8=true) and (n=4) then
    begin
      Textcolor(13);
      k(x+1,y);
      k(x-1,y);
      k(x,y+1);       // Plantilla de forma 16   (n=16)
      //     []
      //   [][][]
    end;
  end;  //  Fin del procedimiento de dibujo de figuras


//  Procedimiento de rotación de forma
procedure rotacion; // cambiar
begin
  nn:=nn-1;
  if nn=15 then nn:=19;
  if nn=13 then nn:=15;
  if nn=11 then nn:=13;
  if nn=7 then nn:=11;
  if nn=3 then nn:=7;
  if nn=1 then nn:=3;
  if nn=0 then nn:=1;
end;  // Fin del procedimiento de rotación de formas

//  Procedimiento de limpieza
procedure limpiar;
begin
for x:=1 to 12 do
 for y:=1 to 22 do
     if (x=1) or (x=12) or (y=1) then
      st[x,y]:=2
        else
          st[x,y]:=0;
        //Se dibuja el contorno del vidrio y se reinicia el vidrio
end;  //  Fin del procedimiento de limpieza de cristales *

//  Procedimiento para crear las paredes
procedure paredes;
begin
   for x:=1 to 12 do  for y:=1 to 22 do
    begin
      ss:=st[x,y];
      k(x,y);    // Llamada al procedimiento k (x, y) - dibuja una parte de una figura, una parte de una valla de vidrio en una determinada coordenada de la pantalla de texto
    end;
end; // Fin del procedimiento para extraer todo el vaso

// Procedimiento para controlar y mover figuras usando el teclado
procedure control;
var
i:integer;
key:char;
  begin
    for i:=1 to 10 do
       begin
        delay(d);     // Retraso basado en datos de la variable d
        key:=' ';
        if keypressed then
        begin
           key:=readkey;
           if (mod_mov=true) and (nro_mov>0) then    //si se presiona una tecla se resta un movimiento TIENE que estar modalidad movimientos activado
            begin
               if nro_mov<=10 then // colocar texto en rojo cuando quedan 10 movimientos
                begin
                nro_mov:=nro_mov-1;
                gotoxy(55,11);
                writeln('                  '); // borrar movimientos anteriores
                textcolor(12); // color rojo
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

        if nro_mov>=0 then // si no se acabaron los movimientos hacer
      begin
           if key='a' then                    // Si se presiona la tecla a, entonces izquierda <=== [a]
        begin


          fig(x-1,y,nn,3);
          if pus=0 then
           begin
                fig(x,y,nn,0);
                x:=x-1;
                fig(x,y,nn,1);
           end;
        end;


        if key='d' then                    // Si se presiona la tecla d, entonces derecha    ===> [d]
        begin


          fig(x+1,y,nn,3);
          if pus=0 then
           begin
             fig(x,y,nn,0);
             x:=x+1;
             fig(x,y,nn,1);
           end;
        end;
        if key='w' then                    // Si se presiona la tecla w, then gire la figura = [w] =
        begin

          rotacion; fig(x,y,nn,3); rotacion;rotacion;rotacion;
            if pus=0 then
            begin
                 fig(x,y,nn,0);
                 rotacion;
                 fig(x,y,nn,1);
            end;
        end;
        if key='s' then
        begin

          d:=1;
                        // Si se presiona la tecla s, la figura vuela hacia abajo = [s] =
        end;
        if (nro_mov<2) and (mod_mov=true) then // si queda menos de un movimiento se acelera el juego
        d:=1;
       if nro_mov=0 then // si es ultimo movimiento restar para que no vuelva a entrar a el ciclo
       nro_mov:=nro_mov-1;

      end;
    end;
   // Fin del procedimiento para controlar y mover figuras usando el teclado
   end;
// Procedimiento para crear una nueva forma actual y siguiente
procedure nuevafigura;
var FiguraActual,FiguraNext:integer;
begin
  FiguraNext:=randmas[Contador_Figuras+2]; // Definir la siguiente forma

  FiguraActual:=randmas[Contador_Figuras+1]; // Definir la forma actual

  gotoxy(55,10); writeln('               ');  // Borra la línea
  gotoxy(55,10); writeln('Puntos: ', Puntos);    // Puntos por el éxito en el juego
  gotoxy(55,12); writeln('nombre');
  gotoxy(55,13); writeln('ORIGEN (BOL)');
  gotoxy(61,15);        writeln('//');
  gotoxy(60,16);       writeln('//');
  gotoxy(60,17);      writeln('O');
  gotoxy(55,18); writeln('[][]   [][]');
  gotoxy(55,19); writeln(' []     [] ');
  gotoxy(55,20); writeln('[]   R   [] Recicla');
  gotoxy(55,21); writeln(' [][][][]  ');
  textcolor(11); //ecologico                      // La línea superior derecha con el nombre del juego = TETЯIS = Pascal = ABC = 2019 =
  gotoxy(20,24);
  Writeln('COLOCA LA BASURA EN SU LUGAR :)');
  textcolor(white);

  gotoxy(55,2); writeln('RECORD 1000');
  gotoxy(55,3); writeln('PROXIMA FIGURA ');    // Información sobre la siguiente forma
                        gotoxy(56,4); writeln('               ');    // Espacios, 15 piezas cada uno, para borrar los rastros de mostrar la siguiente figura del movimiento anterior
                        gotoxy(56,5); writeln('               ');      //
                        gotoxy(56,6); writeln('               ');      //
                        gotoxy(56,7); writeln('               ');      //
                        gotoxy(56,8); writeln('               ');      //
                        gotoxy(56,9); writeln('               ');      //
                        fig(20,17,FiguraNext,1); // Dibuja una figura, que saldrá de la siguiente 20 = coordenada x, 17 = coordenada y, NextFigure = nn valor, 1 = [] de qué elemento se dibuja la figura

  nn:=FiguraActual; // Dibuja la figura actual definida en la variable Figura actual
end; // Fin del procedimiento para crear una nueva forma actual y siguiente

 PROCEDURE cargando;
 var rodar:integer;
begin
  rodar:=0;

  for i:=1 to 350 do
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


procedure modalidad; //pedir // restar mov
begin
       clrscr;
       writeln('Que modalidad desea jugar?');
       writeln('>> Por Movimientos (1)');
       writeln('>> Modo normal (2)');
       readln(eleccion);

       case eleccion of
        1:
          begin
            mod_mov:=true;
            writeln('Por Cuantos Movimientos Desea Jugar?');
            readln(nro_mov);
          end;

       end;



end;

 // INICIAR PROGRAMA PRINCIPAL
begin
  nro_mov:=1;         // inicializar
  mod_mov:=false;   // inicializar
  TextBackground(Blue);   // Establecer el color de fondo azul
  Clrscr;                   // pantalla limpia

  portada;  // portada pricipal

  escoger; // escoger figura

  modalidad; // escoger modalidad de juego

  cargando; // cargando partida

  writeln;

  randomize; // Enciende el generador de números aleatorios  por cada iteración
    for i:=1 to 1000 do
     randmas[i]:=(1+ random(4));  // Crea una secuencia aleatoria, casi infinita para determinar la forma actual y la siguiente

  TextBackground(Blue); TextBackGround(Blue); TextColor(White);
  clrscr;    // Limpia la pantalla de rastros de la pantalla de bienvenida

  textcolor(Yellow);                       // La línea superior izquierda, preguntando "¿cómo jugar?"
  gotoxy(01,10);
  Writeln('    Controles ');
  Writeln;
  Writeln('  <A> izquierda');
  Writeln('  <D> Derecha');
  Writeln('  <S> Abajo');
  Writeln('  <W> Rotar Figura');





  limpiar; // Procedimiento para poner a cero la cartera de pedidos
  paredes; // Procedimiento para dibujar las paredes
  lin:=0; // Pon el contador de línea a cero, lo que afecta la velocidad del juego. está contenido en la variable d
  Puntos:=0; // Establecer cero puntos para comenzar un nuevo juego

  repeat // ¡Empieza a repetir el bucle principal del juego! Siempre que haya un espacio vacío en el campo para el movimiento y la aparición de nuevas piezas.

    nuevafigura; // Aquí se sabrá qué forma será la próxima y actual
    x:= 6; y:= 21; // ¡Aquí aparece una nueva forma! Preste atención a x = 6 por = 20 estas son las coordenadas de la apariencia de la nueva forma
    fig(x, y, nn, 3); // d afecta la velocidad del juego (el retraso predeterminado era d: = 70- (lin * 5);
    d:= 80- (lin * 3); // cuando d es 170 es muy lento, cuando es 10 es rápido!

    if pus = 0 then // Si la celda está vacía y no hay colisión con el vidrio y los ladrillos colocados anteriormente en el vidrio,
     begin // then
      Repeat // repetir hasta colisión
       fig(x, y, nn, 1); // La figura actual se dibuja antes del movimiento, 1 = [] de qué elemento se dibuja la figura
       control; // Llamar al procedimiento para el movimiento de la figura con la definición de la tecla presionada

        fig(x, y-1, nn, 3); // Dibuja una figura con un desplazamiento a lo largo del eje Y, siempre que ss = 3 y el índice de matriz no sea un espacio vacío (el borde del vidrio o el borde de las figuras), luego asigna pus = 1 y evita que la figura caiga un elemento antes del borde del vidrio
        if pus = 0 then
         begin
           fig(x, y, nn, 0);
           y:= y-1;
         end; // Se extrae una cifra de los elementos del campo de libro de pedidos vacío '. '
      until pus = 1; // Ocurrió una colisión

      fig(x, y, nn, 4); // !!!!! Dibuja la figura actual que no se puede mover y escribe su posición en la matriz de elementos del libro de pedidos st []

      Contador_Figuras:=Contador_Figuras + 1; // Contador de cifras para depuración
      Puntos:=Puntos + 100; // Suma 100 puntos a la puntuación por tocar la figura con el suelo

      for y:= 22 downto 2 do // Comprobando filas llenas
       begin // Comienza a verificar las filas llenas
        a:=0; for x:=2 to 11 do
         a:=a + st [x, y]; // Contador de figuras rellenas, comprueba la presencia de una celda de figura en la matriz y aumenta en 1 si hay un elemento de figura allí
        If a= 10 then // Si la suma de las celdas es 10, then la fila está llena, debe eliminarse, la matriz de elementos del libro de pedidos debe moverse hacia abajo
         begin // Comienza a cambiar la matriz
            for b:=y to 21 do
             for c:=2 to 11 do
              st[c, b]:=st[c, b + 1]; // Desplaza la matriz hacia abajo
            lin:=lin + 1; // Resume las líneas completamente llenas y acelera el juego
            gotoxy(55,12); Writeln('Lineas:', lin); // Muestra el número de líneas completamente llenas
            Puntos:=Puntos + 1000; // ¡Suma 1000 puntos a la puntuación de la línea completa!
         end; // Fin del cambio de matriz
       end; // Fin de la comprobación de filas llenas

     paredes; // Procedimiento para dibujar elementos de toda la cartera de pedidos
     pus:=0;
     end;

    if nro_mov<1 then  // si se acaban los movimientos se termina el juego
     pus:=1;

    until pus = 1; // ¡Deja de repetir el ciclo principal del juego! Porque no hay espacio vacío.
       gotoxy(4,2); Writeln ('JUEGO CONCLUIDO!'); // Escribe "Fin del juego"
       readkey;

End.
