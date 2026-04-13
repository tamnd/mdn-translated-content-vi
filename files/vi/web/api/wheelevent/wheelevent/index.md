---
title: "WheelEvent: hàm tạo WheelEvent()"
short-title: WheelEvent()
slug: Web/API/WheelEvent/WheelEvent
page-type: web-api-constructor
browser-compat: api.WheelEvent.WheelEvent
---

{{APIRef("Pointer Events")}}

Hàm tạo **`WheelEvent()`** trả về một đối tượng {{domxref("WheelEvent")}} mới.

> [!NOTE]
> Nếu bạn tạo một sự kiện tổng hợp bằng hàm tạo này, sự kiện đó sẽ không được _đáng tin cậy_, vì lý do bảo mật.
> Chỉ các đối tượng `WheelEvent` do trình duyệt tạo mới đáng tin cậy và chỉ các sự kiện đáng tin cậy mới kích hoạt các hành động mặc định.

## Cú pháp

```js-nolint
new WheelEvent(type)
new WheelEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt thành `wheel`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("MouseEvent/MouseEvent", "MouseEvent()")}}_, có thể có các thuộc tính sau:
    - `deltaX` {{optional_inline}}
      - : Một số thực biểu diễn lượng cuộn ngang theo đơn vị `deltaMode`.
        Giá trị mặc định là `0.0`.
    - `deltaY` {{optional_inline}}
      - : Một số thực biểu diễn lượng cuộn dọc theo đơn vị `deltaMode`.
        Giá trị mặc định là `0.0`.
    - `deltaZ` {{optional_inline}}
      - : Một số thực biểu diễn lượng cuộn cho trục z theo đơn vị `deltaMode`.
        Giá trị mặc định là `0.0`.
    - `deltaMode` {{optional_inline}}
      - : Một số nguyên biểu diễn đơn vị của các giá trị delta lượng cuộn. Giá trị mặc định là `0x00`. Các giá trị cho phép là:

        | Hằng số           | Giá trị | Mô tả                                       |
        | ----------------- | ------- | ------------------------------------------- |
        | `DOM_DELTA_PIXEL` | `0x00`  | Các giá trị delta được chỉ định bằng pixel. |
        | `DOM_DELTA_LINE`  | `0x01`  | Các giá trị delta được chỉ định bằng dòng.  |
        | `DOM_DELTA_PAGE`  | `0x02`  | Các giá trị delta được chỉ định bằng trang. |

### Giá trị trả về

Một đối tượng {{domxref("WheelEvent")}} mới.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WheelEvent")}} mà nó thuộc về.
