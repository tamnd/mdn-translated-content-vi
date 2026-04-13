---
title: "SnapEvent: SnapEvent() constructor"
short-title: SnapEvent()
slug: Web/API/SnapEvent/SnapEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.SnapEvent.SnapEvent
---

{{APIRef("Snap Events")}}{{SeeCompatTable}}

Hàm khởi tạo **`SnapEvent()`** tạo một thực thể đối tượng {{domxref("SnapEvent")}} mới.

## Cú pháp

```js-nolint
new SnapEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Đối với sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}, giá trị là `scrollsnapchanging`. Đối với sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}, giá trị là `scrollsnapchange`.
- `init`
  - : Một đối tượng chứa các thuộc tính sau:
    - `snapTargetBlock` {{optional_inline}}
      - : Trả về tham chiếu đến phần tử được snap trong hướng block khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo hướng inline và không có phần tử nào được snap trong hướng block.
    - `snapTargetInline` {{optional_inline}}
      - : Trả về tham chiếu đến phần tử được snap trong hướng inline khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo hướng block và không có phần tử nào được snap trong hướng inline.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `SnapEvent` mới được tạo khi một hàm xử lý được gọi do sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} hoặc {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} kích hoạt.

Ví dụ:

```js
mainElem.addEventListener("scrollsnapchange", (event) => {
  // …

  // Log a SnapEvent object instance to the console
  console.log(event);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}
- Sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}
- [Mô-đun CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
