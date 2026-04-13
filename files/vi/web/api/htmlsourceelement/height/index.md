---
title: "HTMLSourceElement: thuộc tính height"
short-title: height
slug: Web/API/HTMLSourceElement/height
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.height
---

{{APIRef("HTML DOM")}}

Thuộc tính **`height`** của giao diện {{domxref("HTMLSourceElement")}} là một số không âm cho biết chiều cao của tài nguyên hình ảnh tính bằng pixel CSS.

Thuộc tính chỉ có tác dụng nếu phần tử cha của {{HTMLElement("source")}} hiện tại là phần tử {{HTMLElement("picture")}}.

Nó phản ánh thuộc tính `height` của phần tử {{HTMLElement("source")}}.

## Giá trị

Một số không âm cho biết chiều cao của tài nguyên hình ảnh tính bằng pixel CSS.

## Ví dụ

```html
<picture id="img">
  <source
    srcset="landscape.png"
    media="(width >= 1000px)"
    width="1000"
    height="400" />
  <source
    srcset="square.png"
    media="(width >= 800px)"
    width="800"
    height="800" />
  <source
    srcset="portrait.png"
    media="(width >= 600px)"
    width="600"
    height="800" />
  <img
    src="fallback.png"
    alt="Image used when the browser does not support the sources"
    width="500"
    height="400" />
</picture>
```

```js
const img = document.getElementById("img");
const sources = img.querySelectorAll("source");
console.log(Array.from(sources).map((el) => el.height)); // Output: [400, 800, 800]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.height")}}
- {{domxref("HTMLEmbedElement.height")}}
- {{domxref("HTMLIFrameElement.height")}}
- {{domxref("HTMLImageElement.height")}}
- {{domxref("HTMLObjectElement.height")}}
- {{domxref("HTMLVideoElement.height")}}
