---
title: "AudioData: phương thức allocationSize()"
short-title: allocationSize()
slug: Web/API/AudioData/allocationSize
page-type: web-api-instance-method
browser-compat: api.AudioData.allocationSize
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`allocationSize()`** của giao diện {{domxref("AudioData")}} trả về kích thước tính bằng byte cần thiết để chứa mẫu hiện tại sau khi được lọc theo các tùy chọn truyền vào phương thức.

## Cú pháp

```js-nolint
allocationSize(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa các thành phần sau:
    - `planeIndex`
      - : Chỉ số của plane mà bạn muốn lấy kích thước.
    - `frameOffset` {{optional_inline}}
      - : Một số nguyên cho biết độ dời vào dữ liệu plane, cho biết bắt đầu từ frame nào. Mặc định là `0`.
    - `frameCount` {{optional_inline}}
      - : Một số nguyên cho biết số lượng frame cần lấy kích thước. Nếu bị bỏ qua thì tất cả frame trong plane sẽ được dùng, bắt đầu từ frame được chỉ định trong `frameOffset`.

### Giá trị trả về

Một số nguyên chứa số byte cần thiết để chứa các mẫu được mô tả bởi `options`.

## Ví dụ

Ví dụ sau lấy kích thước của plane ở chỉ số `1`.

```js
let size = AudioData.allocationSize({ planeIndex: 1 });
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
