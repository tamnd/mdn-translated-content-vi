---
title: "HTMLSourceElement: thuộc tính width"
short-title: width
slug: Web/API/HTMLSourceElement/width
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.width
---

{{APIRef("HTML DOM")}}

Thuộc tính **`width`** của giao diện {{domxref("HTMLSourceElement")}} là một số không âm cho biết chiều rộng của tài nguyên hình ảnh tính bằng pixel CSS.

Thuộc tính này chỉ có hiệu lực khi phần tử cha của phần tử {{HTMLElement("source")}} hiện tại là phần tử {{HTMLElement("picture")}}.

Nó phản ánh thuộc tính `width` của phần tử {{HTMLElement("source")}}.

## Giá trị

Một số không âm cho biết chiều rộng của tài nguyên hình ảnh tính bằng pixel CSS.

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
console.log(Array.from(sources).map((el) => el.width)); // Output: [1000, 800, 600]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.width")}}
- {{domxref("HTMLEmbedElement.width")}}
- {{domxref("HTMLIFrameElement.width")}}
- {{domxref("HTMLImageElement.width")}}
- {{domxref("HTMLObjectElement.width")}}
- {{domxref("HTMLVideoElement.width")}}
