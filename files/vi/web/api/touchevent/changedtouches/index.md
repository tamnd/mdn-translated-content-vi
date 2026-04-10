---
title: "TouchEvent: thuộc tính changedTouches"
short-title: changedTouches
slug: Web/API/TouchEvent/changedTouches
page-type: web-api-instance-property
browser-compat: api.TouchEvent.changedTouches
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`changedTouches`** là một {{ domxref("TouchList")}} có các điểm chạm (đối tượng {{domxref("Touch")}}) thay đổi tùy theo loại sự kiện, như sau:

- Đối với sự kiện {{domxref("Element/touchstart_event", "touchstart")}}, đây là danh sách các điểm chạm trở nên hoạt động với sự kiện hiện tại.
- Đối với sự kiện {{domxref("Element/touchmove_event", "touchmove")}}, đây là danh sách các điểm chạm đã thay đổi kể từ sự kiện cuối cùng.
- Đối với sự kiện {{domxref("Element/touchend_event", "touchend")}} và {{domxref("Element/touchcancel_event", "touchcancel")}}, đây là danh sách các điểm chạm đã bị xóa khỏi bề mặt (nghĩa là tập hợp các điểm chạm tương ứng với các ngón tay không còn chạm vào bề mặt).

## Giá trị

Một {{ domxref("TouchList")}} có các đối tượng {{ domxref("Touch")}} bao gồm tất cả các điểm chạm đã góp phần vào sự kiện chạm này.

## Ví dụ

Ví dụ này minh họa thuộc tính `TouchEvent.changedTouches` của đối tượng {{domxref("TouchEvent")}}. Thuộc tính `TouchEvent.changedTouches` là một đối tượng {{domxref("TouchList")}} chứa một đối tượng {{domxref("Touch")}} cho mỗi điểm chạm đã góp phần vào sự kiện.

Trong đoạn mã sau, trình xử lý sự kiện {{domxref("Element/touchmove_event", "touchmove")}} lặp qua danh sách `changedTouches` và in ra định danh của mỗi điểm chạm đã thay đổi kể từ sự kiện cuối cùng.

```js
someElement.addEventListener("touchmove", (e) => {
  // Iterate through the list of touch points that changed
  // since the last event and print each touch point's identifier.
  for (let i = 0; i < e.changedTouches.length; i++) {
    console.log(
      `changedTouches[${i}].identifier = ${e.changedTouches[i].identifier}`,
    );
  }
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
