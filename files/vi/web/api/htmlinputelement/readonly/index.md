---
title: "HTMLInputElement: thuộc tính readOnly"
short-title: readOnly
slug: Web/API/HTMLInputElement/readOnly
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.readOnly
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`readOnly`** của giao diện {{DOMxRef("HTMLInputElement")}} cho biết người dùng không thể sửa đổi giá trị của {{htmlelement("input")}}. Nó phản ánh thuộc tính boolean [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/input#readonly) của phần tử {{htmlelement("input")}}; trả về `true` nếu thuộc tính hiện diện và `false` khi bị bỏ qua.

Không giống như điều khiển biểu mẫu có thuộc tính {{domxref("HTMLInputElement.disabled", "disabled")}} là true, giá trị thuộc tính `readOnly` là true không ngăn người dùng nhấp hoặc chọn trong điều khiển.

Mặc dù thuộc tính HTML `readonly` bị bỏ qua nếu loại là `hidden`, `range`, `color`, `checkbox`, `radio`, `file`, `submit`, `reset`, `button`, và `image`, thuộc tính `readOnly` là `true` cho các loại đầu vào này nếu thuộc tính hiện diện, `false` nếu ngược lại.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputElement = document.getElementById("total");
console.log(inputElement.readOnly);
inputElement.readOnly = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.disabled")}}
- Lớp giả {{cssxref(":read-only")}}
