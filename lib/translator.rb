require "yaml"
require 'pry'

def load_library(path)
  hash = YAML.load_file(path)
  myHash = {
  'get_meaning' => {},
  'get_emoticon' => {}
  }

  hash.each do |key, array|
    myHash['get_meaning'][array[1]] = key
    myHash['get_emoticon'][array[0]] = hash[key][1]
  end
  myHash
end

def get_japanese_emoticon(path, emoticon)
 emote = load_library(path)['get_emoticon'][emoticon]
 if emote == nil
  "Sorry, that emoticon was not found"
 else
  emote
 end
end

def get_english_meaning(path, emoticon)
  meaning = load_library(path)['get_meaning'][emoticon]
  if meaning == nil
    "Sorry, that emoticon was not found"
  else
    meaning
  end
end

# => {"get_meaning"=>
#   {"☜(⌒▽⌒)☞"=>"angel",
#    "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#    "(ΘεΘ;)"=>"bored",
#    "(゜.゜)"=>"confused",
#    "(#^.^#)"=>"embarrased",
#    ">゜))))彡"=>"fish",
#    "(^0_0^)"=>"glasses",
#    "(￣ー￣)"=>"grinning",
#    "(＾ｖ＾)"=>"happy",
#    "(*^3^)/~☆"=>"kiss",
#    "(Ｔ▽Ｔ)"=>"sad",
#    "o_O"=>"surprised",
#    "(^_-)"=>"wink"},
#  "get_emoticon"=>



# => {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
#  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#  "bored"=>[":O", "(ΘεΘ;)"],
#  "confused"=>["%)", "(゜.゜)"],
#  "embarrased"=>[":$", "(#^.^#)"],
#  "fish"=>["><>", ">゜))))彡"],
#  "glasses"=>["8D", "(^0_0^)"],
#  "grinning"=>["=D", "(￣ー￣)"],
#  "happy"=>[":)", "(＾ｖ＾)"],
#  "kiss"=>[":*", "(*^3^)/~☆"],
#  "sad"=>[":'(", "(Ｔ▽Ｔ)"],
#  "surprised"=>[":o", "o_O"],
#  "wink"=>[";)", "(^_-)"]}