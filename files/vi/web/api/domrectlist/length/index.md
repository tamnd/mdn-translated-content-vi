---
title: "DOMRectList: thuộc tính length"
short-title: length
slug: Web/API/DOMRectList/length
page-type: web-api-instance-property
browser-compat: api.DOMRectList.length
---

{{APIRef("Geometry Interfaces")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("DOMRectList")}} trả về số lượng đối tượng {{domxref("DOMRect")}} trong danh sách.

## Giá trị

Một số nguyên dương đại diện cho số lượng đối tượng `DOMRect` trong `DOMRectList`. Nếu không có hình chữ nhật nào trong danh sách, `length` là `0`.

## Ví dụ

Trong ví dụ sau, chúng ta lấy danh sách các hình chữ nhật cho một phần tử {{htmlelement("div")}} bằng cách sử dụng {{domxref("Element.getClientRects()")}}. Sau đó chúng ta hiển thị số lượng hình chữ nhật trong danh sách trong một phần tử `<div>` khác trên trang.

Đầu tiên, HTML:

```html
<div id="box"></div>
<div id="output"></div>
```

```css
#box {
  width: 50px;
  height: 20px;
  border: 1px solid black;
}
```

Bây giờ là JavaScript:

```js
const box = document.getElementById("box");
const rects = box.getClientRects();
const output = document.getElementById("output");

output.textContent = `Number of rectangles: ${rects.length}`;
```

Kết quả trông như thế này:

{{ EmbedLiveSample('Examples', '100%', 60) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
