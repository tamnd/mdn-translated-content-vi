---
title: "TouchEvent: thuộc tính targetTouches"
short-title: targetTouches
slug: Web/API/TouchEvent/targetTouches
page-type: web-api-instance-property
browser-compat: api.TouchEvent.targetTouches
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`targetTouches`** là một {{ domxref("TouchList")}} liệt kê tất cả các đối tượng {{ domxref("Touch")}} cho các điểm chạm vẫn đang tiếp xúc với bề mặt cảm ứng **và** có sự kiện {{domxref("Element/touchstart_event", "touchstart")}} xảy ra bên trong cùng {{ domxref("element")}} mục tiêu như phần tử mục tiêu hiện tại.

## Giá trị

Một {{ domxref("TouchList")}} liệt kê tất cả các đối tượng {{ domxref("Touch")}} cho các điểm chạm vẫn đang tiếp xúc với bề mặt cảm ứng **và** có sự kiện `touchstart` xảy ra bên trong cùng {{ domxref("element")}} mục tiêu như phần tử mục tiêu hiện tại.

## Ví dụ

Ví dụ này minh họa thuộc tính `TouchEvent.targetTouches` của đối tượng {{domxref("TouchEvent")}}. Thuộc tính `TouchEvent.targetTouches` là một đối tượng {{domxref("TouchList")}} bao gồm những điểm chạm hiện đang chạm vào bề mặt _và_ bắt đầu trên phần tử là mục tiêu của sự kiện hiện tại. Như vậy, danh sách `targetTouches` là một tập hợp con chặt chẽ của danh sách `touches`.

Trong đoạn mã sau, hàm so sánh độ dài của danh sách `touches` với độ dài của danh sách `targetTouches` và trả về `true` nếu độ dài bằng nhau và trả về `false` nếu ngược lại.

```js
function touchesInTarget(ev) {
  // Return true if all of the touches are within the target element;
  // otherwise return false.
  return ev.touches.length === ev.targetTouches.length;
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
