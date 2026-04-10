---
title: "Element: thuộc tính ariaBusy"
short-title: ariaBusy
slug: Web/API/Element/ariaBusy
page-type: web-api-instance-property
browser-compat: api.Element.ariaBusy
---

{{APIRef("DOM")}}

Thuộc tính **`ariaBusy`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy), cho biết liệu một phần tử đang được sửa đổi, vì các công nghệ hỗ trợ có thể muốn đợi cho đến khi các sửa đổi hoàn tất trước khi hiển thị chúng cho người dùng.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"true"`
  - : Phần tử đang được cập nhật.
- `"false"`
  - : Không có cập nhật dự kiến nào cho phần tử.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-busy` trên phần tử có ID `clock` được đặt thành "false". Sử dụng `ariaBusy` chúng ta cập nhật giá trị thành "true".

```html
<div
  id="clock"
  role="timer"
  aria-live="polite"
  aria-atomic="true"
  aria-busy="false"></div>
```

```js
let el = document.getElementById("clock");
console.log(el.ariaBusy); // false
el.ariaBusy = "true";
console.log(el.ariaBusy); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
