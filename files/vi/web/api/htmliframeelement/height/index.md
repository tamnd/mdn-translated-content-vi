---
title: "HTMLIFrameElement: thuộc tính height"
short-title: height
slug: Web/API/HTMLIFrameElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.height
---

{{APIRef("HTML DOM")}}

Thuộc tính **`height`** của giao diện {{domxref("HTMLIFrameElement")}} trả về một chuỗi phản ánh thuộc tính `height` của phần tử {{HTMLElement("iframe")}}, cho biết chiều cao của khung theo pixel CSS.

## Giá trị

Một chuỗi cho biết chiều cao của khung theo pixel CSS.

## Ví dụ

```html
<iframe id="el" width="800" height="600"></iframe>
```

```js
const el = document.getElementById("el");
console.log(el.height); // Output: '600'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.height")}}
- {{domxref("HTMLEmbedElement.height")}}
- {{domxref("HTMLImageElement.height")}}
- {{domxref("HTMLObjectElement.height")}}
- {{domxref("HTMLSourceElement.height")}}
- {{domxref("HTMLVideoElement.height")}}
