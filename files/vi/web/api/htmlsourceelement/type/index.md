---
title: "HTMLSourceElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLSourceElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.type
---

{{APIRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLSourceElement")}} là một chuỗi đại diện cho {{glossary("MIME type")}} của tài nguyên phương tiện.

Nó phản ánh thuộc tính `type` của phần tử {{HTMLElement("source")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<video>
  <source
    id="el"
    src="large.webp"
    type="video/webp"
    media="screen and (width >= 600px)" />
</video>
```

```js
const el = document.getElementById("el");
console.log(el.type); // Output: "video/webp"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSourceElement.src")}}
- {{domxref("HTMLSourceElement.srcset")}}
- {{domxref("HTMLSourceElement.media")}}
- {{domxref("HTMLSourceElement.sizes")}}
- {{htmlelement("source")}}
- {{htmlelement("picture")}}
- {{htmlelement("audio")}}
- {{htmlelement("video")}}
- [Các loại phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Các loại MIME quan trọng cho nhà phát triển web](/en-US/docs/Web/HTTP/Guides/MIME_types#important_mime_types_for_web_developers)
- [Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API)
