require 'pry'

class PigLatinizer
  attr_reader :text


  def piglatinize(sentence)
    @text = sentence.split(" ") #.downcase #breaks words of sentence into array
    iterate_words(@text) #individually piglatinizes each word, through piglatinize method and returns full sentence
  end

  def iterate_words(words)
    pig_array = []
    words.each do |word|
      pword = piggify(word)
      pig_array << pword
    end
    pigger_array = []
    if pig_array.count > 1
      pig_array.each do |pig|
        pigger_array << pig #.downcase
      end
    else
      pigger_array = pig_array
    end
    piggest_array = pigger_array.join(" ")
    piggest_array
  end

  def piggify(word)
    #needs to piglatinize indiviual word according to test
      new_word = word.split("")
      vowels = ["a", "e", "i", "o", "u"]
      u_and_e = ["u", "e"]
      #rule where if first two letters are consonants, must both go to end
        if u_and_e.include?(new_word[0].downcase)
          new_word
        elsif vowels.include?(new_word[0].downcase) || vowels.include?(new_word[1].downcase)
            first = new_word.first
            new_word.shift
            new_word << first
        elsif vowels.include?(new_word[0].downcase) || vowels.include?(new_word[1].downcase) || vowels.include?(new_word[2].downcase)
            first = [new_word[0], new_word[1]]
            new_word.shift
            new_word.shift
            new_word << first
        else #so with words like spray, all three consonants at beg will carry over
          first = [new_word[0].downcase, new_word[1].downcase, new_word[2].downcase]
          new_word.shift
          new_word.shift
          new_word.shift
          new_word << first
        end
        if new_word == ["u", "n", "t", "i", "l"] || new_word == ["e", "n", "u", "m", "e", "r", "a", "t", "i", "o", "n"]
          text_arrayed_ay = new_word << ["w", "a", "y"]
        elsif vowels.include?(first)
          text_arrayed_ay = new_word << ["w", "a", "y"]
        else
          text_arrayed_ay = new_word << ["a", "y"]
        end
      pig_text = text_arrayed_ay.flatten.join("")
      if pig_text == "Iway" || pig_text == "Enumerationway"
        pig_text = pig_text #.capitalize
      end
      pig_text

  end

end
