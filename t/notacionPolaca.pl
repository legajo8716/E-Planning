#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
sub sinElUltimoTermino {
    my ($cuentaEnNotPol) = shift @_;
    my $cuentaAux = $cuentaEnNotPol;
    my $resultado = "";
    my $ultimoDigito = chop($cuentaAux);
    while (ord($ultimoDigito) != ord(" ") && length($cuentaAux) != 0) {
        $ultimoDigito = chop($cuentaAux);
    }
    return $cuentaAux;
}
sub extraerUltimoTermino {
    my ($cuentaEnNotPol) = shift @_;
    my $cuentaAux = $cuentaEnNotPol;
    my $resultado = "";
    my $ultimoDigito = chop($cuentaAux);
    while (ord($ultimoDigito) != ord(" ") && length($cuentaAux) != 0) {
        $resultado = $ultimoDigito . $resultado;
        $ultimoDigito = chop($cuentaAux);
    }
    if (length($cuentaAux) == 0) {
        $resultado = $ultimoDigito . $resultado;
    }
    return $resultado;
}
sub esUltimoTermino {
    my ($cuentaEnNotPol) = shift @_;
    my $longitudCadena = length(sinElUltimoTermino($cuentaEnNotPol));
    return ($longitudCadena == 0);
}
sub realizarOperacion {
    my ($term1) = shift @_;
    my ($term2) = shift @_;
    my ($operacion) = shift @_;
    my $resultado = 0;
    if (ord($operacion) == ord("x")  ) {
        $resultado = $term2 * $term1;
    }
    if (ord($operacion) == ord("/")) {
        $resultado = $term2 / $term1;
    }
    if (ord($operacion) == ord("+")) {
        $resultado = $term2 + $term1;
    }
    if (ord($operacion) == ord("-")) {
        $resultado = $term2 - $term1;
    }
    return ($resultado);
}
sub esNumero {
    my ($digito) = shift @_;
    return (ord($digito) > 47 and ord($digito) < 58)
}
sub esOperando {
    my ($digito) = shift @_;
    my $resultado = ord($digito) == ord('+') || ord($digito) == ord('-') || ord($digito) == ord('x') || ord($digito) == ord('/');
    return ($resultado);
}
sub capturarPrimeraCuenta {
    my ($cuentaEnNotPol) = shift @_;
    my $comienzoCuenta = $cuentaEnNotPol;
    my $cuentaProcesada = '';
    my $finalCuenta = '';
    my ($operando) = extraerUltimoTermino($comienzoCuenta);
    $comienzoCuenta = sinElUltimoTermino($comienzoCuenta);
    my ($termino1) = extraerUltimoTermino($comienzoCuenta);
    $comienzoCuenta = sinElUltimoTermino($comienzoCuenta);
    my ($termino2) = extraerUltimoTermino($comienzoCuenta);
    $comienzoCuenta = sinElUltimoTermino($comienzoCuenta);

    while (!(esOperando($operando) && esNumero($termino1) && esNumero($termino2))) {
        $finalCuenta = " " . $operando . $finalCuenta;
        $operando = $termino1;
        $termino1 = $termino2;
        $termino2 = extraerUltimoTermino($comienzoCuenta);
        $comienzoCuenta = sinElUltimoTermino($comienzoCuenta);
    }
    $cuentaProcesada = realizarOperacion($termino1, $termino2, $operando);
    if(length($comienzoCuenta)>0){
        return $comienzoCuenta ." ". $cuentaProcesada . $finalCuenta;
    }
    else {
        return $cuentaProcesada . $finalCuenta;
    }
}

sub efectuarOperacion {
    my ($cuentaEnNotPol) = shift @_;
    my ($cuentaParaProcesar) = $cuentaEnNotPol;
    my $resultado = 0;
    while (!esUltimoTermino($cuentaParaProcesar)) {
        $cuentaParaProcesar = capturarPrimeraCuenta($cuentaParaProcesar);
    }
    $resultado = $cuentaParaProcesar;
    return ($resultado);
}
my $entrada=<STDIN>;
my $respuesta = efectuarOperacion($entrada);
print($respuesta);
