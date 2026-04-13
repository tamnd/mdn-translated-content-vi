---
title: "SVGScriptElement: thuộc tính type"
short-title: type
slug: Web/API/SVGScriptElement/type
page-type: web-api-instance-property
browser-compat: api.SVGScriptElement.type
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("SVGScriptElement")}} phản ánh thuộc tính {{SVGAttr("type")}} của phần tử {{SVGElement("script")}} đã cho.

## Giá trị

Một chuỗi.

## Ví dụ

### Truy cập thuộc tính `type`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <script id="myScript" href="script.js" type="text/javascript"></script>
</svg>
```

```js
const scriptElement = document.getElementById("myScript");

// Truy cập thuộc tính type
console.log(scriptElement.type); // Đầu ra: "text/javascript"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
