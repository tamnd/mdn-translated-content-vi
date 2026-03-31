---
title: "null"
slug: Web/JavaScript/Reference/Operators/null
page-type: javascript-language-feature
browser-compat: javascript.operators.null
sidebar: jssidebar
---

Từ khóa **`null`** đề cập đến [giá trị nguyên thủy](/en-US/docs/Glossary/Primitive) [`null`](/en-US/docs/Web/JavaScript/Guide/Data_structures#null_type), đại diện cho sự vắng mặt có chủ ý của bất kỳ giá trị đối tượng nào.

{{InteractiveExample("JavaScript Demo: null")}}

```js interactive-example
function getVowels(str) {
  const m = str.match(/[aeiou]/gi);
  if (m === null) {
    return 0;
  }
  return m.length;
}

console.log(getVowels("sky"));
// Expected output: 0
```

## Cú pháp

```js-nolint
null
```

## Mô tả

Từ khóa `null` là một literal cho giá trị `null`. Không giống như {{jsxref("undefined")}}, là một biến toàn cục, `null` không phải là định danh mà là một từ khóa cú pháp.

`null` có các hành vi sau:

- Giống như `undefined`, truy cập bất kỳ thuộc tính nào trên `null` sẽ ném ra {{jsxref("TypeError")}} thay vì trả về `undefined` hay tìm kiếm trong chuỗi prototype.
- Giống như `undefined`, `null` được xử lý là [falsy](/en-US/docs/Glossary/Falsy) trong các phép toán boolean, và [nullish](/en-US/docs/Glossary/Nullish) cho [nullish coalescing](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing) và [optional chaining](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining).
- Kết quả của [`typeof null`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof#typeof_null) là `"object"`. Đây là một bug trong JavaScript không thể sửa do lo ngại tương thích ngược.
- Không giống như `undefined`, {{jsxref("JSON.stringify()")}} có thể biểu diễn `null` một cách trung thực.

JavaScript có điểm đặc biệt là có hai giá trị nullish: `null` và `undefined`. Về mặt ngữ nghĩa, sự khác biệt giữa chúng rất nhỏ: `undefined` đại diện cho sự vắng mặt của một giá trị, trong khi `null` đại diện cho sự vắng mặt của một _đối tượng_. Ví dụ, cuối cùng của [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) là `null` vì chuỗi prototype được tạo thành từ các đối tượng; {{domxref("document.querySelector()")}} trả về `null` nếu không tìm thấy kết quả khớp, vì nếu có kết quả khớp, kết quả sẽ là một đối tượng. Nếu bạn đang thiết kế API, bạn nên chấp nhận `null` và `undefined` như các đầu vào tương đương, vì nhiều codebase có các quy tắc phong cách về việc sử dụng `null` hay `undefined` theo mặc định.

## Ví dụ

### Sự khác biệt giữa `null` và `undefined`

Khi kiểm tra `null` hoặc `undefined`, hãy chú ý đến [sự khác biệt giữa toán tử bằng (==) và đồng nhất (===)](/en-US/docs/Web/JavaScript/Reference/Operators), vì cái trước thực hiện chuyển đổi kiểu.

```js
typeof null; // "object" (not "null" for legacy reasons)
typeof undefined; // "undefined"
null === undefined; // false
null == undefined; // true
null === null; // true
null == null; // true
!null; // true
Number.isNaN(1 + null); // false
Number.isNaN(1 + undefined); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("undefined")}}
- {{jsxref("NaN")}}
- {{jsxref("Operators/void", "void")}}
