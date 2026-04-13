---
title: VideoColorSpace
slug: Web/API/VideoColorSpace
page-type: web-api-interface
browser-compat: api.VideoColorSpace
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`VideoColorSpace`** của {{domxref('WebCodecs API','','',' ')}} đại diện cho không gian màu của một video.

## Hàm khởi tạo

- {{domxref("VideoColorSpace.VideoColorSpace", "VideoColorSpace()")}}
  - : Tạo một đối tượng `VideoColorSpace` mới.

## Thuộc tính phiên bản

- {{domxref("VideoColorSpace.primaries")}} {{ReadOnlyInline}}
  - : Chuỗi chứa màu cơ bản mô tả {{glossary("gamut")}} màu của một mẫu video.
- {{domxref("VideoColorSpace.transfer")}}
  - : Chuỗi chứa đặc tính truyền của các mẫu video.
- {{domxref("VideoColorSpace.matrix")}}
  - : Chuỗi chứa các hệ số ma trận mô tả mối quan hệ giữa các giá trị thành phần mẫu và tọa độ màu.
- {{domxref("VideoColorSpace.fullRange")}}
  - : Giá trị {{jsxref("Boolean")}}. Nếu `true` cho biết rằng các giá trị màu đầy đủ dải được sử dụng.

## Phương thức phiên bản

- {{domxref("VideoColorSpace.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `VideoColorSpace`.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Đối tượng này sau đó được in ra console.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
