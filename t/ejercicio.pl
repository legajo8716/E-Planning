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
    my($nAConvetir)=shift @_;
    my$cantDigitos=length($nAConvetir);
    my$numeroAux=$nAConvetir;
    my @listaNConvertido=();
   while($numeroAux>2){
       $numeroAux=$numeroAux/2;
        if ($numeroAux-int($numeroAux)>0) { ##encapsular comportamiento en una funcion
          push(@listaNConvertido,1)
        }
        else{
            push(@listaNConvertido,0)
        }
        $numeroAux =int($numeroAux);
    }
    print(@listaNConvertido)
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

my @numero=();
push(@numero,2);
push(@numero,3);

deDecABin(1);






1;