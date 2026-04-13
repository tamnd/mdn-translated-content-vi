---
title: "IIRFilterNode: getFrequencyResponse() method"
short-title: getFrequencyResponse()
slug: Web/API/IIRFilterNode/getFrequencyResponse
page-type: web-api-instance-method
browser-compat: api.IIRFilterNode.getFrequencyResponse
---

{{ APIRef("Web Audio API") }}

Phương thức `getFrequencyResponse()` của giao diện {{ domxref("IIRFilterNode") }} lấy các cài đặt của thuật toán lọc hiện tại và tính toán phản hồi tần số cho các tần số được chỉ định trong mảng tần số đã cho.

Hai mảng đầu ra, `magResponseOutput` và `phaseResponseOutput`, phải được tạo trước khi gọi phương thức này; chúng phải có cùng kích thước với mảng các giá trị tần số đầu vào (`frequencyArray`).

## Cú pháp

```js-nolint
getFrequencyResponse(frequencyArray, magResponseOutput, phaseResponseOutput)
```

### Tham số

- `frequencyArray`
  - : Một {{jsxref("Float32Array")}} chứa mảng các tần số, được chỉ định theo Hz, mà bạn muốn lọc.
- `magResponseOutput`
  - : Một {{jsxref("Float32Array")}} để nhận biên độ đã tính toán của phản hồi tần số cho mỗi giá trị tần số trong `frequencyArray`.
- `phaseResponseOutput`
  - : Một {{jsxref("Float32Array")}} để nhận các giá trị phản hồi pha đã tính toán theo radian cho mỗi giá trị tần số trong `frequencyArray` đầu vào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu ba mảng được cung cấp không có cùng độ dài.

## Ví dụ

Trong ví dụ sau đây, chúng ta sử dụng bộ lọc IIR trên một luồng media (để xem bản demo đầy đủ, xem [stream-source-buffer demo](https://mdn.github.io/webaudio-examples/stream-source-buffer/) trực tiếp, hoặc [đọc source code](https://github.com/mdn/webaudio-examples/blob/main/stream-source-buffer/index.html)). Là một phần của demo này, chúng ta lấy phản hồi tần số cho bộ lọc IIR này, cho năm tần số mẫu. Trước tiên chúng ta tạo các đối tượng {{jsxref("Float32Array")}} cần thiết, một chứa các tần số đầu vào và hai để nhận các giá trị biên độ và pha đầu ra:

```js
const myFrequencyArray = new Float32Array(5);
myFrequencyArray[0] = 1000;
myFrequencyArray[1] = 2000;
myFrequencyArray[2] = 3000;
myFrequencyArray[3] = 4000;
myFrequencyArray[4] = 5000;

const magResponseOutput = new Float32Array(5);
const phaseResponseOutput = new Float32Array(5);
```

Tiếp theo, chúng ta tạo phần tử {{ htmlelement("ul") }} trong HTML để chứa kết quả và lấy tham chiếu đến nó trong JavaScript:

```html
<p>IIR filter frequency response for:</p>
<ul class="freq-response-output"></ul>
```

```js
const freqResponseOutput = document.querySelector(".freq-response-output");
```

Cuối cùng, sau khi tạo bộ lọc, chúng ta dùng `getFrequencyResponse()` để tạo dữ liệu phản hồi và đưa vào mảng, sau đó lặp qua từng tập dữ liệu và xuất chúng trong danh sách dễ đọc ở cuối trang:

```js
const feedforwardCoefficients = [0.1, 0.2, 0.3, 0.4, 0.5];
const feedbackCoefficients = [0.5, 0.4, 0.3, 0.2, 0.1];

const iirFilter = audioCtx.createIIRFilter(
  feedforwardCoefficients,
  feedbackCoefficients,
);

// …

function calcFrequencyResponse() {
  iirFilter.getFrequencyResponse(
    myFrequencyArray,
    magResponseOutput,
    phaseResponseOutput,
  );

  for (let i = 0; i < myFrequencyArray.length; i++) {
    const listItem = document.createElement("li");
    listItem.textContent = `${myFrequencyArray[i]}Hz: Magnitude ${magResponseOutput[i]}, Phase ${phaseResponseOutput[i]} radians.`;
    freqResponseOutput.appendChild(listItem);
  }
}

calcFrequencyResponse();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("IIRFilterNode")}}
- {{domxref("AudioNode")}}
