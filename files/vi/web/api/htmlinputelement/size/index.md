---
title: "HTMLInputElement: thuộc tính size"
short-title: size
slug: Web/API/HTMLInputElement/size
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.size
---

{{APIRef("HTML DOM")}}

Thuộc tính **`size`** của giao diện {{DOMxRef("HTMLInputElement")}} định nghĩa số ký tự hiển thị. Nó phản ánh thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size) của phần tử {{htmlelement("input")}}.

Thuộc tính `size` chỉ liên quan đến các loại đầu vào [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text), [`search`](/en-US/docs/Web/HTML/Reference/Elements/input/search), [`tel`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), [`email`](/en-US/docs/Web/HTML/Reference/Elements/input/email), [`url`](/en-US/docs/Web/HTML/Reference/Elements/input/url), và [`password`](/en-US/docs/Web/HTML/Reference/Elements/input/password). Giá trị là một số nguyên không âm lớn hơn 0. Nếu bị bỏ qua hoặc không hợp lệ, giá trị là `20`.

## Giá trị

Một số nguyên.

## Ví dụ

```js
const inputElement = document.getElementById("password");
console.log(inputElement.size);
inputElement.size = 12;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMXref("HTMLInputElement.minLength")}}
- {{DOMXref("HTMLInputElement.maxLength")}}
- {{DOMXref("HTMLSelectElement.size")}}
