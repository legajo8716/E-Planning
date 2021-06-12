package ejercicio;
use strict;
use warnings FATAL => 'all';

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
    my %binarioHexa = ("0000"=>"0",
        "0001"=>"1",
        "0010"=>"2",
        "0011"=>"3",
        "0100"=>"4",
        "0101"=>"5",
        "0110"=>"6",
        "0111"=>"7",
        "1000"=>"8",
        "1001"=>"9",
        "1010"=>"A",
        "1011"=>"B",
        "1100"=>"C",
        "1101"=>"D",
        "1110"=>"E",
        "1111"=>"F");
    return $binarioHexa{$numEnHexa};
}

sub esUnDecimalEntero{
    my($numEnDecimal)=shift @_;
    return ($numEnDecimal-int($numEnDecimal)>0);
}

sub restoDeUnaDivision{
    my($dividendo)=shift @_;
    my($divisor)=shift @_;
    my $resto=-1;
    if($divisor==0){
        print("error");
    }
    else {
        my $resultado = $dividendo / $divisor;
         $resto = $dividendo - int($divisor * int($resultado));
    }
    return ($resto);
}


sub darCantDeDigitosMult4{
    my ($cadena) = shift @_;
    my $numAux="$cadena";
    my $cantDeCeros=(length($cadena)/4- int(length($cadena)/4))*4;
    for(1..$cantDeCeros){
        $numAux='0'.$numAux    }
    return $numAux ;
}

sub agruparDe{
    my ($cadena) = shift @_;
    my ($cantAgrupacion)=shift @_;
    my $cadenaAux = $cadena;
    my $agrupacion='';
    my $chopAux=0;
    for(1..$cantAgrupacion){
        $chopAux=chop($cadenaAux);
        $agrupacion= $chopAux. $agrupacion;
    }
    return($agrupacion);
}

sub eliminarLosUltimosN{
    my($cadena)=shift @_;
    my($n)=shift @_;
    my$cadenaAux=$cadena;
    for(1..$n){
        chop($cadenaAux);
    }
    return $cadenaAux;
}

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
    my ($numeroEnDecimal) = shift @_;
    my $numeroAuxiliar=$numeroEnDecimal;
    my $numeroEnBinario=convertirDecimalABinario($numeroAuxiliar);
    return convertirBinarioAHexa(darCantDeDigitosMult4($numeroEnBinario));
}

sub convertirBinarioAHexa{
    my ($numeroEnBinario) = shift @_;
    my $resultado = "";
    my $numeroAuxiliar=darCantDeDigitosMult4("$numeroEnBinario");
    my $agrupacion='';
    for my$index(1.. (length($numeroAuxiliar)/4)){
        $agrupacion=agruparDe($numeroAuxiliar,4);
        $numeroAuxiliar=eliminarLosUltimosN($numeroAuxiliar,4);
        $resultado= equivalenciaBinarioAHexa($agrupacion).$resultado;
    }
    return $resultado;
}

sub convertirHexaADecimal{
    my ($numeroEnHexa) = shift @_;
    return convertirBinarioADecimal(convertirHexaABinario($numeroEnHexa));
}

sub convertir {
    my $base1=shift @_;
    my $numero=uc(shift @_);
    my $base2=shift @_;
    my $conversionRealizada='';
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
    else{
        print("Base seleccionada invalida")
    }

    return $conversionRealizada;
}



print(convertir(2,"101",10));
print("\n");

print(convertir(15,"a2",2));
print("\n");

print(convertir(10,"10",16));


1;