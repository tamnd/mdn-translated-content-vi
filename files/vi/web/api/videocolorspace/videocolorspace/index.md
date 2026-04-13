---
title: "VideoColorSpace: VideoColorSpace() constructor"
short-title: VideoColorSpace()
slug: Web/API/VideoColorSpace/VideoColorSpace
page-type: web-api-constructor
browser-compat: api.VideoColorSpace.VideoColorSpace
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`VideoColorSpace()`** tạo một đối tượng {{domxref("VideoColorSpace")}} mới đại diện cho không gian màu video.

## Cú pháp

```js-nolint
new VideoColorSpace()
new VideoColorSpace(options)
```

### Tham số

Tất cả các giá trị mặc định là `null` khi không có mặt.

- `options` {{optional_inline}}
  - : Đối tượng chứa các thuộc tính sau:
    - `primaries` {{optional_inline}}
      - : Một trong các chuỗi sau:
        - `"bt709"`
        - `"bt470bg"`
        - `"smpte170m"`
    - `transfer` {{optional_inline}}
      - : Một trong các chuỗi sau:
        - `"bt709"`
        - `"smpte170m"`
        - `"iec61966-2-1"`
    - `matrix` {{optional_inline}}
      - : Một trong các chuỗi sau:
        - `"rgb"`
        - `"bt709"`
        - `"bt470bg"`
        - `"smpte170m"`
    - `fullRange` {{optional_inline}}
      - : Giá trị {{jsxref("Boolean")}}, `true` nếu các giá trị màu đầy đủ dải được sử dụng trong video.

## Ví dụ

Ví dụ sau tạo đối tượng `VideoColorSpace` mới với {{domxref("VideoColorSpace.primaries")}} được đặt thành `"bt709"` và `fullRange` được đặt thành `true`.

```js
const options = {
  primaries: "bt709",
  fullRange: true,
};

const colorSpace = new VideoColorSpace(options);
console.log(colorSpace);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
