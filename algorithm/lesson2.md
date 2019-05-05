ravindrababu ravula Algorithms
==============================

## lesson2

* 时间复杂度的计算分类

1. iterative
2. recursive

### iterative

```cpp
void function(int n)
{
	for(int i = 0; i < n; i++) {
    	// todo something here
	}
}
```

### recursive

```cpp
void function(int n)
{
	if(SomeCondition) {
    	function(n/2);
	}
}
```

### 总结

```txt
递归的核心是把输入集合的规模降下来
这两种模式的时间复杂度是不同的
```
