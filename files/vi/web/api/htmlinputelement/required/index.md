---
title: "HTMLInputElement: thuộc tính required"
short-title: required
slug: Web/API/HTMLInputElement/required
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.required
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`required`** của giao diện {{DOMxRef("HTMLInputElement")}} chỉ định rằng người dùng phải điền giá trị trước khi gửi biểu mẫu. Nó phản ánh thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) của phần tử {{htmlelement("input")}}.

Mặc dù thuộc tính boolean HTML `required` bị bỏ qua nếu loại là `hidden`, `range`, `color`, `submit`, `reset`, `button`, và `image`, thuộc tính `required` là `true` cho các loại đầu vào này nếu thuộc tính hiện diện, `false` nếu ngược lại.

Nếu một đầu vào bắt buộc không có giá trị, thuộc tính chỉ đọc {{domxref('ValidityState.valueMissing','valueMissing')}} của đối tượng {{domxref('ValidityState')}} sẽ là true.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputElement = document.getElementById("name");
console.log(inputElement.required);
inputElement.required = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.validity")}}
- Lớp giả {{cssxref(":required")}}
