---
title: "NamedNodeMap: thuộc tính length"
short-title: length
slug: Web/API/NamedNodeMap/length
page-type: web-api-instance-property
browser-compat: api.NamedNodeMap.length
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("NamedNodeMap")}} là số lượng đối tượng được lưu trữ trong map.

## Giá trị

Một số chứa số lượng đối tượng trong map.

## Ví dụ

```html
<pre class="foo" id="bar" contenteditable></pre>
```

```js
const pre = document.querySelector("pre");
const attrMap = pre.attributes;
pre.textContent = `The 'test' attribute contains ${attrMap.length} attributes.\n`;
```

{{EmbedLiveSample("Example", "100%", 20)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
