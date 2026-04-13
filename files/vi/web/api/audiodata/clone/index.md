---
title: "AudioData: phương thức clone()"
short-title: clone()
slug: Web/API/AudioData/clone
page-type: web-api-instance-method
browser-compat: api.AudioData.clone
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`clone()`** của giao diện {{domxref("AudioData")}} tạo một đối tượng `AudioData` mới có tham chiếu đến cùng tài nguyên đa phương tiện với đối tượng gốc.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng {{domxref("AudioData")}} bản sao.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu đối tượng `AudioData` đã được [chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Ví dụ

Ví dụ sau tạo một bản sao của `AudioData` thành `audioData2`.

```js
let audioData2 = AudioData.clone();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
