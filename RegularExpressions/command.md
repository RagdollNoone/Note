# Regular Expression(http://www.grymoire.com/Unix/Regular.html)

* There are three important parts to a regular expression.
    - Anchors are used to specify the position of the pattern in relation to a line of text.
    - Character Sets match one or more characters in a single position.
    - Modifiers specify how many times the previous character set is repeated.

## The Anchor Charactors: ^ and $

grep "^A" test.md
> AB

grep "A$" test.md
> BA

grep "A^" test.md
> A^

grep "$A" test.md
> 和预期不一样 所有的字符都被检索出来了 包括BB

grep "^^" test.md
> ^AB

grep "$$" test.md
> 和预期的不一样 什么都没有找到


## Matching a character with a character set

grep "^the" test.md
> the

grep "the$" test.md
> the

grep "the" test.md
> the
> other


## Match any character with .

grep "^.$" test.md
> A
> B
> C


## Specifying a Range of Characters with [...]

### 两者是等价的
grep "^[0123456789]$" test.md
> 1
> 2
> 3

grep "^[0-9]$" test.md
> 1
> 2
> 3

grep "^T[a-z][aeiou]" test.md
> The


## Exceptions in a character set

grep "[]" test.md
> 不匹配 没有对应的字符串

grep "\[\]" test.md
> []

grep "[9]]" test.md
> 9]

grep "[[9]" test.md
> []
> [9
> 9]
> -9
> 9a

grep "[^A-C\^\$0-9]" test.md
> the
> other
> The
> []
> [9
> 9]
> -9
> 9a


## Repeating character sets with *

grep "^[0-9]*" test.md
> 输出了全部的行, 应为所有的行都有0个或多个数字开头

grep "^[0-9]" test.md
> 1
> 2
> 3
> 9]
> 9a

grep "^[0-9][0-9]*" test.md (输出一个或多个数字开头的行)
> 1
> 2
> 3
> 9]
> 9a


## Matching a specific number of sets with \{ and \}

grep "^AA*B" test.md
> AB
> AAAAB

grep "^A\{4\}" test.md (\{4\}用来修饰A的表示重复的次数)
> AAAAB

grep "^A\{1,4\}" test.md
> AB
> A^
> A
> A4B
> A1B
> AAAAB

grep "A\{4,\}" test.md
> AAAAB
> AAAAAB

grep "{1,4}" test.md
> {1,4}

grep "\{1,4\}" test.md
> {1,4}


## Matching words with \< and \>

grep "\<[Tt]he\>" test.md
> The
> the
> the,
> ,The


## Backreferences - Remembering patterns with \(, \) and \1

grep "\([a-z]\)\([a-z]\)[a-z]\1\2" test.md
> radra

grep "\([a-z]\)\([a-z]\)[a-z]\2\1" test.md
> radar


## Extended Regular Expressions
* The character "?" matches 0 or 1 instances of the character set before(same as "\{0,1\}")
* The character "+" matches one or more copies of the character set(same as "\{1,\}")

egrep "^A+" test.md
> AB
> A^
> A
> A4B
> A1B
> AAAAB
> AAAAAB

egrep "^A?" test.md
> 输出了全部的行

## 用来查找的一些表达式

* 搜索一个关键字, 但是不希望匹配到出现在注释 或者System.out这样的输出语句当中
> [^///\*System.out]KeyWordHere

* 搜索一个类的字段
> (^|\.)FieldOfClass([^a-zA-Z_]|$)
