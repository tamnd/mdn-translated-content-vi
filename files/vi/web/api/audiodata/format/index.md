---
title: "AudioData: thuộc tính format"
short-title: format
slug: Web/API/AudioData/format
page-type: web-api-instance-property
browser-compat: api.AudioData.format
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`format`** của giao diện {{domxref("AudioData")}} trả về định dạng mẫu của đối tượng `AudioData`.

## Giá trị

Một chuỗi. Một trong các giá trị sau:

- `"u8"`
  - : Các mẫu số nguyên không dấu 8 bit, ở định dạng xen kẽ.
- `"s16"`
  - : Các mẫu số nguyên có dấu 16 bit, ở định dạng xen kẽ.
- `"s32"`
  - : Các mẫu số nguyên có dấu 32 bit, ở định dạng xen kẽ.
- `"f32"`
  - : Các mẫu số thực dấu phẩy động 32 bit, ở định dạng xen kẽ.
- `"u8-planar"`
  - : Các mẫu số nguyên không dấu 8 bit, ở định dạng phẳng.
- `"s16-planar"`
  - : Các mẫu số nguyên có dấu 16 bit, ở định dạng phẳng.
- `"s32-planar"`
  - : Các mẫu số nguyên có dấu 32 bit, ở định dạng phẳng.
- `"f32-planar"`
  - : Các mẫu số thực dấu phẩy động 32 bit, ở định dạng phẳng.

## Ví dụ

Ví dụ dưới đây in giá trị của `format` ra console.

```js
console.log(AudioData.format);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
