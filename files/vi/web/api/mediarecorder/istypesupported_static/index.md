---
title: "MediaRecorder: phương thức tĩnh isTypeSupported()"
short-title: isTypeSupported()
slug: Web/API/MediaRecorder/isTypeSupported_static
page-type: web-api-static-method
browser-compat: api.MediaRecorder.isTypeSupported_static
---

{{APIRef("MediaStream Recording")}}

Phương thức tĩnh **`isTypeSupported()`** của giao diện {{domxref("MediaRecorder")}} trả về một {{jsxref("Boolean")}} là `true` nếu loại phương tiện MIME được chỉ định là loại mà tác nhân người dùng có thể ghi thành công.

## Cú pháp

```js-nolint
MediaRecorder.isTypeSupported(mimeType)
```

### Tham số

- `mimeType`
  - : Loại phương tiện MIME cần kiểm tra.

### Giá trị trả về

Một {{jsxref("Boolean")}}, `true` nếu cài đặt {{domxref("MediaRecorder")}} có khả năng ghi đối tượng {{domxref("Blob")}} cho loại MIME được chỉ định. Việc ghi vẫn có thể thất bại nếu không đủ tài nguyên để hỗ trợ quá trình ghi và mã hóa. Nếu giá trị là `false`, tác nhân người dùng không có khả năng ghi định dạng được chỉ định.

## Ví dụ

```js
const types = [
  "video/webm",
  "audio/webm",
  "video/webm;codecs=vp8",
  "video/webm;codecs=daala",
  "video/webm;codecs=h264",
  "audio/webm;codecs=opus",
  "video/mp4",
  "video/mp4;codecs=avc1.64003E,mp4a.40.2",
  "video/mp4;codecs=avc1.64003E,opus",
  "video/mp4;codecs=avc3.64003E,mp4a.40.2",
  "video/mp4;codecs=avc3.64003E,opus",
  "video/mp4;codecs=hvc1.1.6.L186.B0,mp4a.40.2",
  "video/mp4;codecs=hvc1.1.6.L186.B0,opus",
  "video/mp4;codecs=hev1.1.6.L186.B0,mp4a.40.2",
  "video/mp4;codecs=hev1.1.6.L186.B0,opus",
  "video/mp4;codecs=av01.0.19M.08,mp4a.40.2",
  "video/mp4;codecs=av01.0.19M.08,opus",
];

for (const type of types) {
  console.log(
    `Is ${type} supported? ${
      MediaRecorder.isTypeSupported(type) ? "Yes!" : "Nope :("
    }`,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
- [Sử dụng MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API/Using_the_MediaStream_Recording_API)
- [Hướng dẫn về loại và định dạng phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Codec trong các loại phương tiện phổ biến](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter)
- {{domxref("MediaStreamTrack")}}
- {{domxref("MediaStream")}}
- {{domxref("MediaCapabilities")}}
