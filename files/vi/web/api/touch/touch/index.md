---
title: "Touch: hàm khởi tạo Touch()"
short-title: Touch()
slug: Web/API/Touch/Touch
page-type: web-api-constructor
browser-compat: api.Touch.Touch
---

{{APIRef("Touch Events")}}

Hàm khởi tạo **`Touch()`** tạo một đối tượng {{domxref("Touch")}} mới.

## Cú pháp

```js-nolint
new Touch(options)
```

### Tham số

- `touchInit`
  - : Một đối tượng với các trường sau:
    - `identifier`
      - : Giá trị kiểu `long`, là số định danh cho điểm chạm.
    - `target`
      - : Đối tượng {{domxref("EventTarget")}}, phần tử mà điểm chạm bắt đầu khi lần đầu đặt lên bề mặt.
    - `clientX` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí ngang của điểm chạm trong cửa sổ client của người dùng, không tính offset cuộn.
    - `clientY` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí dọc của điểm chạm trong cửa sổ client của người dùng, không tính offset cuộn.
    - `screenX` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí ngang của điểm chạm trên màn hình người dùng.
    - `screenY` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí dọc của điểm chạm trên màn hình người dùng.
    - `pageX` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí ngang của điểm chạm trong cửa sổ client, bao gồm cả offset cuộn.
    - `pageY` {{optional_inline}}
      - : Mặc định là `0`, kiểu `double`, là vị trí dọc của điểm chạm trong cửa sổ client, bao gồm cả offset cuộn.
    - `radiusX` {{optional_inline}}
      - : Mặc định là `0`, kiểu `float`, là bán kính của hình elip gần nhất bao quanh vùng chạm (ngón tay, stylus) theo trục được chỉ định bởi rotationAngle, tính bằng pixel CSS theo cùng tỷ lệ với screenX; `0` nếu không có thông tin. Giá trị không được âm.
    - `radiusY` {{optional_inline}}
      - : Mặc định là `0`, kiểu `float`, là bán kính của hình elip gần nhất bao quanh vùng chạm theo trục vuông góc với trục được chỉ định bởi rotationAngle, tính bằng pixel CSS theo cùng tỷ lệ với screenY; `0` nếu không có thông tin. Giá trị không được âm.
    - `rotationAngle` {{optional_inline}}
      - : Mặc định là `0`, kiểu `float`, là góc (tính bằng độ) mà hình elip được mô tả bởi radiusX và radiusY xoay theo chiều kim đồng hồ quanh tâm; `0` nếu không có thông tin. Giá trị phải lớn hơn hoặc bằng `0` và nhỏ hơn `90`. Nếu hình elip là hình tròn thì rotationAngle không có tác dụng. Trình duyệt có thể dùng `0` hoặc bất kỳ giá trị nào trong phạm vi cho phép.
    - `force` {{optional_inline}}
      - : Mặc định là `0`, kiểu `float`, là giá trị tương đối của lực ấn, trong khoảng `0` đến `1`, với `0` là không có lực và `1` là lực tối đa thiết bị có thể cảm nhận; `0` nếu không có thông tin.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TouchEvent")}}, giao diện của các đối tượng được tạo bởi hàm này.
