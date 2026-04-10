---
title: "AudioData: phương thức copyTo()"
short-title: copyTo()
slug: Web/API/AudioData/copyTo
page-type: web-api-instance-method
browser-compat: api.AudioData.copyTo
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`copyTo()`** của giao diện {{domxref("AudioData")}} sao chép một mặt phẳng của đối tượng `AudioData` sang một bộ đệm đích.

## Cú pháp

```js-nolint
copyTo(destination, options)
```

### Tham số

- `destination`
  - : Một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}} để sao chép plane vào.
- `options`
  - : Một đối tượng chứa các thành phần sau:
    - `planeIndex`
      - : Chỉ số của mặt phẳng cần sao chép từ đó.
    - `frameOffset` {{optional_inline}}
      - : Một số nguyên cho biết độ lệch vào dữ liệu mặt phẳng, xác định bắt đầu sao chép từ khung mẫu nào. Mặc định là `0`.
    - `frameCount` {{optional_inline}}
      - : Một số nguyên cho biết số khung mẫu cần sao chép. Nếu bị bỏ qua thì tất cả khung mẫu trong mặt phẳng sẽ được sao chép, bắt đầu từ khung mẫu được chỉ định trong `frameOffset`.

### Giá trị trả về

`undefined`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu đối tượng `AudioData` đã được [chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).
- {{jsxref("RangeError")}}
  - : Được ném ra nếu một trong các điều kiện sau được đáp ứng:
    - Độ dài của mẫu lớn hơn độ dài của đích.
    - Định dạng của đối tượng `AudioData` mô tả một định dạng planar, nhưng `options.planeIndex` nằm ngoài số lượng mặt phẳng sẵn có.
    - Định dạng của đối tượng `AudioData` mô tả một định dạng interleaved, nhưng `options.planeIndex` lớn hơn `0`.

## Ví dụ

Ví dụ sau sao chép mặt phẳng ở chỉ số `1` sang một bộ đệm đích.

```js
AudioData.copyTo(AudioBuffer, { planeIndex: 1 });
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
