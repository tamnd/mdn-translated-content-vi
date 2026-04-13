---
title: "HTMLIFrameElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLIFrameElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.src
---

{{APIRef("HTML DOM")}}

**`HTMLIFrameElement.src`**
Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src), chứa địa chỉ của nội dung cần được nhúng.

Lưu ý rằng việc xóa thuộc tính src của `<iframe>` theo chương trình (ví dụ: qua {{domxref("Element.removeAttribute()")}}) sẽ khiến `about:blank` được tải vào khung.

## Ví dụ

```js
const iframe = document.createElement("iframe");
iframe.src = "/";
const body = document.querySelector("body");
body.appendChild(iframe); // Lấy image bằng cách sử dụng URL đầy đủ làm referrer
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLEmbedElement.src")}}
- {{DOMxRef("HTMLImageElement.src")}}
- {{DOMxRef("HTMLMediaElement.src")}}
- {{DOMxRef("HTMLScriptElement.src")}}
- {{DOMxRef("HTMLTrackElement.src")}}
