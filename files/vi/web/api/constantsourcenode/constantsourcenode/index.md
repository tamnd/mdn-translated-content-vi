---
title: "ConstantSourceNode: hàm tạo ConstantSourceNode()"
short-title: ConstantSourceNode()
slug: Web/API/ConstantSourceNode/ConstantSourceNode
page-type: web-api-constructor
browser-compat: api.ConstantSourceNode.ConstantSourceNode
---

{{APIRef("Web Audio API")}}

Hàm tạo **`ConstantSourceNode()`** tạo một thực thể đối tượng {{domxref("ConstantSourceNode")}} mới, đại diện cho một nguồn âm thanh liên tục xuất ra các mẫu có giá trị luôn giống nhau.

## Cú pháp

```js-nolint
new ConstantSourceNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("AudioContext")}} đại diện cho ngữ cảnh âm thanh mà bạn muốn liên kết nút với nó.
- `options`
  - : Một đối tượng từ điển `ConstantSourceOptions` xác định các thuộc tính mà bạn muốn `ConstantSourceNode` có:
    - `offset`
      - : Một {{domxref("AudioParam")}} chỉ đọc xác định giá trị hằng do nguồn tạo ra. Giá trị mặc định là 1.0. Phạm vi thông thường là từ \-1.0 đến 1.0, nhưng giá trị có thể nằm ở bất kỳ đâu trong khoảng từ `-Infinity` đến `Infinity`.

## Ví dụ

Trong ví dụ này, một ngữ cảnh âm thanh được tạo ra, sau đó một `ConstantSourceNode` được thiết lập với `offset` khởi tạo là 0.5.

```js
let audioContext = new AudioContext();

let myConstantSource = new ConstantSourceNode(audioContext, { offset: 0.5 });
```

> [!NOTE]
> `ConstantSourceNode` mới do hàm tạo này tạo ra có [`channelCount`](/en-US/docs/Web/API/AudioNode/channelCount) bằng 2.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
