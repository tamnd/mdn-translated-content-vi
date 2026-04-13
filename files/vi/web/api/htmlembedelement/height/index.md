---
title: "HTMLEmbedElement: thuộc tính height"
short-title: height
slug: Web/API/HTMLEmbedElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLEmbedElement.height
---

{{APIRef("HTML DOM")}}

Thuộc tính **`height`** của giao diện {{domxref("HTMLEmbedElement")}} trả về một chuỗi phản ánh thuộc tính `height` của phần tử {{HTMLElement("embed")}}, cho biết chiều cao hiển thị của tài nguyên tính bằng pixel CSS.

## Giá trị

Một chuỗi cho biết chiều cao hiển thị của tài nguyên tính bằng pixel CSS.

## Ví dụ

```html
<embed id="el" width="800" height="600" src="https://example.com" />
```

```js
const el = document.getElementById("el");
console.log(el.height); // Kết quả: '600'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.height")}}
- {{domxref("HTMLIFrameElement.height")}}
- {{domxref("HTMLImageElement.height")}}
- {{domxref("HTMLObjectElement.height")}}
- {{domxref("HTMLSourceElement.height")}}
- {{domxref("HTMLVideoElement.height")}}
