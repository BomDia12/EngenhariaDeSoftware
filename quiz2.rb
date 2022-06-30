def read_file
    File.read('engsoft.txt', encoding: 'iso-8859-1').split("\n")
end

def get_matricula_from_line(line)
    line.match(/(\d{2}\/\d{7})/i)
end

def collect_students
    chamada = read_file

    result = []

    chamada.each do |line|
        line.chomp!
        matricula = get_matricula_from_line line
        if matricula
            result << line.strip.gsub("    ", "\t")
        end
    end

    result
end

def sort_students
    students = collect_students

    students.sort_by! { |a| yield(a) } if block_given?

    students
end

puts "==========================================="
puts "=                 Unsorted                ="
puts "==========================================="
puts sort_students 

puts "==========================================="
puts "=          Sorted by Matricula            ="
puts "==========================================="
puts sort_students { |a| a[0] }

puts "==========================================="
puts "=            Sorted by Name               ="
puts "==========================================="
puts sort_students{ |a| a[1] }
