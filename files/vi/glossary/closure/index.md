---
title: Closure (Bao đóng)
slug: Glossary/Closure
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong lập trình máy tính, **bao đóng** (closure) là một kỹ thuật để triển khai liên kết tên có phạm vi từ vựng (lexically {{glossary("scope", "scoped")}}) trong một ngôn ngữ có {{glossary("first-class function", "hàm hạng nhất")}}.

Trong {{glossary("JavaScript")}}, một {{glossary("function", "hàm")}} tạo ra ngữ cảnh bao đóng.
Như được minh họa bởi đoạn code sau, hàm bên trong vẫn duy trì khả năng truy cập vào biến `count` ngay cả sau khi `createCounter()` đã kết thúc thực thi.

```js
function createCounter() {
  let count = 0;
  return function () {
    count += 1;
    return count;
  };
}

const counter = createCounter();
console.log(counter()); // 1
console.log(counter()); // 2
console.log(counter()); // 3
```

## Xem thêm

- [Closures trong JavaScript](/en-US/docs/Web/JavaScript/Guide/Closures)
- [Closure](https://en.wikipedia.org/wiki/Closure_%28computer_programming%29) trên Wikipedia
