#!/bin/bash

# ---------------------------------------------------------------
# Programa desarrollado por Franco Salvador Talarico (@Rubik3x3).

# Proyecto iniciado el 19/05/2023
# ---------------------------------------------------------------

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
        echo "[ 2 ] Programar Alarma (NO FUNCIONA AÚN)"
        echo -e "[ 3 ] Salir\n"
        echo -n "Opción: "
        read -n1 opc

        echo -e "\n"

        case $opc in
        1)
            p=1
            ;;
        2)
            p=0
            ;;
        3)
            pkill -f main.sh
            ;;
        *)
            echo "Has ingresado un número invalido."
            ;;
        esac
        ;;
    1)
        titulo_programar
        echo -n "1/2) Ingrese la duración en minutos del Pomodoro (max 60m): "
        read -n2 pomodoro
        echo -e "\n"
        echo -n "2/2) Ingrese el descanzo en minutos (max 60m): "
        read -n2 descanzo
        echo -e "\n"
        echo -e "Pomodoro programado correctamente.\n"
        notify-send 'POMODORO' 'Programado correctamente.'
        echo -e "Pomodoro: $pomodoro minutos | Descanzo: $descanzo minutos"

        let segTotales=$pomodoro*60
        let descTotales=$descanzo*60

        echo -en "\r>> Minutos restantes: $pomodoro"
        while [ $segTotales -gt 0 ]
        do
            sleep 1
            ((segTotales--))
            let minutos=$segTotales/60
            echo -en "\r>> Minutos restantes: $minutos "
        done
        notify-send 'POMODORO' 'Temporizador terminado, ¡Puedes descanzar!'
        echo -e -n "\n¿Quieres empezar la pausa? [s/n]"
        read -n1 ans
        if [[ $ans = 's' ]]
        then
        echo -en "\r                                                          "
        echo -en "\r>> Minutos restantes de pausa: $descanzo"
        while [ $descTotales -gt 0 ]
        do
            sleep 1
            ((descTotales--))
            let minutosP=$descTotales/60
            echo -en "\r>> Minutos restantes de pausa: $minutosP "
        done
        else
            notify-send 'POMODORO' "Saliste del pomodoro."
            p=0
        fi

        echo -e "\nPOMODORO FINALIZADO!\n"
        notify-send 'POMODORO' 'POMODORO FINALIZADO!'
        echo -n "¿Quiere continuar con otro pomodoro? [s/n]: "
        read -n1 ansF

        if [[ $ansF = 'n' ]]
        then
        p=0
        fi
        ;;
    2)
        titulo_alarma
        ;;
    esac

    
done
