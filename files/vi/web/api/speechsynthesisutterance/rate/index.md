---
title: "SpeechSynthesisUtterance: rate property"
short-title: rate
slug: Web/API/SpeechSynthesisUtterance/rate
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisUtterance.rate
---

{{APIRef("Web Speech API")}}

Thuộc tính **`rate`** của giao diện {{domxref("SpeechSynthesisUtterance")}} lấy và đặt tốc độ mà yêu cầu phát âm sẽ được nói.

Nếu không được đặt, giá trị mặc định là 1 sẽ được dùng.

## Giá trị

Một số thực đại diện cho giá trị tốc độ.
Nó có thể nằm trong khoảng từ 0.1 (thấp nhất) đến 10 (cao nhất), với 1 là tốc độ mặc định cho nền tảng hoặc giọng nói hiện tại, tương ứng với tốc độ nói bình thường.
Các giá trị khác hoạt động như phần trăm tương đối so với giá trị này, ví dụ 2 là nhanh gấp đôi, 0.5 là nửa tốc độ, v.v.

Một số engine tổng hợp giọng nói hoặc giọng nói có thể giới hạn thêm giá trị tối thiểu và tối đa.
Nếu [SSML](https://www.w3.org/TR/speech-synthesis/) được sử dụng, giá trị này sẽ bị ghi đè bởi [các thẻ prosody](https://www.w3.org/TR/speech-synthesis/#S3.2.4) trong markup.

## Ví dụ

### Điều chỉnh tốc độ phát lại

Trong ví dụ này, chúng ta có thể điều chỉnh tốc độ phát lại bằng thanh trượt, sau đó phát yêu cầu phát âm với nút "Play".

#### HTML

```html
<p id="text">It was a dark and stormy night.</p>

<div id="rate-control">
  <label for="rate">Rate:</label>
  <input type="range" min="0.5" max="2" value="1" step="0.1" id="rate" />
</div>

<button id="play">Play</button>
```

#### CSS

```css
body {
  font-family: sans-serif;
}

#rate-control {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin: 1rem 0;
}
```

#### JavaScript

```js
const synth = window.speechSynthesis;

const text = document.querySelector("#text");
const play = document.querySelector("#play");
const rate = document.querySelector("#rate");

function speak() {
  if (synth.speaking) {
    synth.cancel();
  }
  const utterThis = new SpeechSynthesisUtterance(text.textContent);
  utterThis.addEventListener("error", () => {
    console.error("SpeechSynthesisUtterance error");
  });
  utterThis.rate = rate.value;
  synth.speak(utterThis);
}

play.addEventListener("click", speak);
```

#### Kết quả

{{EmbedLiveSample("Adjusting playback rate")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
