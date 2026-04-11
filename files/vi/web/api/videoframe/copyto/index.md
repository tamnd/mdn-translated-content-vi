---
title: "VideoFrame: copyTo() method"
short-title: copyTo()
slug: Web/API/VideoFrame/copyTo
page-type: web-api-instance-method
browser-compat: api.VideoFrame.copyTo
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`copyTo()`** của giao diện {{domxref("VideoFrame")}} sao chép nội dung của `VideoFrame` vào một `ArrayBuffer`.

## Cú pháp

```js-nolint
copyTo(destination)
copyTo(destination, options)
```

### Tham số

- `destination`
  - : Một `ArrayBuffer`, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}} để sao chép vào.
- `options` {{Optional_Inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `rect` {{Optional_Inline}}
      - : Hình chữ nhật của các pixel cần sao chép từ `VideoFrame`. Nếu không được chỉ định, {{domxref("VideoFrame.visibleRect","visibleRect")}} sẽ được dùng. Định dạng là một đối tượng từ điển chứa:
        - `x`: Tọa độ x.
        - `y`: Tọa độ y.
        - `width`: Chiều rộng của khung hình.
        - `height`: Chiều cao của khung hình.
    - `layout` {{Optional_Inline}}
      - : Danh sách chứa các giá trị sau cho mỗi mặt phẳng trong `VideoFrame`:
        - `offset`
          - : Một số nguyên đại diện cho độ lệch tính bằng byte nơi mặt phẳng đã cho bắt đầu.
        - `stride`
          - : Một số nguyên đại diện cho số byte, bao gồm phần đệm, được sử dụng bởi mỗi hàng của mặt phẳng.
            Các mặt phẳng không được chồng lên nhau. Nếu không có `layout` được chỉ định, các mặt phẳng sẽ được đóng gói chặt chẽ.
    - `format` {{Optional_Inline}}
      - : Định dạng pixel cho dữ liệu pixel trong `destination`. Có thể đặt thành `"RGBA"`, `"RGBX"`, `"BGRA"`, `"BGRX"`. Nếu không được chỉ định, {{domxref("VideoFrame.format","format")}} sẽ được dùng.
    - `colorSpace` {{Optional_Inline}}
      - : Chỉ định không gian màu của dữ liệu pixel trong `destination`. Có thể đặt thành `"srgb"` cho [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB) hoặc `"display-p3"` cho [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3). Chỉ áp dụng cho định dạng pixel RGB. Nếu không được chỉ định, `"srgb"` sẽ được dùng.

### Giá trị trả về

Một `Promise` được giải quyết thành bố cục của bản sao khi quá trình sao chép hoàn tất.

## Ví dụ

Ví dụ sau sao chép toàn bộ nội dung của `videoFrame`.

```js
let buffer = new Uint8Array(videoFrame.allocationSize());
let layout = await videoFrame.copyTo(buffer);
```

Ví dụ sau chuyển đổi một phần của `videoFrame` sang định dạng RGB.

```js
const videoRect = {
  x: 100,
  y: 100,
  width: 80,
  height: 60,
};
const options = {
  rect: videoRect,
  format: "RGBX",
  colorSpace: "display-p3",
};
const size = videoFrame.allocationSize(options);
const buffer = new ArrayBuffer(size);
const layout = await videoFrame.copyTo(buffer, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
