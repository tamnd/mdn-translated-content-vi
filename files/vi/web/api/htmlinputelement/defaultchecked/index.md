---
title: "HTMLInputElement: thuộc tính defaultChecked"
short-title: defaultChecked
slug: Web/API/HTMLInputElement/defaultChecked
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.defaultChecked
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`defaultChecked`** của giao diện {{DOMxRef("HTMLInputElement")}} xác định trạng thái được chọn mặc định của phần tử. Thuộc tính này phản ánh thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input#checked) của phần tử {{htmlelement("input")}}.

Thuộc tính boolean [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input#checked) hợp lệ cho các loại đầu vào `radio` ([`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)) và `checkbox` ([`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)). Sự hiện diện của thuộc tính đặt thuộc tính `defaultChecked` thành `true`.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputElement = document.getElementById("contactMail");
console.log(inputElement.defaultChecked);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- Lớp giả {{cssxref(":default")}}
- Lớp giả {{cssxref(":checked")}}
