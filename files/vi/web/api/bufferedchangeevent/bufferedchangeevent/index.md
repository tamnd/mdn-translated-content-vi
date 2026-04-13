---
title: "BufferedChangeEvent: hàm tạo BufferedChangeEvent()"
short-title: BufferedChangeEvent()
slug: Web/API/BufferedChangeEvent/BufferedChangeEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.BufferedChangeEvent.BufferedChangeEvent
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Hàm tạo **`BufferedChangeEvent()`** của giao diện {{domxref("BufferedChangeEvent")}} tạo một thực thể đối tượng `BufferedChangeEvent` mới.

## Cú pháp

```js-nolint
new BufferedChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi biểu diễn kiểu sự kiện. Trong trường hợp của `BufferedChangeEvent`, giá trị này luôn là `bufferedchange`.
- `options` {{optional_inline}}
  - : Một đối tượng, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}, còn có các thuộc tính sau:

    > [!NOTE]
    > Mặc dù đặc tả đánh dấu `options` là tùy chọn, Safari (hiện là bản triển khai duy nhất) sẽ ném ra `TypeError` nếu đối số này bị bỏ qua hoàn toàn. Truyền vào một đối tượng rỗng (`{}`) sẽ hoạt động chính xác.
    - `addedRanges` {{optional_inline}}
      - : Một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã được thêm vào bộ đệm.
    - `removedRanges` {{optional_inline}}
      - : Một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã bị xóa khỏi bộ đệm.

### Giá trị trả về

Một thực thể đối tượng {{domxref("BufferedChangeEvent")}} mới.

## Ví dụ

### Kiểm tra một sự kiện bufferedchange

Hàm tạo `BufferedChangeEvent()` thường không được gọi thủ công. Khi sự kiện `bufferedchange` của một {{domxref("ManagedSourceBuffer")}} được kích hoạt (nghĩa là các khoảng đã đệm của nó thay đổi), trình duyệt sẽ tạo một đối tượng `BufferedChangeEvent` để dùng làm đối tượng sự kiện.

Các thuộc tính của sự kiện mô tả những gì đã thay đổi:

```js
sourceBuffer.addEventListener("bufferedchange", (event) => {
  console.log(event instanceof BufferedChangeEvent); // true
  console.log(event.type); // "bufferedchange"
  console.log(event.addedRanges); // TimeRanges — các khoảng được thêm vào bộ đệm
  console.log(event.removedRanges); // TimeRanges — các khoảng bị xóa khỏi bộ đệm
});
```

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ManagedSourceBuffer")}}
- Sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}}
