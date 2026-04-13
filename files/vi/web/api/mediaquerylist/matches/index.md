---
title: "MediaQueryList: thuộc tính matches"
short-title: matches
slug: Web/API/MediaQueryList/matches
page-type: web-api-instance-property
browser-compat: api.MediaQueryList.matches
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`matches`** của giao diện {{DOMxRef("MediaQueryList")}} là một giá trị boolean trả về `true` nếu {{DOMxRef("document")}} hiện tại khớp với danh sách media query, hoặc `false` nếu không.

Bạn có thể được thông báo khi giá trị của `matches` thay đổi bằng cách theo dõi sự kiện {{domxref("MediaQueryList.change_event", "change")}} được kích hoạt trên `MediaQueryList`.

## Giá trị

Một giá trị boolean là `true` nếu {{DOMxRef("document")}} hiện tại khớp với danh sách media query; nếu không thì là `false`.

## Ví dụ

Ví dụ này phát hiện các thay đổi hướng viewport bằng cách tạo ra media query sử dụng tính năng media {{cssxref("@media/orientation")}}:

```js
const mql = window.matchMedia("(orientation:landscape)");
mql.addEventListener("change", (event) => {
  if (event.matches) {
    console.log("Now in landscape orientation");
  } else {
    console.log("Now in portrait orientation");
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Sử dụng media query từ code](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- {{DOMxRef("window.matchMedia()")}}
- {{DOMxRef("MediaQueryList")}}
- {{DOMxRef("MediaQueryListEvent")}}
