def collatz_sequence_eval(n)
  array_sequence = []
  until n == 1
    if n%2 != 0 
        n = 3*n + 1
        array_sequence.push(n)
      else
        n = n/2
        array_sequence.push(n)
    end
  end
  return array_sequence
end

def longest_collatz_sequence(max, min=1)
  longest_n = 0 
  longest_chain = 0
  collatz_lengths = []
  
  (min..max).each do |n|
    
    count = 1
    i = n 
    
    until i <= 1
      
      if collatz_lengths[i]
        
        count += collatz_lengths[i]
        break
      else
        
        i = i.even? ? i / 2 : 3 * i + 1
        
        count +=1
      end
    end
   
    collatz_lengths[n] = count
    
    if count > longest_chain
      longest_chain = count 
      longest_n = n
    end
  end
  return longest_n
end


puts collatz_sequence_eval(10)
puts "The number from 1-1,000,000 with the longest collatz sequence is #{longest_collatz_sequence(1000000, 1)}"
