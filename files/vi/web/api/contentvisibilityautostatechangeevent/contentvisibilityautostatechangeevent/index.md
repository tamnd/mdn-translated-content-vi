---
title: "ContentVisibilityAutoStateChangeEvent: hàm tạo ContentVisibilityAutoStateChangeEvent()"
short-title: ContentVisibilityAutoStateChangeEvent()
slug: Web/API/ContentVisibilityAutoStateChangeEvent/ContentVisibilityAutoStateChangeEvent
page-type: web-api-constructor
browser-compat: api.ContentVisibilityAutoStateChangeEvent.ContentVisibilityAutoStateChangeEvent
---

{{APIRef("CSS Containment")}}

Hàm tạo **`ContentVisibilityAutoStateChangeEvent()`** tạo một thể hiện đối tượng {{domxref("ContentVisibilityAutoStateChangeEvent")}} mới.

## Cú pháp

```js-nolint
new ContentVisibilityAutoStateChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi biểu diễn loại sự kiện. Trong trường hợp của `ContentVisibilityAutoStateChangeEvent`, giá trị này luôn là `event`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `skipped`
      - : Một giá trị boolean, được đặt thành `true` nếu user agent [bỏ qua nội dung của phần tử](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents), hoặc `false` nếu không.

## Ví dụ

Nhà phát triển thường sẽ không dùng hàm tạo này theo cách thủ công. Một đối tượng `ContentVisibilityAutoStateChangeEvent` mới được tạo khi một trình xử lý được gọi do sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}} được kích hoạt.

```js
canvasElem.addEventListener("contentvisibilityautostatechange", (event) => {
  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}
- [CSS Containment](/en-US/docs/Web/CSS/Guides/Containment)
- Thuộc tính {{cssxref("content-visibility")}}
- Thuộc tính {{cssxref("contain")}}
