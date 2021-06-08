use strict;
use warnings FATAL => 'all';



sub convertir{
    my ($letra)=shift@_;
    my $codigoLetraInicial=shift@_;
    my $codigoLetraFinal=shift@_;
    my $codAsciiLetra=ord($letra);
    my $codAsciiLetraConv=0;
    if(($codAsciiLetra+13)>$codigoLetraFinal) {
        $codAsciiLetraConv = $codigoLetraInicial + ($codAsciiLetra + 12 - $codigoLetraFinal)
    }
    else{
        $codAsciiLetraConv = $codAsciiLetra + 13;
    }
    return(chr($codAsciiLetraConv));
}

sub esMayuscula{
    my($letra)=shift@_;
    return(64<ord($letra)and ord($letra)<91);
}
sub esMinuscula{
    my($letra)=shift@_;
    return(96<ord($letra)and ord($letra)<123);
}
sub convertirLetra{
    my($letra)=shift@_;
    if(esMayuscula($letra)){
        convertir($letra,65,90);
    }
    else{
    convertir($letra,97,122);
    }

}



sub convertirTexto {
    my($texto)=shift@_;
    my $cadenaProcesada = "";
    for (1 .. length($texto)) {
        my $letraAEncriptar = chop($texto);

        if (esMayuscula($letraAEncriptar) or esMinuscula($letraAEncriptar)) {
            $cadenaProcesada = convertirLetra($letraAEncriptar) . $cadenaProcesada;
        }
        else {
            $cadenaProcesada = $letraAEncriptar . $cadenaProcesada;
        }

    }
    return $cadenaProcesada;
}
sub chopN{
    my($numero)=shift @_;
    my($n)=shift @_;
    my$numAux=$numero;
    for(1..$n){
        chop($numAux);
    }
    return $numAux;
}

##si el texto finaliza con 3 $$$ el texto esta encriptado
sub estaEncriptado{
    my($texto)=shift@_;
    my($textoAux)=$texto;


    return(ord(chop($textoAux))==27  )
}
sub encriptar{
    my($textoSubido)=shift@_;
    my $textoEncriptado='';
    if(estaEncriptado($textoSubido)){
       print("No se puede encriptar un texto ya encriptado");
        $textoEncriptado=$textoSubido;
    }
    else{
        $textoEncriptado=convertirTexto($textoSubido).$textoEncriptado;
        print("Texto encriptado");
    }
    return $textoEncriptado;
}
sub desencriptar {
    my ($textoSubido) = shift @_;
    my $textoDesencriptado = '';
    if (estaEncriptado($textoSubido)) {
        chop($textoSubido);
        $textoDesencriptado = convertirTexto($textoSubido);
        print("Texto desencriptado");

    }
    else {
        print("No se puede Desencriptar un texto ya Desencriptado");
        $textoDesencriptado = $textoSubido;
    }
    return $textoDesencriptado;

}
sub leerTexto{
    my($documento)=shift@_;
    my $resultado='';
    while ( $resultado = <$documento>) {
        chomp $resultado;
        print($resultado);
    }

    return $resultado
}
  sub encriptarODesencriptar{
     my($urlTexto)=shift@_;
      my($encriptar)=shift@_;
      open( my $documento,'<',"pepe.txt");
      my $textoACifrar=<$documento>;
      close($documento);
      if($encriptar){
          $textoACifrar=encriptar($textoACifrar)

      }
     else{
          $textoACifrar=desencriptar($textoACifrar)
      }
      open( my$textoParaActualizar,'>',"pepe.txt");
      print $textoParaActualizar $textoACifrar;
      close($textoParaActualizar);
  }




print("Usted podra notar en su documento si esta encriptado o sin encriptar. Solo debe
observar la finalizacion de su texto, si este contiene un simbolo raro similar a este  es porque su texto
esta encriptado, utilice el desencriptador para desencriptar su documentacion valiosa. En el caso que desee encriptar,
podra utilizar el encriptador para resguardar su informacion. En el menu de opciones le indicara los pasos a seguir para utilizar
este script.\n");
print("seleccione nombre de la ruta a encriptar\n");
my $ruta=<STDIN>;
print("\nIngrese 1 si quiere encriptar o 0 si quiere desencriptar \n");
my $quiereEncriptar=<STDIN>;
print("\n");
encriptarODesencriptar($ruta,int($quiereEncriptar));





