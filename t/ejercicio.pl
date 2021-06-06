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
    if($numeroAux<1){push(@listaNConvertido,0)}

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
sub equivalenciaDecimalAHexa {
    my ($numEnHexa) = shift @_;
    my %binarioHexa = (0=>"0",
                       1=>"1",
                       2=>"2",
                       3=>"3",
                       4=>"4",
                       5=>"5",
                       6=>"6",
                       7=>"7",
                       8=>"8",
                       9=>"9",
                       10=>"A",
                       11=>"B",
                       12=>"C",
                       13=>"D",
                       14=>"E",
                       15=>"F");
    return $binarioHexa{$numEnHexa};
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
sub convertirDecimalAHexa {
    my ($numeroEnHexa) = shift @_;
    my $numeroAuxiliar=$numeroEnHexa;
    my $resultado = "";
    for (1 .. length($numeroEnHexa)) {
        $resultado=  equivalenciaDecimalAHexa(chop($numeroAuxiliar)).$resultado;
    }
    return ($resultado);
}
sub convertirBinarioAHexa{
    my ($numeroEnBinario) = shift @_;
    my $numeroAuxiliar=$numeroEnBinario;
    my $resultado = "";
    my $agrupacion=agruparDe($numeroAuxiliar,4);
    chopN($numeroAuxiliar,4);
    for(1.. length($numeroEnBinario)/4){
        $resultado=equivalenciaBinarioAHexa($agrupacion).$resultado;
        $agrupacion=agruparDe($numeroAuxiliar,4);
        chopN($numeroAuxiliar,4);
    }
    return $resultado;

}
sub agruparDe{
    my ($numero) = shift @_;
    my ($cantAgrupacion)=shift @_;
    my $numeroAux = $numero;
    my $agrupacion='';
    for(1..$cantAgrupacion){
        $agrupacion=chop($numeroAux) . $agrupacion;
    }
    return(int($agrupacion));
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






print( convertirBinarioAHexa(11111111));









1;