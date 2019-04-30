def da_boas_vindas
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual o seu nome?"
    nome = gets.strip

    puts "\n\n\n\n\n\n\n"
    puts "Bem vindo, " + nome
    return nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja? (1 fáci, 5 difícil)"
    dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    return sorteado ##não precisa do return quando é a ultima coisa da função
end

def pede_um_numero(chutes, i, limite_de_tentativas)
    puts "\n\n\n\n"
    puts "Tentativa #{i} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número: "
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute

    if acertou
        puts "Você acertou!"
        return true
    end

    if maior = numero_secreto > chute
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end
    false
end

def jogar(nome, dificuldade)

numero_secreto = sorteia_numero_secreto dificuldade
pontos_até_agora = 1000.0

limite_de_tentativas = 5
chutes = []

for i in 1..limite_de_tentativas

    chute = pede_um_numero chutes, i, limite_de_tentativas
    chutes << chute # << coloca um elemento dentro da array

    if nome == "Caio"
        puts "Acertou!"
        break
    end

    #.abs traz o valor absoluto
    pontos_a_perder = (chute - numero_secreto).abs/2.0     
    pontos_até_agora -= pontos_a_perder

    if verifica_se_acertou numero_secreto, chute
        break
    end
    
end

puts "Você ganhou #{pontos_até_agora} pontos."
end

def quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    jogar nome, dificuldade
    if !quer_jogar
        break
    end
end

    #Utilizando o irb no console podemos fazer codigos linha a linha, e podemos chamar os methods que podemos usar como variavel.methods 
    #Podemos utilizar a interpolação de string com #{variavel} ao inves de concatenar
    # varivel.size.to_s imprimi o numero de caracteres de um texto.
    # gets.strip limpa o caracter em branco dos dois lados, pois o enter coloca um \n, se tornando um caracter impresso.

    ##########################################
    #verificação condicional de resposta dada
    #Como fazer comentários
    ##########################################

    #OPERAÇÕES MATEMATICAS: +, -, *, / e %(RESTO, ou módulo)