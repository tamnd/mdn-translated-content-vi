---
title: "CSSStyleDeclaration: thuộc tính length"
short-title: length
slug: Web/API/CSSStyleDeclaration/length
page-type: web-api-instance-property
browser-compat: api.CSSStyleDeclaration.length
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc này trả về một số nguyên đại diện cho số lượng khai báo kiểu trong khối khai báo CSS này.

## Giá trị

Một số nguyên cung cấp số lượng kiểu được thiết lập rõ ràng trên phần tử cha của instance.

## Ví dụ

Ví dụ sau đây lấy số lượng kiểu được thiết lập rõ ràng trên phần tử HTML sau:

```html
<div
  id="div1"
  style="margin: 0 10px; background-color: #ccaa11; font-family: monospace"></div>
```

Mã JavaScript:

```js
const myDiv = document.getElementById("div1");
const divStyle = myDiv.style;
const len = divStyle.length; // 6
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
