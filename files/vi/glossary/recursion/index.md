---
title: Recursion
slug: Glossary/Recursion
page-type: glossary-definition
sidebar: glossarysidebar
---

Đệ quy (recursion) là hành động của một hàm tự gọi chính nó, được dùng để giải quyết các bài toán chứa các bài toán con nhỏ hơn. Một hàm đệ quy có thể nhận hai đầu vào: trường hợp cơ sở (kết thúc đệ quy) hoặc trường hợp đệ quy (tiếp tục đệ quy).

## Ví dụ

### Hàm đệ quy tự gọi cho đến khi điều kiện được thỏa

Đoạn mã Python sau định nghĩa một hàm nhận một số, in nó ra, rồi tự gọi lại với giá trị số giảm đi 1. Nó tiếp tục cho đến khi số bằng 0, lúc đó nó dừng lại.

```python
def recurse(x):
   if x > 0:
       print(x)
       recurse(x - 1)

recurse(10)
```

Kết quả sẽ trông như sau:

```plain
10
9
8
7
6
5
4
3
2
1
```

### Đệ quy bị giới hạn bởi kích thước stack

Đoạn mã sau định nghĩa một hàm trả về kích thước tối đa của call stack khả dụng trong môi trường thực thi JavaScript mà mã đang chạy.

```js
const getMaxCallStackSize = (i) => {
  try {
    return getMaxCallStackSize(++i);
  } catch {
    return i;
  }
};

console.log(getMaxCallStackSize(0));
```

### Các ví dụ sử dụng thông thường

#### Giai thừa

```js
const factorial = (n) => {
  if (n === 0) {
    return 1;
  }
  return n * factorial(n - 1);
};
console.log(factorial(10));
// 3628800
```

#### Fibonacci

```js
const fibonacci = (n) => (n <= 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2));
console.log(fibonacci(10));
// 55
```

#### Reduce

```js
const reduce = (fn, acc, [cur, ...rest]) =>
  cur === undefined ? acc : reduce(fn, fn(acc, cur), rest);
console.log(reduce((a, b) => a + b, 0, [1, 2, 3, 4, 5, 6, 7, 8, 9]));
// 45
```

## Xem thêm

- [Recursion (computer science)](<https://en.wikipedia.org/wiki/Recursion_(computer_science)>) trên Wikipedia
- [Thông tin thêm về đệ quy trong JavaScript](/en-US/docs/Web/JavaScript/Guide/Functions#recursion)
