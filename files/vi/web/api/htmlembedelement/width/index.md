---
title: "HTMLEmbedElement: thuộc tính width"
short-title: width
slug: Web/API/HTMLEmbedElement/width
page-type: web-api-instance-property
browser-compat: api.HTMLEmbedElement.width
---

{{APIRef("HTML DOM")}}

Thuộc tính **`width`** của giao diện {{domxref("HTMLEmbedElement")}} trả về một chuỗi phản ánh thuộc tính `width` của phần tử {{HTMLElement("embed")}}, cho biết chiều rộng hiển thị của tài nguyên tính bằng pixel CSS.

## Giá trị

Một chuỗi cho biết chiều rộng hiển thị của tài nguyên tính bằng pixel CSS.

## Ví dụ

```html
<embed id="el" width="800" height="600" src="https://example.com" />
```

```js
const el = document.getElementById("el");
console.log(el.width); // Kết quả: '800'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.width")}}
- {{domxref("HTMLIFrameElement.width")}}
- {{domxref("HTMLImageElement.width")}}
- {{domxref("HTMLObjectElement.width")}}
- {{domxref("HTMLSourceElement.width")}}
- {{domxref("HTMLVideoElement.width")}}
