---
title: "VideoColorSpace: matrix property"
short-title: matrix
slug: Web/API/VideoColorSpace/matrix
page-type: web-api-instance-property
browser-compat: api.VideoColorSpace.matrix
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`matrix`** của giao diện {{domxref("VideoColorSpace")}} trả về hệ số ma trận của video. Các hệ số ma trận mô tả mối quan hệ giữa các giá trị thành phần mẫu và tọa độ màu.

## Giá trị

Chuỗi chứa một trong các giá trị sau:

- `"rgb"`
  - : Các hệ số ma trận được sử dụng bởi sRGB.
- `"bt709"`
  - : Các hệ số ma trận được sử dụng bởi BT.709.
- `"bt470bg"`
  - : Các hệ số ma trận được sử dụng bởi BT.601 PAL.
- `"smpte170m"`
  - : Các hệ số ma trận được sử dụng bởi BT.601 NTSC.
- `"bt2020-ncl"`
  - : Các hệ số ma trận được sử dụng bởi BT.2020 NCL.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Giá trị của `matrix` được in ra console.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace.matrix);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
