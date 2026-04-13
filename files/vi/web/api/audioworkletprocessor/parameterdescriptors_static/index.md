---
title: "AudioWorkletProcessor: thuộc tính tĩnh parameterDescriptors"
short-title: parameterDescriptors
slug: Web/API/AudioWorkletProcessor/parameterDescriptors_static
page-type: web-api-static-property
spec-urls: https://webaudio.github.io/web-audio-api/#audioworkletprocess-callback-parameters
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`parameterDescriptors`** của một lớp dẫn xuất từ {{domxref("AudioWorkletProcessor")}} là một _getter tĩnh_, trả về một đối tượng có thể lặp gồm các đối tượng dựa trên {{domxref("AudioParamDescriptor")}}.

Thuộc tính này không phải là một phần của giao diện {{domxref("AudioWorkletProcessor")}}, nhưng nếu được định nghĩa thì nó sẽ được hàm khởi tạo {{domxref("AudioWorkletProcessor")}} gọi nội bộ để tạo danh sách các đối tượng {{domxref("AudioParam")}} tùy chỉnh trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của {{domxref("AudioWorkletNode")}} liên kết.

Việc định nghĩa getter này là tùy chọn.

## Giá trị

Một đối tượng có thể lặp gồm các đối tượng dựa trên {{domxref("AudioParamDescriptor")}}. Các thuộc tính của các đối tượng này như sau:

- `name`
  - : Chuỗi biểu diễn tên của `AudioParam`. `AudioParam` sẽ có sẵn dưới tên này trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của nút, và phương thức {{domxref("AudioWorkletProcessor.process")}} cũng sẽ nhận các giá trị đã tính của `AudioParam` này dưới tên đó.
- `automationRate` {{optional_inline}}
  - : Chuỗi [`"a-rate"`](/en-US/docs/Web/API/AudioParam#a-rate) hoặc [`"k-rate"`](/en-US/docs/Web/API/AudioParam#k-rate) biểu diễn tốc độ tự động hóa của `AudioParam` này. Mặc định là `"a-rate"`.
- `minValue` {{optional_inline}}
  - : Một giá trị `float` biểu diễn giá trị nhỏ nhất của `AudioParam`. Mặc định là `-3.4028235e38`.
- `maxValue` {{optional_inline}}
  - : Một giá trị `float` biểu diễn giá trị lớn nhất của `AudioParam`. Mặc định là `3.4028235e38`.
- `defaultValue` {{optional_inline}}
  - : Một giá trị `float` biểu diễn giá trị khởi tạo của `AudioParam`. Mặc định là `0`.

## Ví dụ

Xem [`AudioWorkletNode.parameters`](/en-US/docs/Web/API/AudioWorkletNode/parameters#examples) để xem ví dụ mã cho thấy cách thêm getter tĩnh `parameterDescriptors` vào một `AudioWorkletProcessor` tùy chỉnh.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
