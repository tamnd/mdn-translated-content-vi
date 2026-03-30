---
title: Type coercion
slug: Glossary/Type_coercion
page-type: glossary-definition
sidebar: glossarysidebar
---

Ép kiểu (Type coercion) là việc chuyển đổi tự động hoặc ngầm định các giá trị từ kiểu dữ liệu này sang kiểu khác (chẳng hạn như chuỗi thành số). _{{Glossary("Type conversion", "Chuyển đổi kiểu")}}_ tương tự như _ép kiểu_ vì cả hai đều chuyển đổi giá trị từ kiểu dữ liệu này sang kiểu khác, với một điểm khác biệt chính — _ép kiểu_ là ngầm định trong khi _chuyển đổi kiểu_ có thể là ngầm định _hoặc_ tường minh.

## Ví dụ

```js
const value1 = "5";
const value2 = 9;
let sum = value1 + value2;

console.log(sum);
```

Trong ví dụ trên, JavaScript đã _ép_ số `9` thành chuỗi và sau đó nối hai giá trị lại với nhau, tạo ra chuỗi `59`. JavaScript có lựa chọn giữa chuỗi hoặc số và đã quyết định sử dụng chuỗi.

Trình biên dịch có thể đã ép `5` thành số và trả về tổng là `14`, nhưng nó đã không làm vậy. Để trả về kết quả này, bạn phải tường minh chuyển đổi `5` thành số bằng phương thức {{jsxref("Global_Objects/Number", "Number()")}}:

```js
sum = Number(value1) + value2;
```

## Xem thêm

- [Type conversion](https://en.wikipedia.org/wiki/Type_conversion) (Wikipedia)
- Các thuật ngữ liên quan:
  - {{Glossary("Type")}}
  - {{Glossary("Type conversion")}}
