---
title: "MediaDeviceInfo: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/MediaDeviceInfo/toJSON
page-type: web-api-instance-method
browser-compat: api.MediaDeviceInfo.toJSON
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Phương thức **`toJSON()`** của giao diện {{domxref("MediaDeviceInfo")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("MediaDeviceInfo")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là sự tuần tự hóa của đối tượng {{domxref("MediaDeviceInfo")}}.

### Ví dụ

```js
if (!navigator.mediaDevices || !navigator.mediaDevices.enumerateDevices) {
  console.log("enumerateDevices() not supported.");
} else {
  // List cameras and microphones.
  navigator.mediaDevices
    .enumerateDevices()
    .then((devices) => {
      devices.forEach((device) => {
        console.log(device.toJSON());
      });
    })
    .catch((err) => {
      console.log(`${err.name}: ${err.message}`);
    });
}
```

Kết quả có thể là:

```bash
Object { deviceId: "HJtTemQTM64Bivxv3ZEyKjCi1VR8042lPNpmXKObKJE=", kind: "videoinput", label: "", groupId: "Okm2l1YZTrwy8awTxE8QSLNFoVMdIXx++wLh68tbmv0=" }
Object { deviceId: "EqDubLxPlPeW+5w/ereWTF/3EaAMVHh9QBBHkZHiP0k=", kind: "audioinput", label: "", groupId: "Okm2l1YZTrwy8awTxE8QSLNFoVMdIXx++wLh68tbmv0=" }
Object { deviceId: "CanWttL2RnHOiS7FzzYXMIvLqVFE5S06Lfy8H//nhEw=", kind: "audioinput", label: "", groupId: "nOdLNeXGIw9oL9f2wH69SssQpRVs7cmt9jqZrUWgQwI=" }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
