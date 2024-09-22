import Prelude

checkTriangle :: Float -> Float -> Float -> Bool
checkTriangle a b c = if a+b>c && a+c>b && b+c>a then True else False

main=print(checkTriangle 3.0 4.0 5.0)