---
title: "WheelEvent: thuộc tính deltaX"
short-title: deltaX
slug: Web/API/WheelEvent/deltaX
page-type: web-api-instance-property
browser-compat: api.WheelEvent.deltaX
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`WheelEvent.deltaX`** là một `double` biểu diễn lượng cuộn ngang theo đơn vị {{domxref("WheelEvent.deltaMode")}}.

Bạn phải kiểm tra thuộc tính `deltaMode` để xác định đơn vị của giá trị `deltaX`. Đừng giả định rằng giá trị `deltaX` được chỉ định bằng pixel. Một số trình duyệt, vì lý do tương thích, có thể trả về các đơn vị khác nhau cho giá trị `deltaX` tùy thuộc vào việc `deltaMode` đã được truy cập hay chưa, để phù hợp với các trang web không kiểm tra rõ ràng thuộc tính `deltaMode`.

## Giá trị

Một số.

## Ví dụ

```js
const syntheticEvent = new WheelEvent("syntheticWheel", {
  deltaX: 4,
  deltaMode: 0,
});

console.log(syntheticEvent.deltaX);
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element/wheel_event","wheel")}}
- {{domxref("WheelEvent")}}
