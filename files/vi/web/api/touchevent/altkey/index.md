---
title: "TouchEvent: thuộc tính altKey"
short-title: altKey
slug: Web/API/TouchEvent/altKey
page-type: web-api-instance-property
browser-compat: api.TouchEvent.altKey
---

{{APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`altKey`** của giao diện {{domxref("TouchEvent")}} trả về một giá trị boolean cho biết phím <kbd>alt</kbd> (Alternate) có được bật hay không khi sự kiện chạm được tạo. Nếu phím <kbd>alt</kbd> được bật, giá trị của thuộc tính là `true`. Nếu không, giá trị là `false`.

Thuộc tính này là {{ReadOnlyInline}}.

## Giá trị

Một giá trị boolean là `true` nếu phím <kbd>alt</kbd> được bật cho sự kiện này; và `false` nếu phím <kbd>alt</kbd> không được bật.

## Ví dụ

Ví dụ này minh họa cách truy cập các thuộc tính bổ trợ phím của {{domxref("TouchEvent")}}: `TouchEvent.altKey`, {{domxref("TouchEvent.ctrlKey")}}, {{domxref("TouchEvent.metaKey")}} và {{domxref("TouchEvent.shiftKey")}}.

Trong đoạn mã sau, trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} ghi nhật ký trạng thái các phím bổ trợ của sự kiện.

```js
someElement.addEventListener("touchstart", (e) => {
  // Log the state of this event's modifier keys
  console.log(`altKey = ${e.altKey}`);
  console.log(`ctrlKey = ${e.ctrlKey}`);
  console.log(`metaKey = ${e.metaKey}`);
  console.log(`shiftKey = ${e.shiftKey}`);
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
