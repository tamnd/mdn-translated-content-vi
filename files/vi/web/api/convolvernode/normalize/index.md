---
title: "ConvolverNode: thuộc tính normalize"
short-title: normalize
slug: Web/API/ConvolverNode/normalize
page-type: web-api-instance-property
browser-compat: api.ConvolverNode.normalize
---

{{ APIRef("Web Audio API") }}

Thuộc tính `normalize` của giao diện {{ domxref("ConvolverNode") }} là một giá trị boolean điều khiển việc đáp ứng xung từ bộ đệm có được scale bằng phép chuẩn hóa equal-power khi thuộc tính `buffer` được đặt hay không.

Giá trị mặc định của nó là `true` để đạt được mức đầu ra đồng đều hơn từ convolver khi nạp nhiều đáp ứng xung khác nhau. Nếu `normalize` được đặt thành `false`, phép tích chập sẽ được dựng mà không có bước tiền xử lý/scale nào áp dụng cho đáp ứng xung. Các thay đổi đối với giá trị này sẽ không có hiệu lực cho đến lần tiếp theo thuộc tính `buffer` được đặt.

## Giá trị

Một giá trị boolean.

## Ví dụ

### Tắt chuẩn hóa

Ví dụ sau tạo một nút convolver và gán cho nó một {{domxref("AudioBuffer")}}. Trước khi gán bộ đệm âm thanh, nó đặt `normalize` thành `false`.

```js
const audioCtx = new AudioContext();
// …

const convolver = audioCtx.createConvolver();
// …

// Grab audio track via fetch() for convolver node
try {
  const response = await fetch(
    "https://mdn.github.io/voice-change-o-matic/audio/concert-crowd.ogg",
  );
  const arrayBuffer = await response.arrayBuffer();
  const decodedAudio = await audioCtx.decodeAudioData(arrayBuffer);
  convolver.normalize = false; // must be set before the buffer, to take effect
  convolver.buffer = decodedAudio;
} catch (error) {
  console.error(
    `Unable to fetch the audio file: ${name} Error: ${err.message}`,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
