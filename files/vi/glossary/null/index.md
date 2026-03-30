---
title: "Null"
slug: Glossary/Null
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong khoa học máy tính, giá trị **`null`** biểu diễn một tham chiếu trỏ tới — thường là có chủ ý — một {{glossary("object")}} hoặc địa chỉ không tồn tại hay không hợp lệ. Ý nghĩa của tham chiếu null khác nhau tùy theo từng ngôn ngữ lập trình.

Trong {{Glossary("JavaScript")}}, `null` được xếp vào một trong các {{Glossary("Primitive", "giá trị nguyên thủy")}} vì hành vi của nó có vẻ nguyên thủy. Tuy nhiên, khi sử dụng toán tử [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof), nó trả về `"object"`.

```js
console.log(typeof null); // "object"
```

Đây được coi là [một lỗi](/en-US/docs/Web/JavaScript/Reference/Operators/typeof#typeof_null), nhưng không thể sửa vì sẽ làm hỏng quá nhiều đoạn script hiện có.

## Xem thêm

- [Kiểu dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures)
- Đối tượng toàn cục JavaScript: [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
- [Null pointer](https://en.wikipedia.org/wiki/Null_pointer) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{Glossary("JavaScript")}}
  - {{Glossary("string")}}
  - {{Glossary("number")}}
  - {{Glossary("bigint")}}
  - {{Glossary("boolean")}}
  - {{Glossary("undefined")}}
  - {{Glossary("symbol")}}
