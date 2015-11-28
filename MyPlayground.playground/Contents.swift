//: Playground - noun: a place where people can play

import UIKit

var str = "HelloPlayground"
print(str.endIndex)
print(str.startIndex)
let str1 = "Hello"
let str2 = "llo"
let str3 = "Heo"
print(str.substringFromIndex(str1.endIndex))//跟子字符串的内容无关, 只跟子字符串的 字符个数 有关
print(str.substringFromIndex(str2.endIndex))//字符串的endIndex等于字符串的字符个数,比字符串
print(str.substringFromIndex(str3.endIndex))//的 最后一个字符 的下标大1
print(str.substringFromIndex(str1.startIndex))
print(str.substringFromIndex(str2.startIndex))
print(str.substringFromIndex(str3.startIndex))
