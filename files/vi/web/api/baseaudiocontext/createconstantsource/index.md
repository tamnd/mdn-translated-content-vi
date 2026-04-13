---
title: "BaseAudioContext: phương thức createConstantSource()"
short-title: createConstantSource()
slug: Web/API/BaseAudioContext/createConstantSource
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createConstantSource
---

{{APIRef("Web Audio API")}}

Phương thức **`createConstantSource()`**
của giao diện {{domxref("BaseAudioContext")}} tạo một đối tượng
{{domxref("ConstantSourceNode")}}, là một nguồn âm thanh liên tục xuất ra một tín hiệu
âm thanh đơn âm (một kênh) mà mọi mẫu đều có cùng một giá trị.

> [!NOTE]
> Hàm dựng {{domxref("ConstantSourceNode.ConstantSourceNode", "ConstantSourceNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("ConstantSourceNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createConstantSource()
```

### Tham số

Không có.

### Giá trị trả về

Một thể hiện {{domxref('ConstantSourceNode')}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
