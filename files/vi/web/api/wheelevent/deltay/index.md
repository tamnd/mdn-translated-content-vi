---
title: "WheelEvent: thuộc tính deltaY"
short-title: deltaY
slug: Web/API/WheelEvent/deltaY
page-type: web-api-instance-property
browser-compat: api.WheelEvent.deltaY
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`WheelEvent.deltaY`** là một `double` biểu diễn lượng cuộn dọc theo đơn vị {{domxref("WheelEvent.deltaMode")}}.

Bạn phải kiểm tra thuộc tính `deltaMode` để xác định đơn vị của giá trị `deltaY`. Đừng giả định rằng giá trị `deltaY` được chỉ định bằng pixel. Một số trình duyệt, vì lý do tương thích, có thể trả về các đơn vị khác nhau cho giá trị `deltaY` tùy thuộc vào việc `deltaMode` đã được truy cập hay chưa, để phù hợp với các trang web không kiểm tra rõ ràng thuộc tính `deltaMode`.

## Giá trị

Một số.

## Ví dụ

```js
const syntheticEvent = new WheelEvent("syntheticWheel", {
  deltaY: 4,
  deltaMode: 0,
});

console.log(syntheticEvent.deltaY);
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element/wheel_event","wheel")}}
- {{domxref("WheelEvent")}}
