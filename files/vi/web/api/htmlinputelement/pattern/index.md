---
title: "HTMLInputElement: thuộc tính pattern"
short-title: pattern
slug: Web/API/HTMLInputElement/pattern
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.pattern
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`pattern`** của giao diện {{DOMxRef("HTMLInputElement")}} đại diện cho một [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) mà giá trị {{HTMLElement("input")}} khác null phải khớp. Nó phản ánh thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) của phần tử {{htmlelement("input")}}.

Thuộc tính `pattern` hợp lệ cho các loại text, search, url, tel, email và password. Nó định nghĩa một biểu thức chính quy mà {{DOMxRef("HTMLInputElement.value", "value")}} của đầu vào phải khớp để giá trị vượt qua [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

Nếu giá trị khác `null` không phù hợp với các ràng buộc do giá trị `pattern` đặt ra, thuộc tính chỉ đọc {{domxref('ValidityState.patternMismatch','patternMismatch')}} của đối tượng {{domxref('ValidityState')}} sẽ là true.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const inputElement = document.getElementById("year");
console.log(input.pattern);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.value")}}
- [Kiểm tra phía client](/en-US/docs/Web/HTML/Reference/Elements/input#client-side_validation)
- Lớp giả {{CSSXref(":valid")}} và {{CSSXref(":invalid")}}
