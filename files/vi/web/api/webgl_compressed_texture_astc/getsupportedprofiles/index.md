---
title: "WEBGL_compressed_texture_astc: phương thức getSupportedProfiles()"
short-title: getSupportedProfiles()
slug: Web/API/WEBGL_compressed_texture_astc/getSupportedProfiles
page-type: webgl-extension-method
browser-compat: api.WEBGL_compressed_texture_astc.getSupportedProfiles
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_compressed_texture_astc.getSupportedProfiles()`**
trả về một mảng chuỗi chứa tên của các profile ASTC được hỗ trợ bởi triển khai.

## Cú pháp

```js-nolint
getSupportedProfiles()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} các phần tử chuỗi cho biết các profile ASTC nào
được hỗ trợ bởi triển khai. Hiện tại, có thể là:

- "ldr": Dải động thấp (Low Dynamic Range).
- "hdr": Dải động cao (High Dynamic Range).

Dải động đề cập đến tỷ lệ giữa phần sáng nhất và tối nhất của cảnh. Dải động thấp
ví dụ như ảnh định dạng JPEG không vượt quá 255:1, hoặc màn hình CRT không vượt quá 100:1. Ảnh HDR lưu trữ giá trị pixel bao phủ toàn bộ dải tông màu của cảnh thực (100.000:1).

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_compressed_texture_astc");
ext.getSupportedProfiles(); // ["ldr"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WEBGL_compressed_texture_astc")}}
