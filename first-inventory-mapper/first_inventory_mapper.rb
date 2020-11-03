# Shelf:
# Each unit is considered complete
# Full unit: part ID = "a"

# Stool:
# For a stool to be complete, it requires 1 top and 3 legs
# Top: part ID = "b"
# Legs: part ID = "c"

# Table:
# For a table to be complete, it requires 1 top and 4 legs
# Top: part ID = "d"
# Legs: part ID = "e"

# "abccc" => {"Shelf" : 1, "Stool": 1, "Table": 0}
# "beceadee" => {"Shelf" : 1, "Stool": 0, "Table": 1}
# "eebeedebaceeceedeceacee" => {"Shelf" : 2, "Stool": 1, "Table": 2}
# "zabc" => {"Shelf" : 1, "Stool" : 0, "Table" : 0}
# "deeedeee" => {"Shelf" : 0, "Stool" : 0, "Table" : 1}
