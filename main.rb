#método para calcular nuevo salario con incremento.
def calc_salario (salario, incremento)
    nuevo_salario = salario+(salario * (incremento/1000))
    return nuevo_salario
end
#Método que limpia la pantalla, usado la simplificar la lectura.
def limpia_pantalla
    system 'clear'
end
# Método para imprimir el menú y descontaminar el ciclo principal
def print_menu()
    print "
    \n\n\n
    Selecciona el requisito a desplegar.\n
    1. Cálculo de nuevo salario con incremento o decremento.\n
    2. Adivina el número.\n
    3. Cálculo de Obesidad.\n
    4. Salir.\n\n        Tú selección: "
    seleccion = gets.chomp.to_i
    return seleccion
end
# Cálculo de rango para adivinar el número
def rango_adv()
    print "\n Jugaremos adivinar el número.\n
        Selecciona un rango, mientras mas amplio el rango, más oportunidades de adivinar.\n
        Desde 0 hasta: "
    rango = gets.chomp.to_i
    return rango
end
#cálculo rápido de IMC
def calc_imc(peso, altura)
    imc = peso /(altura*altura)
    return imc
end
def obesidad(imc)
# Un IMC menor a 18,5: bajo de peso
# Entre 18,5 y 24,9: IMC normal
# De 25 a 29,9: indica sobrepeso 
# ○ Obesidad grado I: 30 - 34.9 - Moderado
# ○ Obesidad grado II: 35 - 39.9 - Severo
# ○ Obesidad grado III: Más de 40 - Muy severo
    txt_obs=""
    case imc
        when 1..18.5 
            then txt_obs="Bajo de peso !!, deberías alimentarte mejor. "
        when 18.5..24.9 
            then txt_obs="IMC Normal, excelente !"
        when 25..29.9
            then txt_obs="Estas con sobrepeso."
        when 30..34.9
            then txt_obs="Tienes Obesidad grado I - Moderado"
        when 35..39.9
            then txt_obs="Tienes Obesidad grado II - Severo"
        when 40..80
            then txt_obs="Tienes Obesidad grado III - Muy severo"
    end
    return txt_obs
end
print "


¡¡¡ Bienvenido al desafío de Flujos, Ciclos y Métodos 3 !!! \n"
opcion = print_menu()


while opcion != 4
# Requerimientos
# 1. Requerimiento 1, se solicita un programa que mediante el uso de métodos permita calcular el nuevo salario de un colaborador/a en función de un porcentaje mínimo de aumento establecido.
    limpia_pantalla()
    if opcion == 1
        print "\n Ingrese el sueldo actual : "
        sueldo = gets.chomp.to_i
        print "\n Ingrese el incremento de sueldo(mínimo 5%), ingrese sólo números : "
        incremento = gets.chomp.to_f
        if incremento >= 5
            nuevo_salario = calc_salario(sueldo, incremento).to_i
            puts "\n El nuevo salario será $#{nuevo_salario}"
        else
            print "\n El incremento de sueldo debe ser como mínimo un 5%.\n"
        end

# 2. Requerimiento 2, te solicitan un programa que simule el juego de “Adivina el
# número”. En este programa el computador va a elegir un número aleatorio y el
# usuario al seleccionar un número debe indicarle si ganó o perdió. La condición para
# ganar es que el número del computador debe ser igual al del jugador.
# El rango de número va entre 1 hasta n, tomando en consideración que mientras más
# amplio sea el rango más duradero será el juego.
# (4 Puntos)
    elsif opcion == 2
        limpia_pantalla()
        rango=rango_adv()
        if rango <= 4 
            chances = 1 
        else 
            chances = rango /4 
        end
        puts "     Tendrás #{chances} oportunidades para adivinar el número del PC."
        obj = Random.new
        no_pc = obj.rand(rango)
        chances.times{
            print "\n\n    Te quedan "+chances.to_s+" oportunidades : "
            usr = gets.chomp.to_i
            if no_pc ==usr
                print "\n¡¡¡ GANASTE !!!"
                break
            else print "   No acertaste."
                chances -=1
            end
        }

        

# 3. Requerimiento 3, utilizando como base el ejercicio de cálculo de IMC en la guía de
# ejercicios, agregar en el cálculo de Obesidad los elementos faltantes dado que la
# obesidad se subdivide en 3 niveles. Deberás agregar a la lógica condicional los
# cálculos para esos tres niveles.
# (2 Puntos)
    elsif opcion == 3
        limpia_pantalla()

        print "   Vamos a calcular tu IMC"
        print "\n    Ingresa tu Peso actual (Kg): "
        peso = gets.chomp.to_f
        print "\n    Ingresa tu estatura (en metros X.XX): "
        altura = gets.chomp.to_f
        indice = calc_imc(peso, altura)
        observacion = obesidad(indice)
        print "\n    Tu IMC: "+indice.round(2).to_s+" equivalente a: "+observacion
        


    else
        puts "Debes ingresar una opción válida."

    end

    opcion = print_menu()
# Consideraciones y recomendaciones
# ● Requerimiento 1, fórmula salario + (salario * (incremento / 1000))
# ● Requerimiento 2,
# ○ Utiliza el método .rand para generar números aleatorios.
# ○ Implementa el ciclo más conveniente para lograr la lógica del ejercicio.
# ● Requerimiento 3, te compartimos los datos para las subcategorías asociadas a la
# # obesidad.

end
limpia_pantalla()
print  "Adiós.....\n
        _nnnn_
        dGGGGMMb
       @p~qp~~qMb
       M|@||@) M|
       @,----.JM|
      JS^\__/  qKL
     dZP        qKRb
    dZP          qKKb
   fZP            SMMb
   HZM            MMMM
   FqM            MMMM
 __| '.        |/dS'qML
 |    `.       | `' \Zq
_)      \.___.,|     .'
|____   )MMMMMP|   .'
     `-'       `--' hjm\n"