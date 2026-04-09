---
title: "BiquadFilterNode: phương thức getFrequencyResponse()"
short-title: getFrequencyResponse()
slug: Web/API/BiquadFilterNode/getFrequencyResponse
page-type: web-api-instance-method
browser-compat: api.BiquadFilterNode.getFrequencyResponse
---

{{ APIRef("Web Audio API") }}

Phương thức `getFrequencyResponse()` của giao diện {{ domxref("BiquadFilterNode")}} lấy các thiết lập hiện tại của thuật toán lọc và tính đáp ứng tần số cho các tần số được chỉ định trong một mảng tần số xác định.

Hai mảng đầu ra, `magResponseOutput` và `phaseResponseOutput`, phải được tạo trước khi gọi phương thức này; chúng phải có cùng kích thước với mảng giá trị tần số đầu vào (`frequencyArray`).

## Cú pháp

```js-nolint
getFrequencyResponse(frequencyArray, magResponseOutput, phaseResponseOutput)
```

### Tham số

- `frequencyArray`
  - : Một {{jsxref("Float32Array")}} chứa mảng các tần số, được chỉ định theo Hertz, mà bạn muốn lọc.
- `magResponseOutput`
  - : Một {{jsxref("Float32Array")}} nhận các độ lớn đã tính của đáp ứng tần số cho từng giá trị tần số trong `frequencyArray`. Với bất kỳ tần số nào trong `frequencyArray` có giá trị nằm ngoài phạm vi từ 0.0 đến `sampleRate`/2 (trong đó {{domxref("BaseAudioContext/sampleRate", "sampleRate")}} là tốc độ lấy mẫu của {{domxref("AudioContext")}}), giá trị tương ứng trong mảng này sẽ là {{jsxref("NaN")}}. Đây là các giá trị không có đơn vị.
- `phaseResponseOutput`
  - : Một {{jsxref("Float32Array")}} nhận các giá trị đáp ứng pha đã tính theo radian cho từng giá trị tần số trong `frequencyArray` đầu vào. Với bất kỳ tần số nào trong `frequencyArray` có giá trị nằm ngoài phạm vi từ 0.0 đến `sampleRate`/2 (trong đó {{domxref("BaseAudioContext/sampleRate", "sampleRate")}} là tốc độ lấy mẫu của {{domxref("AudioContext")}}), giá trị tương ứng trong mảng này sẽ là {{jsxref("NaN")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidAccessError`
  - : Ba mảng được cung cấp không có cùng độ dài.

## Ví dụ

Trong ví dụ sau, chúng ta dùng một bộ lọc biquad trên một luồng media (để xem toàn bộ bản minh họa, hãy xem trực tiếp [bản demo stream-source-buffer](https://mdn.github.io/webaudio-examples/stream-source-buffer/) của chúng tôi hoặc [đọc mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/stream-source-buffer/index.html).) Là một phần của bản minh họa này, chúng ta lấy đáp ứng tần số của bộ lọc biquad này cho năm tần số mẫu. Trước tiên, chúng ta tạo các {{jsxref("Float32Array")}} cần dùng: một mảng chứa các tần số đầu vào, và hai mảng để nhận các giá trị độ lớn và pha đầu ra:

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

Tiếp theo, chúng ta tạo một phần tử {{ htmlelement("ul") }} trong HTML để chứa kết quả, và lấy tham chiếu đến nó trong JavaScript:

```html
<p>Đáp ứng tần số của bộ lọc biquad cho:</p>
<ul class="freq-response-output"></ul>
```

```js
const freqResponseOutput = document.querySelector(".freq-response-output");
```

Cuối cùng, sau khi tạo bộ lọc biquad, chúng ta dùng `getFrequencyResponse()` để tạo dữ liệu đáp ứng và đưa chúng vào các mảng, sau đó lặp qua từng tập dữ liệu và hiển thị chúng thành một danh sách dễ đọc ở cuối trang:

```js
const biquadFilter = audioCtx.createBiquadFilter();
biquadFilter.type = "lowshelf";
biquadFilter.frequency.value = 1000;
biquadFilter.gain.value = range.value;

// …

function calcFrequencyResponse() {
  biquadFilter.getFrequencyResponse(
    myFrequencyArray,
    magResponseOutput,
    phaseResponseOutput,
  );

  for (let i = 0; i <= myFrequencyArray.length - 1; i++) {
    const listItem = document.createElement("li");
    listItem.textContent = `: Magnitude ${magResponseOutput[i]}, Phase ${phaseResponseOutput[i]} radians.`;
    listItem.insertBefore(
      document.createElement("strong"),
      listItem.firstChild,
    ).textContent = `${myFrequencyArray[i]}Hz`;
    freqResponseOutput.appendChild(listItem);
  }
}

calcFrequencyResponse();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
