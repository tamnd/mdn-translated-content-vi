---
title: "MouseEvent: mozInputSource property"
short-title: mozInputSource
slug: Web/API/MouseEvent/mozInputSource
page-type: web-api-instance-property
status:
  - non-standard
---

{{APIRef("Pointer Events")}} {{ Non-standard_header() }}

Thuộc tính chỉ đọc **`MouseEvent.mozInputSource`** trên {{domxref("MouseEvent")}} cung cấp thông tin cho biết loại thiết bị đã tạo ra sự kiện.
Ví dụ: điều này cho phép bạn xác định xem sự kiện chuột được tạo bởi chuột thực hay sự kiện chạm (điều này có thể ảnh hưởng đến mức độ chính xác mà bạn diễn giải tọa độ liên quan đến sự kiện).

## Giá trị

Các giá trị sau đây là có thể.

| Tên hằng              | Giá trị | Mô tả                                                   |
| --------------------- | ------- | ------------------------------------------------------- |
| `MOZ_SOURCE_UNKNOWN`  | 0       | Thiết bị đầu vào không xác định.                        |
| `MOZ_SOURCE_MOUSE`    | 1       | Sự kiện được tạo bởi chuột (hoặc thiết bị giống chuột). |
| `MOZ_SOURCE_PEN`      | 2       | Sự kiện được tạo ra bởi một cây bút trên máy tính bảng. |
| `MOZ_SOURCE_ERASER`   | 3       | Sự kiện được tạo ra bởi một cục tẩy trên máy tính bảng. |
| `MOZ_SOURCE_CURSOR`   | 4       | Sự kiện được tạo ra bởi một con trỏ.                    |
| `MOZ_SOURCE_TOUCH`    | 5       | Sự kiện được tạo trên giao diện cảm ứng.                |
| `MOZ_SOURCE_KEYBOARD` | 6       | Sự kiện được tạo ra bởi bàn phím.                       |

## Thông số kỹ thuật

Không phải là một phần của bất kỳ đặc điểm kỹ thuật.

## Xem thêm

- {{ domxref("MouseEvent") }}
