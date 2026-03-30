---
title: Trừu tượng hóa
slug: Glossary/Abstraction
page-type: glossary-definition
sidebar: glossarysidebar
---

**Trừu tượng hóa** (Abstraction) trong {{Glossary("computer programming", "lập trình máy tính")}} là một cách để giảm bớt sự phức tạp và cho phép thiết kế cũng như triển khai hiệu quả trong các hệ thống phần mềm phức tạp. Nó ẩn đi sự phức tạp kỹ thuật của các hệ thống đằng sau những {{Glossary("API", "API")}} đơn giản hơn.

## Ưu điểm của trừu tượng hóa dữ liệu

- Giúp người dùng tránh phải viết code ở mức thấp.
- Tránh trùng lặp code và tăng khả năng tái sử dụng.
- Có thể thay đổi cách triển khai nội bộ của một lớp một cách độc lập mà không ảnh hưởng đến người dùng.
- Giúp tăng cường bảo mật cho ứng dụng hoặc chương trình vì chỉ những chi tiết quan trọng mới được cung cấp cho người dùng.

## Ví dụ

```js
class ImplementAbstraction {
  // method to set values of internal members
  set(x, y) {
    this.a = x;
    this.b = y;
  }

  display() {
    console.log(`a = ${this.a}`);
    console.log(`b = ${this.b}`);
  }
}

const obj = new ImplementAbstraction();
obj.set(10, 20);
obj.display();
// a = 10
// b = 20
```

## Xem thêm

- [Abstraction](<https://en.wikipedia.org/wiki/Abstraction_(computer_science)>) trên Wikipedia
