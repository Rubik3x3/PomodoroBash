#!/bin/bash
continuar='s'
p=0

function titulo_inicio()
{
    echo -n "
██████╗░░█████╗░███╗░░░███╗░█████╗░██████╗░░█████╗░██████╗░░█████╗░
██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗
██████╔╝██║░░██║██╔████╔██║██║░░██║██║░░██║██║░░██║██████╔╝██║░░██║
██╔═══╝░██║░░██║██║╚██╔╝██║██║░░██║██║░░██║██║░░██║██╔══██╗██║░░██║
██║░░░░░╚█████╔╝██║░╚═╝░██║╚█████╔╝██████╔╝╚█████╔╝██║░░██║╚█████╔╝
╚═╝░░░░░░╚════╝░╚═╝░░░░░╚═╝░╚════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝░╚════╝░"
    echo "
   ████████████████████████████████████████████████████████████
   █░▄█████▄─▄▄▀█▄─██─▄█▄─▄─▀█▄─▄█▄─█─▄█▄▄▄░█▄─▀─▄█▄▄▄░█████▄░█
   █░███████─▄─▄██─██─███─▄─▀██─███─▄▀███▄▄░██▀─▀███▄▄░██████░█
   ▀▄▄▀▀▀▀▀▄▄▀▄▄▀▀▄▄▄▄▀▀▄▄▄▄▀▀▄▄▄▀▄▄▀▄▄▀▄▄▄▄▀▄▄█▄▄▀▄▄▄▄▀▀▀▀▀▄▄▀
"
}

function titulo_programar()
{
    echo "
██████╗░██████╗░░█████╗░░██████╗░██████╗░░█████╗░███╗░░░███╗░█████╗░██████╗░
██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔══██╗██╔══██╗████╗░████║██╔══██╗██╔══██╗
██████╔╝██████╔╝██║░░██║██║░░██╗░██████╔╝███████║██╔████╔██║███████║██████╔╝
██╔═══╝░██╔══██╗██║░░██║██║░░╚██╗██╔══██╗██╔══██║██║╚██╔╝██║██╔══██║██╔══██╗
██║░░░░░██║░░██║╚█████╔╝╚██████╔╝██║░░██║██║░░██║██║░╚═╝░██║██║░░██║██║░░██║
╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝
"
}

function titulo_alarma()
{
    echo "
░█████╗░██╗░░░░░░█████╗░██████╗░███╗░░░███╗░█████╗░
██╔══██╗██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔══██╗
███████║██║░░░░░███████║██████╔╝██╔████╔██║███████║
██╔══██║██║░░░░░██╔══██║██╔══██╗██║╚██╔╝██║██╔══██║
██║░░██║███████╗██║░░██║██║░░██║██║░╚═╝░██║██║░░██║
╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝
"
}

while [[ $continuar = 's' ]] 
do
    clear
    case $p in
    0)
        titulo_inicio

        echo "[ 1 ] Programar Pomodoro"
        echo "[ 2 ] Programar Alarma"
        echo -e "[ 3 ] Salir\n"
        echo -n "Opción: "
        read -n1 opc

        echo -e "\n"

        case $opc in
        1)
            p=1
            echo "Has ingresado el número 1."
            ;;
        2)
            p=2
            echo "Has ingresado el número 2."
            ;;
        3)
            echo "Has ingresado el número 3."
            ;;
        *)
            echo "Has ingresado un número invalido."
            ;;
        esac
        ;;
    1)
        titulo_programar
        echo -n "1/2) Ingrese la duración en minutos del Pomodoro: "
        read -n2 pomodoro
        echo -e "\n"
        echo -n "2/2) Ingrese el descanzo en minutos: "
        read -n2 descanzo

        echo -e "\n"

        
        titulo_programar

        echo -e "Pomodoro programado correctamente.\n"
        echo -e "Pomodoro: $pomodoro minutos | Descanzo: $descanzo minutos"

        segActuales=0
        segTotales=$pomodoro*60        
        echo $segTotales
        echo "Segundos $segActuales"
        while [ $segActuales -lt $segTotales ]
        do
            sleep 1
            $segActuales=$segActuales+1
            echo -en "\rSegundos $segActuales"
        done
        ;;
    2)
        titulo_alarma
        ;;
    esac

    
done