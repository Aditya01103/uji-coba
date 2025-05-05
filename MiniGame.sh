#!/bin/bash

# Inisialisasi papan
board=(. . . . . . . . .)

# Fungsi untuk menampilkan papan
print_board() {
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "-----------"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "-----------"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# Fungsi untuk memeriksa pemenang
check_winner() {
    for i in 0 1 2; do
        if [[ ${board[$i]} != '.' && ${board[$i]} == ${board[$i+3]} && ${board[$i]} == ${board[$i+6]} ]]; then
            echo "${board[$i]} menang!"
            return 1
        fi
        if [[ ${board[$i*3]} != '.' && ${board[$i*3]} == ${board[$i*3+1]} && ${board[$i*3]} == ${board[$i*3+2]} ]]; then
            echo "${board[$i*3]} menang!"
            return 1
        fi
    done
    if [[ ${board[0]} != '.' && ${board[0]} == ${board[4]} && ${board[0]} == ${board[8]} ]] || [[ ${board[2]} != '.' && ${board[2]} == ${board[4]} && ${board[2]} == ${board[6]} ]]; then
        echo "${board[4]} menang!"
        return 1
    fi
    return 0
}

# Main game loop
current_player="X"
for turn in {1..9}; do
    print_board
    read -p "Giliran pemain $current_player. Masukkan posisi (1-9): " position
    position=$((position - 1))

    if [[ ${board[$position]} == '.' ]]; then
        board[$position]=$current_player
        check_winner || break
        current_player=$([[ $current_player == "X" ]] && echo "O" || echo "X")
    else
        echo "Posisi sudah terisi. C
