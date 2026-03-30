---
title: Call stack (Ngăn xếp lời gọi)
slug: Glossary/Call_stack
page-type: glossary-definition
sidebar: glossarysidebar
---

**Call stack** (ngăn xếp lời gọi) là một cơ chế dành cho trình thông dịch (như trình thông dịch JavaScript trong trình duyệt web) để theo dõi vị trí của nó trong một script có gọi nhiều {{glossary("function", "hàm")}} — hàm nào đang được chạy và hàm nào được gọi từ bên trong hàm đó, v.v.

- Khi một script gọi một hàm, trình thông dịch thêm nó vào call stack rồi bắt đầu thực thi hàm.
- Bất kỳ hàm nào được gọi bởi hàm đó đều được thêm vào call stack ở phía trên, và chạy khi đến nơi các lời gọi của chúng được thực hiện.
- Khi hàm hiện tại kết thúc, trình thông dịch lấy nó ra khỏi ngăn xếp và tiếp tục thực thi tại nơi nó đã dừng trong danh sách code cuối cùng.
- Nếu ngăn xếp chiếm nhiều dung lượng hơn mức được phân bổ, lỗi "stack overflow" sẽ được ném ra.

## Ví dụ

```js
function greeting() {
  // [1] Some code here
  sayHi();
  // [2] Some code here
}
function sayHi() {
  return "Hi!";
}

// Invoke the `greeting` function
greeting();

// [3] Some code here
```

Call stack sẽ rỗng ở đầu, và code trên sẽ được thực thi như sau:

1. Bỏ qua tất cả các hàm, cho đến khi đến lời gọi hàm `greeting()`.
2. Thêm hàm `greeting()` vào danh sách call stack, và chúng ta có:

   ```plain
   - greeting
   ```

3. Thực thi tất cả các dòng code bên trong hàm `greeting()`.
4. Đến lời gọi hàm `sayHi()`.
5. Thêm hàm `sayHi()` vào danh sách call stack, như:

   ```plain
   - sayHi
   - greeting
   ```

6. Thực thi tất cả các dòng code bên trong hàm `sayHi()`, cho đến khi đến cuối.
7. Trả về việc thực thi cho dòng đã gọi `sayHi()` và tiếp tục thực thi phần còn lại của hàm `greeting()`.
8. Xóa hàm `sayHi()` khỏi danh sách call stack. Bây giờ call stack trông như:

   ```plain
   - greeting
   ```

9. Khi mọi thứ bên trong hàm `greeting()` đã được thực thi, trả về dòng gọi của nó để tiếp tục thực thi phần còn lại của code JS.
10. Xóa hàm `greeting()` khỏi danh sách call stack. Một lần nữa, call stack trở nên rỗng.

Tóm lại, chúng ta bắt đầu với một Call Stack rỗng. Bất cứ khi nào chúng ta gọi một hàm, nó tự động được thêm vào Call Stack. Khi hàm đã thực thi xong tất cả code của nó, nó tự động bị xóa khỏi Call Stack. Cuối cùng, Stack lại trở nên rỗng.

## Xem thêm

- [Call stack](https://en.wikipedia.org/wiki/Call_stack) trên Wikipedia
- Thuật ngữ liên quan:
  - {{Glossary("Function", "Hàm")}}
