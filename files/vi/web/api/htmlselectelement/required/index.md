---
title: "HTMLSelectElement: thuộc tính required"
short-title: required
slug: Web/API/HTMLSelectElement/required
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.required
---

{{APIRef("HTML DOM")}}

Thuộc tính **`required`** của giao diện {{DOMxRef("HTMLSelectElement")}} chỉ định rằng người dùng phải chọn một tùy chọn có giá trị chuỗi không rỗng trước khi gửi biểu mẫu. Nó phản ánh thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/select#required) của phần tử {{htmlelement("select")}}.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const selectElement = document.getElementById("fruits");
console.log(selectElement.required);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("select")}}
- {{DOMXref("HTMLSelectElement.validity")}}
- {{cssxref(":required")}} pseudo-class
