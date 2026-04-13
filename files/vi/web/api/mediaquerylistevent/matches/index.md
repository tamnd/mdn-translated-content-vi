---
title: MediaQueryListEvent.matches
slug: Web/API/MediaQueryListEvent/matches
page-type: web-api-instance-property
browser-compat: api.MediaQueryListEvent.matches
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`matches`** của giao diện {{domxref("MediaQueryListEvent")}} là giá trị boolean `true` nếu {{domxref("document")}} hiện khớp với danh sách media query, hoặc `false` nếu không.

## Giá trị

Giá trị boolean; trả về `true` nếu {{domxref("document")}} hiện khớp với danh sách media query, `false` nếu không.

## Ví dụ

```js
const mql = window.matchMedia("(max-width: 600px)");

function screenTest(e) {
  if (e.matches) {
    // Media query khớp với (max-width: 600px)
    document.body.style.backgroundColor = "red";
  } else {
    // Media query không khớp
    document.body.style.backgroundColor = "blue";
  }
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
