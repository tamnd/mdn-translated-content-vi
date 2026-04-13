---
title: "HTMLSourceElement: thuộc tính media"
short-title: media
slug: Web/API/HTMLSourceElement/media
page-type: web-api-instance-property
browser-compat: api.HTMLSourceElement.media
---

{{APIRef("HTML DOM")}}

Thuộc tính **`media`** của giao diện {{domxref("HTMLSourceElement")}} là một chuỗi đại diện cho phương tiện đích dự định cho tài nguyên. Giá trị là một [truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Using), là danh sách các loại phương tiện, tính năng phương tiện và toán tử logic được phân tách bằng dấu phẩy.

Nó phản ánh thuộc tính `media` của phần tử {{HTMLElement("source")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<video>
  <source
    id="el"
    src="largeVideo.mov"
    type="video/quicktime"
    media="screen and (width >= 600px)" />
</video>
```

```js
const el = document.getElementById("el");
console.log(el.media); // Output: "screen and (width >= 600px)"
el.media = "(width >= 800px)"; // Updates the media value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSourceElement.type")}}
- {{domxref("HTMLSourceElement.sizes")}}
- {{domxref("HTMLSourceElement.src")}}
- {{domxref("HTMLSourceElement.srcset")}}
- {{htmlelement("source")}}
- {{htmlelement("picture")}}
- {{htmlelement("audio")}}
- {{htmlelement("video")}}
- [Sử dụng truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
