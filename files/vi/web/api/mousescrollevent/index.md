---
title: MouseScrollEvent
slug: Web/API/MouseScrollEvent
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.MouseScrollEvent
---

{{APIRef("UI Events")}}{{ Non-standard_Header }}{{Deprecated_Header}}

Giao diện **`MouseScrollEvent`** đại diện cho các sự kiện xảy ra do người dùng di chuyển bánh xe chuột hoặc thiết bị đầu vào tương tự.

> [!WARNING]
> Không sử dụng giao diện này cho các sự kiện bánh xe.
>
> Giống như `MouseWheelEvent`, giao diện này không chuẩn và đã lỗi thời. Nó chỉ được sử dụng trong các trình duyệt dựa trên Gecko. Thay vào đó, hãy sử dụng _{{domxref("WheelEvent")}}_ tiêu chuẩn.

## Các thuộc tính

| Thuộc tính                | Kiểu   | Mô tả                |
| ------------------------- | ------ | -------------------- |
| `axis` {{ReadOnlyInline}} | `long` | Cho biết hướng cuộn. |

## Hằng số

### Chế độ Delta

| Hằng số           | Giá trị | Mô tả                                           |
| ----------------- | ------- | ----------------------------------------------- |
| `HORIZONTAL_AXIS` | `0x01`  | Sự kiện được gây ra bởi thao tác bánh xe ngang. |
| `VERTICAL_AXIS`   | `0x02`  | Sự kiện được gây ra bởi thao tác bánh xe dọc.   |

## Phương thức phiên bản

- `initMouseScrollEvent()`
  - : Xem `nsIDOMMouseScrollEvent::initMouseScrollEvent()`.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- `DOMMouseScroll`
- `MozMousePixelScroll`
- Đối tượng sự kiện bánh xe chuột được chuẩn hóa: {{ domxref("WheelEvent") }}
