package ejercicio;
use strict;
use warnings FATAL => 'all';

sub convertirBinarioADecimal{
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
sub convertirDecimalABinario{
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


sub equivalenciaHexaABinario {
    my ($numEnHexa) = shift @_;
    my %hexaABinario = (0 => "0000",
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
    return $hexaABinario{$numEnHexa};
}
sub equivalenciaBinarioAHexa {
    my ($numEnHexa) = shift @_;
    my %binarioHexa = (0000=>"0",
                       0001=>"1",
                       0010=>"2",
                       0011=>"3",
                       0100=>"4",
                       0101=>"5",
                       0110=>"6",
                       0111=>"7",
                       1000=>"8",
                       1001=>"9",
                       1010=>"A",
                       1011=>"B",
                       1100=>"C",
                       1101=>"D",
                       1110=>"E",
                       1111=>"F");
    return $binarioHexa{$numEnHexa};
}


sub convertirHexaABinario {
    my ($numeroEnHexa) = shift @_;
    my $numeroAuxiliar=$numeroEnHexa;
    my $resultado = "";
    for (1 .. length($numeroEnHexa)) {
        $resultado=  equivalenciaHexaABinario(chop($numeroAuxiliar)).$resultado;
    }
    return ($resultado);
}
sub convertirBinarioAHexa {
    my ($numeroEnHexa) = shift @_;
    my $numeroAuxiliar=$numeroEnHexa;
    my $resultado = "";
    for (1 .. length($numeroEnHexa)) {
        $resultado=  equivalenciaBinarioAHexa(chop($numeroAuxiliar)).$resultado;
    }
    return ($resultado);
}
sub convertirDecimalAHexa{
    my ($numeroEnDecimal) = shift @_;
    return convertirBinarioAHexa(int(convertirDecimalABinario($numeroEnDecimal)));

}
sub convertirHexaADecimal{
    my ($numeroEnHexa) = shift @_;
    return convertirHexaABinario(int(convertirBinarioADecimal($numeroEnHexa)));
}


sub convertir {
    my $base1=shift @_;
    my $numero=shift @_;
    my $base2=shift @_;
    if($base1==2and$base2=10){
        convertirBinarioADecimal($numero)#ok
    }
    if($base1==2and$base2=16){
        convertirBinarioAHexa($numero)#ok
    }
    if($base1==16and$base2=10){
        convertirHexaADecimal($numero)
    }
    if($base1==16and$base2=2){
        convertirHexaABinario($numero)#ok
    }
    if($base1==10and$base2=2){
        convertirDecimalABinario($numero)#ok
    }
    if($base1==10and$base2=16){
        convertirDecimalAHexa($numero)
    }


}






print( convertirBinarioAHexa(10111111));









1;