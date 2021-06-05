package ejercicio 2;
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
    return($numeroConvertido)
}
sub deDecABin{
    my($)

}






sub convertir {
    my ($base1,$numero,$base2) = shift @_;
    return $numero;
}

sub pruebaCadena{
    my($cadena)=shift @_;
    my$cadenaProcesada=$cadena;

    return $cadenaProcesada;
}

sub pruebaIteraciones{
    my($cadena)=shift@_;
    for(1..length($cadena)){
        print("hola ");
    }

}

my $numero=123;
my $pepe=deBinADec(111);
print($pepe);





1;