---
title: "HTMLFormElement: thuộc tính method"
short-title: method
slug: Web/API/HTMLFormElement/method
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.method
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLFormElement.method`** đại diện cho phương thức {{Glossary("HTTP")}} được sử dụng để gửi {{HtmlElement("form")}}.

Trừ khi được chỉ định rõ ràng, phương thức mặc định là 'get'.

## Giá trị

Một chuỗi.

## Ví dụ

```js
document.forms["my-form"].method = "post";

const formElement = document.createElement("form"); // Tạo một biểu mẫu
document.body.appendChild(formElement);
console.log(formElement.method); // 'get'
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
