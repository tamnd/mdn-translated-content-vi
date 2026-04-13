---
title: "HTMLStyleElement: thuộc tính sheet"
short-title: sheet
slug: Web/API/HTMLStyleElement/sheet
page-type: web-api-instance-property
browser-compat: api.HTMLStyleElement.sheet
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`sheet`** của giao diện {{domxref("HTMLStyleElement")}} chứa stylesheet liên quan đến phần tử đó.

Một {{DOMxref("StyleSheet")}} luôn liên quan đến một {{domxref("HTMLStyleElement")}}, trừ khi thuộc tính `type` của nó không phải là `text/css`.

## Giá trị

Một đối tượng {{DOMxRef("StyleSheet")}}, hoặc `null` nếu không có gì liên quan đến phần tử.

## Ví dụ

Giả sử `<head>` chứa những gì sau:

```html
<style id="inline-style">
  p {
    color: blue;
  }
</style>
```

Thuộc tính `sheet` của đối tượng `HTMLStyleElement` liên quan sẽ trả về đối tượng {{domxref("StyleSheet")}} mô tả nó.

```js
const style = document.getElementById("inline-style");
console.log(style.sheet.cssRules[0].cssText); // 'p { color: blue; }'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
