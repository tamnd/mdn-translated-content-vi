---
title: "TouchList: length property"
short-title: length
slug: Web/API/TouchList/length
page-type: web-api-instance-property
browser-compat: api.TouchList.length
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`length`** chỉ ra số lượng mục (điểm chạm) trong {{domxref("TouchList")}} đã cho.

## Giá trị

Số lượng điểm chạm trong `touchList`.

## Ví dụ

Ví dụ mã này minh họa cách sử dụng phương thức {{domxref("TouchList.item()","item")}} của giao diện {{domxref("TouchList")}} và thuộc tính `length`.

```js
const target = document.getElementById("target");

target.addEventListener("touchstart", (ev) => {
  // Nếu sự kiện touchstart này bắt đầu trên phần tử target,
  // đặt touch thành mục đầu tiên trong danh sách targetTouches;
  // nếu không, đặt touch thành mục đầu tiên trong danh sách touches
  const touch =
    ev.targetTouches.length >= 1
      ? ev.targetTouches.item(0)
      : ev.touches.item(0);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
