---
title: "VideoColorSpace: transfer property"
short-title: transfer
slug: Web/API/VideoColorSpace/transfer
page-type: web-api-instance-property
browser-compat: api.VideoColorSpace.transfer
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`transfer`** của giao diện {{domxref("VideoColorSpace")}} trả về đặc tính truyền quang-điện tử của video.

## Giá trị

Chuỗi chứa một trong các giá trị sau:

- `"bt709"`
  - : Đặc tính truyền được sử dụng bởi BT.709.
- `"smpte170m"`
  - : Đặc tính truyền được sử dụng bởi BT.601 NTSC.
- `"iec61966-2-1"`
  - : Đặc tính truyền được sử dụng bởi sRGBA.
- `"linear"`
  - : Đặc tính truyền được sử dụng bởi linear RGB.
- `"pq"`
  - : Đặc tính truyền được sử dụng bởi BT.2100 PQ.
- `"hlg"`
  - : Đặc tính truyền được sử dụng bởi BT.2100 HLG.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Giá trị của `transfer` được in ra console.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace.transfer);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
