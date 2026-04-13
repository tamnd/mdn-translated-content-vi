---
title: "VideoFrame: allocationSize() method"
short-title: allocationSize()
slug: Web/API/VideoFrame/allocationSize
page-type: web-api-instance-method
browser-compat: api.VideoFrame.allocationSize
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`allocationSize()`** của giao diện {{domxref("VideoFrame")}} trả về số byte cần thiết để chứa video được lọc theo các tùy chọn được truyền vào phương thức.

## Cú pháp

```js-nolint
allocationSize()
allocationSize(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `rect` {{optional_inline}}
      - : Hình chữ nhật của các pixel cần sao chép từ `VideoFrame`. Nếu không được chỉ định, {{domxref("VideoFrame.visibleRect","visibleRect")}} sẽ được dùng. Định dạng là một đối tượng từ điển chứa:
        - `x`: Tọa độ x.
        - `y`: Tọa độ y.
        - `width`: Chiều rộng của khung hình.
        - `height`: Chiều cao của khung hình.
    - `layout` {{optional_inline}}
      - : Danh sách chứa các giá trị sau cho mỗi mặt phẳng trong `VideoFrame`. Các mặt phẳng không được chồng lên nhau. Nếu không được chỉ định, các mặt phẳng sẽ được đóng gói chặt chẽ:
        - `offset`
          - : Một số nguyên đại diện cho độ lệch tính bằng byte nơi mặt phẳng đã cho bắt đầu.
        - `stride`
          - : Một số nguyên đại diện cho số byte, bao gồm phần đệm, được sử dụng bởi mỗi hàng của mặt phẳng.
    - `format` {{Optional_Inline}}
      - : Định dạng pixel cho dữ liệu pixel trong `destination`. Có thể đặt thành `"RGBA"`, `"RGBX"`, `"BGRA"`, `"BGRX"`. Nếu không được chỉ định, {{domxref("VideoFrame.format","format")}} sẽ được dùng.
    - `colorSpace` {{Optional_Inline}}
      - : Chỉ định không gian màu của dữ liệu pixel trong `destination`. Có thể đặt thành `"srgb"` cho [không gian màu sRGB](https://en.wikipedia.org/wiki/SRGB) hoặc `"display-p3"` cho [không gian màu display-p3](https://en.wikipedia.org/wiki/DCI-P3). Chỉ áp dụng cho định dạng pixel RGB. Nếu không được chỉ định, `"srgb"` sẽ được dùng.

### Giá trị trả về

Một số nguyên chứa số byte cần thiết để chứa khung hình được chỉ định bởi `options`.

## Ví dụ

Trong ví dụ sau, `allocationSize` được trả về cho hình chữ nhật ở góc trên bên trái với kích thước 800 x 600.

```js
const videoRect = {
  x: 0,
  y: 0,
  width: 800,
  height: 600,
};
let size = VideoFrame.allocationSize({ rect: videoRect });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
