---
title: "HTMLLinkElement: thuộc tính media"
short-title: media
slug: Web/API/HTMLLinkElement/media
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.media
---

{{APIRef("HTML DOM")}}

Thuộc tính **`media`** của giao diện {{domxref("HTMLLinkElement")}} là một chuỗi đại diện cho danh sách một hoặc nhiều định dạng phương tiện mà tài nguyên áp dụng.

Nó phản ánh thuộc tính `media` của phần tử {{HTMLElement("link")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<link
  id="el"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  media="screen and (width >= 600px)"
  crossorigin="anonymous" />
```

```js
const el = document.getElementById("el");
console.log(el.media); // Output: "screen and (width >= 600px)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
