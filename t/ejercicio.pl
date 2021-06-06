package ejercicio;
use strict;
use warnings FATAL => 'all';

sub deBinADec{
    my($nAConvetir)=shift @_;
    my$numeroAux=$nAConvetir;
    my$cantDigitos=length($nAConvetir);
    my$numeroConvertido=0;
    for my $index(0..$cantDigitos-1){
       my $exp=2**$index;
      $numeroConvertido=$numeroConvertido+(chop($numeroAux)*$exp);
    }
    return("$numeroConvertido")
}
sub deDecABin{
    my($nAConvetir)=shift @_;
    my$cantDigitos=length($nAConvetir);
    my$numeroAux=$nAConvetir;
    my @listaNConvertido=();
   while($numeroAux>=2){
       $numeroAux=$numeroAux/2;
        if ($numeroAux-int($numeroAux)>0) { ##encapsular comportamiento en una funcion
          push(@listaNConvertido,1)
        }
        else{
            push(@listaNConvertido,0)
        }
        $numeroAux =int($numeroAux);
    }
    if($numeroAux==1){push(@listaNConvertido,0)}

    else{push(@listaNConvertido,1)
    }
    return(reverse(@listaNConvertido))
}






sub convertir {
    my $base1=shift @_;
    my $numero=shift @_;
    my $base2=shift @_;
    if($base1==2and$base2=10){
        convertirBinarioADecimal($numero)
    }
    if($base1==2and$base2=16){
        convertirBinarioAHexa($numero)
    }
    if($base1==16and$base2=10){
        convertirHexaADecimal($numero)
    }
    if($base1==16and$base2=2){
        convertirHexaABinario($numero)
    }
    if($base1==10and$base2=2){
        convertirDecimalABinario($numero)
    }
    if($base1==10and$base2=16){
        convertirDecimalAHexa($numero)
    }


}


sub equivalenciaHexaABinario {
    my ($numEnHexa) = shift @_;
    my %hexaABin = (0 => "0000",
        1             => "0001",
        2             => "0010",
        3             => "0011",
        4             => "0100",
        5             => "0101",
        6             => "0110",
        7             => "0111",
        8             => "1000",
        9             => "1001",
        "A"           => "1010",
        "B"           => "1011",
        "C"           => "1100",
        "D"           => "1101",
        "E"           => "1110",
        "F"           => "1111");
    return $hexaABin{$numEnHexa};
}


sub deHexaABinario {
    my ($numeroEnHexa) = shift @_;
    my $numeroAuxiliar=$numeroEnHexa;
    my $resultado = "";
    for (1 .. length($numeroEnHexa)) {
        $resultado=  equivalenciaHexaABinario(chop($numeroAuxiliar)).$resultado;
    }
    return ($resultado);
}



print( deHexaABinario("FFA"));









1;