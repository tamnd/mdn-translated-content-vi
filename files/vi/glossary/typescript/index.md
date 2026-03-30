---
title: TypeScript
slug: Glossary/TypeScript
page-type: glossary-definition
sidebar: glossarysidebar
---

TypeScript là ngôn ngữ lập trình bổ sung {{glossary("static_typing", "kiểm tra kiểu tĩnh")}} vào JavaScript.

TypeScript là superset của JavaScript, nghĩa là mọi thứ có trong JavaScript cũng có trong TypeScript, và mọi chương trình JavaScript đều là chương trình TypeScript hợp lệ về mặt cú pháp. Ngoài ra, hành vi runtime của TypeScript và JavaScript là giống hệt nhau.

Tuy nhiên, TypeScript bổ sung kiểm tra kiểu tại thời điểm biên dịch, triển khai các quy tắc về cách các kiểu khác nhau có thể được sử dụng và kết hợp. Điều này phát hiện ra nhiều lỗi lập trình mà trong JavaScript chỉ gặp phải lúc runtime.

Một số quy tắc về kiểu được suy luận từ JavaScript. Ví dụ, trong đoạn mã dưới đây, TypeScript suy ra rằng `myVariable` là chuỗi, và sẽ không cho phép nó được gán lại sang kiểu khác:

```js
let myVariable = "Hello World";
myVariable = 1;
// Lỗi:
// Type 'number' is not assignable to type 'string'.
```

TypeScript cũng cho phép lập trình viên chú thích mã của họ, ví dụ để chỉ định kiểu của các tham số cho hàm hoặc thuộc tính của một đối tượng:

```ts
function add(left: number, right: number): number {
  return left + right;
}

add("hello", "world");
// Lỗi:
// Argument of type 'string' is not assignable to parameter of type 'number'.
```

Sau khi biên dịch, các chú thích kiểu bị xóa bỏ, làm cho đầu ra được biên dịch chỉ là JavaScript, nghĩa là nó có thể được thực thi trong bất kỳ runtime JavaScript nào.

## Xem thêm

- [Trang web TypeScript](https://www.typescriptlang.org/)
