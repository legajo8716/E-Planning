#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $cadena1="holaade";
my $cadena2="holaade";




sub aparicionesDeLetra{
    my($cadena)=shift@_;
    my($letra)=shift@_;
    my $cantApariciones=0;
    my $indiceAparicion=index($cadena,$letra);
    while($indiceAparicion>-1){
        $cantApariciones++;
         $indiceAparicion=index($cadena,$letra,$indiceAparicion+1);
    }
    return $cantApariciones;

}
sub mismaCantLetras{
    my($cadena1)=shift@_;
    my($cadena2)=shift@_;
    return (length($cadena1)== length($cadena2))
}
sub mismasAparicionesDeLetra{
    my($cadena1)=shift@_;
    my($cadena2)=shift@_;
    my($letra)=shift@_;
    return aparicionesDeLetra($cadena1,$letra)==aparicionesDeLetra($cadena2,$letra);
}

sub esAnagrama{
    my($cadena1)=shift@_;
    my($cadena2)=shift@_;
    my $cadenaAux=$cadena1;
    my $letraATestear='';
    my $resultado=1;
    if(mismaCantLetras($cadena1,$cadena2)){
        while(length($cadenaAux)>0 && $resultado==1){
            $letraATestear=chop($cadenaAux);
            $resultado= mismasAparicionesDeLetra($cadena1,$cadena2,$letraATestear);
        }
        if($resultado==1){
            print("Son anagrama")
        }
        else{
            print("No son anagrama")
        }
    }
    else{
        print("No son anagrama")
    }


}
print(esAnagrama($cadena1,$cadena2));