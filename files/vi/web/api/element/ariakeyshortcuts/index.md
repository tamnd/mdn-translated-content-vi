---
title: "Element: thuộc tính ariaKeyShortcuts"
short-title: ariaKeyShortcuts
slug: Web/API/Element/ariaKeyShortcuts
page-type: web-api-instance-property
browser-compat: api.Element.ariaKeyShortcuts
---

{{APIRef("DOM")}}

Thuộc tính **`ariaKeyShortcuts`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính `aria-keyshortcuts`, cho biết các phím tắt bàn phím mà tác giả đã triển khai để kích hoạt hoặc đặt tiêu điểm vào một phần tử.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-keyshortcuts` trên phần tử có ID `skip-link` được đặt thành "Alt+Shift+A". Sử dụng `ariaKeyShortcuts` chúng ta cập nhật giá trị thành "Alt+Shift+M".

```html
<a id="skip-link" href="#content" aria-keyshortcuts="Alt+Shift+A">
  Skip to content
</a>
```

```js
let el = document.getElementById("saveChanges");
console.log(el.ariaKeyShortcuts); // "Alt+Shift+A"
el.ariaKeyShortcuts = "Alt+Shift+M";
console.log(el.ariaKeyShortcuts); // "Alt+Shift+M"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
