---
title: "BaseAudioContext: phương thức createIIRFilter()"
short-title: createIIRFilter()
slug: Web/API/BaseAudioContext/createIIRFilter
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createIIRFilter
---

{{ APIRef("Web Audio API") }}

Phương thức **`createIIRFilter()`** của giao diện {{domxref("BaseAudioContext")}} tạo ra một {{ domxref("IIRFilterNode") }}, biểu diễn một bộ lọc **[infinite impulse response](https://en.wikipedia.org/wiki/Infinite_impulse_response)** (IIR) tổng quát, có thể được cấu hình để hoạt động như nhiều loại bộ lọc khác nhau.

> [!NOTE]
> Hàm dựng {{domxref("IIRFilterNode.IIRFilterNode", "IIRFilterNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("IIRFilterNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createIIRFilter(feedforward, feedback)
```

### Tham số

- `feedforward`
  - : Một mảng các giá trị dấu phẩy động chỉ định các hệ số tiến (tử số) cho hàm truyền của bộ lọc IIR. Độ dài tối đa của mảng này là 20 và ít nhất một giá trị phải khác 0.
- `feedback`
  - : Một mảng các giá trị dấu phẩy động chỉ định các hệ số phản hồi (mẫu số) cho hàm truyền của bộ lọc IIR. Mảng này có thể có tối đa 20 phần tử, trong đó phần tử đầu tiên không được bằng 0.

### Giá trị trả về

Một {{domxref("IIRFilterNode")}} triển khai bộ lọc với các mảng hệ số feedback và feedforward đã chỉ định.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu mọi hệ số `feedforward` đều bằng 0, hoặc nếu hệ số `feedback` đầu tiên bằng 0.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu một hoặc cả hai mảng đầu vào vượt quá 20 phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("IIRFilterNode")}}
- {{domxref("AudioNode")}}
