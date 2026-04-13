---
title: MediaQueryListEvent.media
slug: Web/API/MediaQueryListEvent/media
page-type: web-api-instance-property
browser-compat: api.MediaQueryListEvent.media
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`media`** của giao diện {{domxref("MediaQueryListEvent")}} là chuỗi đại diện cho một media query được tuần tự hóa.

## Giá trị

Chuỗi đại diện cho một media query được tuần tự hóa.

## Ví dụ

```js
const mql = window.matchMedia("(max-width: 600px)");

function screenTest(e) {
  console.log(e.media); // "(max-width: 600px)"
}

mql.addEventListener("change", screenTest);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Queries](/en-US/docs/Web/CSS/CSS_media_queries/Using_media_queries)
- [Sử dụng media queries từ mã](/en-US/docs/Web/CSS/CSS_media_queries/Testing_media_queries)
- {{domxref("window.matchMedia()")}}
- {{domxref("MediaQueryList")}}
- {{domxref("MediaQueryListEvent")}}
