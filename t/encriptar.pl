use strict;
use warnings FATAL => 'all';


# open(my $archivo,'>',"pepe.txt");
# my $contenido=<STDIN>;
# print $archivo $contenido;
# close( $archivo);
my $texto= "Hola como estas";
my $textoEncriptado="";
my $letraAEncriptar="";
# print(ord(4));
# print(chr(52));
#     print(length($texto));


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
       print("No se puede encriptar un texto ya encriptado")
    }
    else{
        $textoEncriptado=convertirTexto($textoSubido).$textoEncriptado;
    }
    return $textoEncriptado;
}
sub desencriptar{
    my($textoSubido)=shift@_;
    my $textoDesencriptado='';
    if(estaEncriptado($textoSubido)){
        $textoEncriptado=convertirTexto(chopN($textoSubido,3));
    }
    else{
        print("No se puede Desencriptar un texto ya Desencriptado")

    }
    return $textoEncriptado;

}
sub leerTexto{
    <texto>=shift @_;
    my $textoAux='';
    while(<texto>){
        $textoAux= $_.$textoAux
    }
return $textoAux;

}
sub encriptarODesencriptar{
    my($urlTexto)=shift@_;
    my($encriptar)=shift@_;
    open( <textoACifrar>,'<',"pepe.txt");
    my$textoAux=leerTexto(<textoACifrar>);
    close(<textoACifrar>);
    my $textoProcesado='';

    if($encriptar){
        $textoAux=encriptar($textoACifrar)
    }
    else{
        $textoAux=desencriptar($textoACifrar)
    }
    open( my$textoParaActualizar,'>',"pepe.txt");
    print $textoParaActualizar $textoAux;
    close($textoParaActualizar);
}
# open(my $archivo,'>',"pepe.txt");
# my $contenido=<STDIN>;
# print $archivo $contenido;
# close( $archivo);



open( my $textoParaActualizar,'<',"pepe.txt");
my$aux=$textoParaActualizar;

print($textoParaActualizar);

close($textoParaActualizar);





