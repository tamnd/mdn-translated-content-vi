---
title: "ImageDecoder: phương thức decode()"
short-title: decode()
slug: Web/API/ImageDecoder/decode
page-type: web-api-instance-method
browser-compat: api.ImageDecoder.decode
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`decode()`** của giao diện {{domxref("ImageDecoder")}} thêm một thông điệp điều khiển vào hàng đợi để giải mã một khung của hình ảnh.

## Cú pháp

```js-nolint
decode()
decode(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thành viên sau:
    - `frameIndex` {{optional_inline}}
      - : Một số nguyên biểu thị chỉ mục của khung cần giải mã. Mặc định là `0` (khung đầu tiên).
    - `completeFramesOnly` {{optional_inline}}
      - : Một {{jsxref("boolean")}} mặc định là `true`.
        Khi là `true`, Promise được trả về bởi phương thức chỉ được giải quyết khi hình ảnh được giải mã đầy đủ.
        Khi là `false`, phương thức sẽ trả về một Promise mới có thể được giải quyết với một hình ảnh được giải mã một phần.
        Phương thức có thể được gọi lặp đi lặp lại cho đến khi `result.complete` là true, với mỗi bước cung cấp một hình ảnh với mức độ chi tiết tiếp theo có sẵn.

### Giá trị trả về

Một {{jsxref("promise")}} được giải quyết với một đối tượng chứa các thành viên sau:

- `image`
  - : Một {{domxref("VideoFrame")}} chứa hình ảnh đã giải mã.
- `complete`
  - : Một {{jsxref("boolean")}}, nếu là `true` cho biết `image` chứa đầu ra chi tiết đầy đủ cuối cùng.

### Ngoại lệ

Nếu xảy ra lỗi, promise sẽ được giải quyết với ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu bất kỳ điều kiện nào sau đây áp dụng:
    - `close` là true, nghĩa là {{domxref("ImageDecoder.close()","close()")}} đã được gọi.
    - Khung được yêu cầu không tồn tại.

## Ví dụ

### Giải mã đồng bộ một khung hình ảnh đã hoàn thành

Ví dụ sau đây giải mã khung thứ hai (tại chỉ mục `1`) và in {{domxref("VideoFrame")}} kết quả ra console.

```js
let result = await imageDecoder.decode({ frameIndex: 1 });
console.log(result.image);
```

### Giải mã từng phần một khung hình ảnh lũy tiến

Ví dụ sau đây giải mã khung đầu tiên lặp đi lặp lại cho đến khi hoàn thành:

```js
let complete = false;
while (!complete) {
  // The promise returned by `decode()` will only resolve when a new
  // level of detail is available or the frame is complete. I.e.,
  // calling `decode()` in a loop like this won't needlessly spin.
  let result = await imageDecoder.decode({ completeFramesOnly: false });

  // Do something with `result.image`.

  complete = result.complete;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
