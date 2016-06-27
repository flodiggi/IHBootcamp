class Engine
 def calc(first, second, operation)
   if operation == "addition"
   result = first + second
   sign = "+"
   elsif operation ==  "substraction"
   result = first - second
   sign = "-"
   elsif operation == "multiplication"
   result = first * second
   sign = "*"
   elsif operation == "division"
   result = first /second
   sign = "/"
   end
   return result
 end
 end
