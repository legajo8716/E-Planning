package ejercicio;
use strict;
use warnings FATAL => 'all';


sub convertirBinarioADecimal{
    my($nAConvetir)=shift @_;
    my$numeroAux=$nAConvetir;
    my$cantDigitos=length($nAConvetir);
    my$numeroConvertido=0;
    my $exponenteAux=0;
    for my $index(0..$cantDigitos-1){
        $exponenteAux=2**$index;
        $numeroConvertido=$numeroConvertido+(chop($numeroAux)*$exponenteAux);
    }
    return("$numeroConvertido")
}

sub esUnDecimalEntero{
    my($numEnDecimal)=shift @_;
    return ($numEnDecimal-int($numEnDecimal)>0);
}

sub restoDeUnaDivision{
    my($dividendo)=shift @_;
    my($divisor)=shift @_;
    my$resultado=$dividendo/$divisor;
    my $resto=$dividendo-int($divisor*int($resultado));
    return ($resto);
}
sub convertirDecimalABinario{
    my($numEnBinario)=shift @_;
    my$numAConvertir=$numEnBinario;
    my @listaNumConvertido=();
    my $ultimoTerminoProcesado=0;
    while($numAConvertir>=2){
        push(@listaNumConvertido,restoDeUnaDivision($numAConvertir,2));
        $ultimoTerminoProcesado=$numAConvertir;
        $numAConvertir=$numAConvertir/2;
        $numAConvertir =int($numAConvertir);
    }
    push(@listaNumConvertido,int($ultimoTerminoProcesado/2));
    return(reverse(@listaNumConvertido))
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
sub cantDeDigitosMult4{
    my ($numero) = shift @_;
    my $num=$numero;
    my $cantDeCeros=4-(length($num)/4- int(length($num)/4))*4;
    my$resultado=sprintf("%0$cantDeCeros"."d",$numero);
    return $resultado ;
}
sub convertirDecimalAHexa {
    my ($numeroEnDecimal) = shift @_;
    my $numeroAuxiliar=$numeroEnDecimal;
    my $numeroEnBinario=convertirDecimalABinario($numeroAuxiliar);
    return convertirBinarioAHexa(cantDeDigitosMult4($numeroEnBinario));
}
sub convertirBinarioAHexa{
    my ($numeroEnBinario) = shift @_;
    my $resultado = "";
    my $numeroAuxiliar=$numeroEnBinario;
    my $agrupacion=0;
    for(1.. (length($numeroEnBinario)/4)){
        $agrupacion=agruparDe($numeroAuxiliar,4);
        $resultado=  equivalenciaBinarioAHexa($agrupacion).$resultado;
        $numeroAuxiliar=eliminarLosUltimosN($numeroAuxiliar,4);
    }
    return $resultado;
}
sub agruparDe{
    my ($numero) = shift @_;
    my ($cantAgrupacion)=shift @_;
    my $numeroAux = $numero;
    my $agrupacion='';
    my $chopAux=0;
    for(1..$cantAgrupacion){
        $chopAux=chop($numeroAux);
        $agrupacion= $chopAux. $agrupacion;
    }
    return($agrupacion);
}
sub eliminarLosUltimosN{
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
    return convertirBinarioADecimal(convertirHexaABinario($numeroEnHexa));
}
sub convertir {
    my $base1=shift @_;
    my $numero=shift @_;
    my $base2=shift @_;
    my $conversionRealizada=shift@_;
    if($base1==2and$base2==10){
        $conversionRealizada= convertirBinarioADecimal($numero)#ok
    }
    elsif($base1==2and$base2==16){
        $conversionRealizada=convertirBinarioAHexa($numero)#ok
    }
    elsif($base1==16and$base2==10){
        $conversionRealizada=convertirHexaADecimal($numero)
    }
    elsif($base1==16and$base2==2){
        $conversionRealizada=convertirHexaABinario($numero)#ok
    }
    elsif($base1==10and$base2==2){
        $conversionRealizada=convertirDecimalABinario($numero)#ok
    }
    elsif($base1==10and$base2==16){
        $conversionRealizada=convertirDecimalAHexa($numero)
    }

    return $conversionRealizada;
}

my$valor=sprintf("%04d",12);

print(cantDeDigitosMult4(11112));











1;