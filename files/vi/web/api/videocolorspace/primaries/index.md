---
title: "VideoColorSpace: primaries property"
short-title: primaries
slug: Web/API/VideoColorSpace/primaries
page-type: web-api-instance-property
browser-compat: api.VideoColorSpace.primaries
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`primaries`** của giao diện {{domxref("VideoColorSpace")}} trả về {{glossary("gamut")}} màu của video.

## Giá trị

Chuỗi chứa một trong các giá trị sau:

- `"bt709"`
  - : Màu cơ bản được sử dụng bởi BT.709 và sRGB.
- `"bt470bg"`
  - : Màu cơ bản được sử dụng bởi BT.601 PAL.
- `"smpte170m"`
  - : Màu cơ bản được sử dụng bởi BT.601 NTSC.
- `"bt2020"`
  - : Màu cơ bản được sử dụng bởi BT.2020 và BT.2100.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Giá trị của `primaries` được in ra console.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace.primaries);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
