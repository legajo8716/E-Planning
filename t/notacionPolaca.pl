#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

 sub extraerUltimoTermino{

 }
 sub sinElUltimoTermino{
     my($cuentaEnNotPol)=shift @_;
     my $cuentaAux=$cuentaEnNotPol;
     my $resultado="";

     my $ultimoDigito=chop($cuentaAux);
     while(ord($ultimoDigito)!=ord(" ")){
         $resultado=$ultimoDigito.$resultado;
         $ultimoDigito=chop($cuentaAux);
     }
     return $resultado;
 }
sub esUltimoTermino{
    my($cuentaEnNotPol)=shift @_;
    my $longitudCadena=length(sinElUltimoTermino($cuentaEnNotPol));
    return($longitudCadena==0);
}
sub realizarOperacion{
    my($term1)=shift @_;
    my($term2)=shift @_;
    my($operacion)=shift @_;
    my $resultado=0;
    if(ord($operacion)==ord("x")){
        $resultado=$term1*$term2;
    }
    if(ord($operacion)==ord("/")){
        $resultado=$term1/$term2;

    }
    if(ord($operacion)==ord("+")){
        $resultado=$term1+$term2;

    }
    if(ord($operacion)==ord("-")){
        $resultado=$term1-$term2;

    }
    return($resultado);
}
 sub efectuarOperacion {
     my ($cuentaEnNotPol) = shift @_;
     my ($cuentaParaProcesar) = $cuentaEnNotPol;
     my $resultado = 0;
     my $ultimoTermino = '';
     my $operacion = '';

     if (esUltimoTermino($cuentaParaProcesar)) {
         return extraerUltimoTermino($cuentaParaProcesar);
     }
     else {
         $ultimoTermino = extraerUltimoTermino($cuentaParaProcesar);
         $cuentaParaProcesar = sinElUltimoTermino($cuentaParaProcesar);
         $operacion = sinElUltimoTermino($cuentaParaProcesar);
         $cuentaParaProcesar = sinElUltimoTermino($cuentaParaProcesar);
         $resultado = realizarOperacion(efectuarOperacion($cuentaParaProcesar), $ultimoTermino, $operacion);
     }

 }
print(efectuarOperacion("23 4 +"));
