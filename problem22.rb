"""
Problem 22: Names scores

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names,
begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value
by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is
the 938th name in the list. So, COLIN would obtain a score of 938 x 53 = 49714.

What is the total of all the name scores in the file?
"""

first_names = File.read("data/problem22/names.txt").split(",").map { |quoted| quoted[1..-2] }.sort

ALPHA_VALUE_BASE = "A".ord-1

def alpha_value(string)
  string.chars.map { |c| c.ord - ALPHA_VALUE_BASE  }.reduce(:+)
end

def name_score(first_names, pos)
  pos * alpha_value(first_names[pos-1])
end

def name_scores(first_names)
  (1..first_names.size).map { |pos| name_score(first_names, pos) }
end

raise "Wrong!" unless first_names.size > 5000
raise "Wrong!" unless first_names[937] == "COLIN"
raise "Wrong!" unless alpha_value("COLIN") == 53
raise "Wrong!" unless name_score(first_names, 938) == 49714

puts name_scores(first_names).reduce(:+)