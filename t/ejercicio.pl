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
    return($numeroConvertido)
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
    if($numeroAux<1){
        push(@listaNConvertido,0)
    }
    else{
        push(@listaNConvertido,1)
    }
    return(reverse(@listaNConvertido))
}






sub convertir {
    my ($base1,$numero,$base2) = shift @_;
    return $numero;
}


sub baseDatosHexa{
    my($base1)=shift @_;
    my($numero)=shift @_;
    my($base2)=shift @_;
    my%hexaABin=(0=>0000,
                 1=>0001,
                 2=>0010,
                 3=>0011,
                 4=>0100,
                 5=>0101,
                 6=>0110,
                 7=>0111,
                 8=>1000,
                 9=>1001,
                 "A"=>1010,
                 "B"=>1011,
                 "C"=>1100,
                 "D"=>1101,
                 "E"=>1110,
                 "F"=>1111);
    my%binAHexa=(0000=>0,
                 0001=>1,
                 0010=>2,
                 0011=>3,
                 0100=>4,
                 0101=>5,
                 0110=>6,
                 0111=>7,
                 1000=>8,
                 1001=>9,
                 1010=>"A",
                 1011=>"B",
                 1100=>"C",
                 1101=>"D",
                 1110=>"E",
                 1111=>"F");
    my%hexaADec=(0=>0,
                 1=>1,
                 2=>2,
                 3=>3,
                 4=>4,
                 5=>5,
                 6=>6,
                 7=>7,
                 8=>8,
                 9=>9,
                 "A"=>10,
                 "B"=>11,
                 "C"=>12,
                 "D"=>13,
                 "E"=>14,
                 "F"=>15);
    my %decAHexa=(0=>0,
                 1=>1,
                 2=>2,
                 3=>3,
                 4=>4,
                 5=>5,
                 6=>6,
                 7=>7,
                 8=>8,
                 9=>9,
                 10=>"A",
                 11=>"B",
                 12=>"C",
                 13=>"D",
                 14=>"E",
                 15=>"F");
    my $resultado=-1;
    if($base1==16 and $base2==2){
     $resultado=$hexaABin{$numero};
    }
    elsif($base1==16 and $base2==10){
        $resultado=$hexaADec{$numero};
    }
    elsif($base1==2 and $base2==16){
        $resultado=$binAHexa{$numero};
    }
    elsif($base1==10 and $base2==16){
        $resultado=$decAHexa{$numero};
    }
    return $resultado;
}

sub deHexaA {
    my ($base) = shift @_;
    my ($numero) = shift @_;
    my @resultado = {};
    my $numeroAux = $numero;
    if ($base == 10) {
        for (0 .. length($numero)) {
            print(baseDatosHexa(16, chop $numeroAux, 10));
            #push(@resultado, baseDatosHexa(16, chop $numeroAux, 10))
        }
        if ($base == 2) {
            for (0 .. length($numero)) {
                push(@resultado, baseDatosHexa(16, chop $numeroAux, 2))
            }
        }
        return @resultado;
    }

}

my $resultado=deHexaA(10,2);

print ($resultado);









1;