---
title: "HTMLIFrameElement: thuộc tính width"
short-title: width
slug: Web/API/HTMLIFrameElement/width
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.width
---

{{APIRef("HTML DOM")}}

Thuộc tính **`width`** của giao diện {{domxref("HTMLIFrameElement")}} trả về một chuỗi phản ánh thuộc tính `width` của phần tử {{HTMLElement("iframe")}}, cho biết chiều rộng của khung theo pixel CSS.

## Giá trị

Một chuỗi cho biết chiều rộng của khung theo pixel CSS.

## Ví dụ

```html
<iframe id="el" width="800" height="600"></iframe>
```

```js
const el = document.getElementById("el");
console.log(el.width); // Output: '800'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.width")}}
- {{domxref("HTMLEmbedElement.width")}}
- {{domxref("HTMLImageElement.width")}}
- {{domxref("HTMLObjectElement.width")}}
- {{domxref("HTMLSourceElement.width")}}
- {{domxref("HTMLVideoElement.width")}}
