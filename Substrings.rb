
def substring_maker(word)
#helper function
#take a word, break it down into an array of its substrings
arrayLetters = word.split(//)

#empty array
result = []

#nested loop

#for every character
  for i in (0..(word.length-1))
#for every character from i to the end of the word
    for j in (i..(word.length-1))
#the result is 
#join the array letters from i to j inclusive
      result << arrayLetters[i..j].join
    end
  end
  return result
end


def substrings(sentence_string, dictionary) 
#make the words lowercase then split them up
  words_array = sentence_string.downcase.split
#empty substrings array
  substrings_array = []
#for the lowercase & split words array
#i think gsub strips punctuation and gets rid of any empty space
  words_array.each {|word| word.gsub!(/[[:punct:]]/, "")}
#i think result gets stored in a hash?
  result = {}
  
  #loop through each word in the words array then make substrings out of them
  for word in words_array
#call the method at the top
#You use the append operator, <<, which basically sticks something at the end of the array.
    substrings_array << substring_maker(word)
  end
  substrings_array.flatten! 
  #this flattens all substring arrays into one array
  
  #Hash count section 
  for item in dictionary
    if substrings_array.include? (item)
      #counts the number of items in the substrings array?
      result[item] = substrings_array.count(item)
    end
  end
  result.keys.sort! #just so that hash displays the keys alphabetically
  return result
end


#testing
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
p substrings("Yolo you only live once, I know that do you?", dictionary)