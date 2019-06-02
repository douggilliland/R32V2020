; https://github.com/douggilliland/R32V2020/issues/43

label: .string "Hell"
label2: .string "Foo"

lil r8,label.LOWER     ; references 0000
liu r8,label.UPPER     ; references 0000
lil r8,label2.LOWER    ; references 0001
liu r8,label2.UPPER    ; references 0000
