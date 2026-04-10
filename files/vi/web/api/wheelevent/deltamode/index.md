---
title: "WheelEvent: thuộc tính deltaMode"
short-title: deltaMode
slug: Web/API/WheelEvent/deltaMode
page-type: web-api-instance-property
browser-compat: api.WheelEvent.deltaMode
---

{{APIRef("Pointer Events")}}

Thuộc tính chỉ đọc **`WheelEvent.deltaMode`** trả về một `unsigned long` biểu diễn đơn vị của các giá trị delta lượng cuộn. Các giá trị cho phép là:

| Hằng số           | Giá trị | Mô tả                                       |
| ----------------- | ------- | ------------------------------------------- |
| `DOM_DELTA_PIXEL` | `0x00`  | Các giá trị delta được chỉ định bằng pixel. |
| `DOM_DELTA_LINE`  | `0x01`  | Các giá trị delta được chỉ định bằng dòng.  |
| `DOM_DELTA_PAGE`  | `0x02`  | Các giá trị delta được chỉ định bằng trang. |

Bạn phải kiểm tra thuộc tính `deltaMode` để xác định đơn vị của các giá trị `deltaX`, `deltaY` và `deltaZ`. Đừng giả định rằng các giá trị đó được chỉ định bằng pixel. Một số trình duyệt, vì lý do tương thích, có thể trả về các đơn vị khác nhau cho các giá trị `delta*` tùy thuộc vào việc `deltaMode` đã được truy cập hay chưa, để phù hợp với các trang web không kiểm tra rõ ràng thuộc tính `deltaMode`.

## Giá trị

Một `unsigned long`.

## Ví dụ

```js
const syntheticEvent = new WheelEvent("syntheticWheel", {
  deltaX: 4,
  deltaMode: 0,
});

console.log(syntheticEvent.deltaMode);
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element/wheel_event","wheel")}}
- {{domxref("WheelEvent")}}
