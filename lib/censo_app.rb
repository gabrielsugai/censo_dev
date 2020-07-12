def menu(input)
  @aux = 0
  case input
  when '1'
    puts('Informe o nome do estado desejado:')
  when '2'
    puts('Informe o nome do municipio desejado:')
  when '0'
    puts('Obrigado por usar o CensoDev, até a proxima!')
    @aux = 1
  else
    puts('Opção invalida, tente novamente!')
  end
end

def main
  while true
    puts('Digite o numero da opcao desejada a seguir, ou 0 para sair!')
    puts('1: Buscar UF -- 2: Buscar municipio -- 0: Sair')
    input = gets().chomp()
    
    menu(input)
    if @aux == 1
      break
    end
  end
end

main()