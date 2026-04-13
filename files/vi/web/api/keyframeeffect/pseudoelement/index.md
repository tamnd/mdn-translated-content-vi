---
title: "KeyframeEffect: thuộc tính pseudoElement"
short-title: pseudoElement
slug: Web/API/KeyframeEffect/pseudoElement
page-type: web-api-instance-property
browser-compat: api.KeyframeEffect.pseudoElement
---

{{ APIRef("Web Animations") }}

Thuộc tính **`pseudoElement`** của giao diện {{domxref("KeyframeEffect")}} là một chuỗi đại diện cho phần tử giả đang được hoạt hình. Có thể là `null` cho các hoạt hình không nhắm mục tiêu vào phần tử giả. Nó hoạt động như cả getter lẫn setter, ngoại trừ với các hoạt hình và transition được tạo bởi CSS.

> [!NOTE]
> Nếu được đặt thành cú pháp dấu hai chấm đơn kế thừa của {{cssxref("::before", ":before")}}, {{cssxref("::after", ":after")}}, {{cssxref("::first-letter", ":first-letter")}}, hoặc {{cssxref("::first-line", ":first-line")}}, chuỗi được chuyển đổi thành phiên bản dấu hai chấm đôi hiện đại ({{cssxref("::before")}}, {{cssxref("::after")}}, {{cssxref("::first-letter")}}, và {{cssxref("::first-line")}}, tương ứng).

## Giá trị

Một chuỗi hoặc `null`.

## Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném khi cố gắng đặt thuộc tính này thành một phần tử, phần tử giả không hợp lệ (không tồn tại hoặc viết sai chính tả). Thuộc tính sau đó được giữ nguyên.

## Ví dụ

```html
<div id="text">Some text</div>
<pre id="log"></pre>
```

```css
#text::after {
  content: "👹";
  display: inline-block; /* Needed as the `transform` property does not apply to inline elements */
  font-size: 2rem;
}
#text::before {
  content: "🤠";
  display: inline-block;
  font-size: 2rem;
}
```

```js
const log = document.getElementById("log");
const text = document.getElementById("text");

// Create the keyframe and launch the animation
const animation = text.animate([{ transform: "rotate(360deg)" }], {
  duration: 3000,
  iterations: Infinity,
  pseudoElement: "::after",
});

// Get the value of KeyframeEffect.pseudoElement
function logPseudoElement() {
  const keyframeEffect = animation.effect;
  log.textContent = `Value of pseudoElement animated: ${keyframeEffect.pseudoElement}`;
  requestAnimationFrame(logPseudoElement);
}

// Every 6 seconds, switch the pseudo-element animated
function switchPseudoElement() {
  const keyframeEffect = animation.effect;
  keyframeEffect.pseudoElement =
    keyframeEffect.pseudoElement === "::after" ? "::before" : "::after";
  setTimeout(switchPseudoElement, 6000);
}

switchPseudoElement();
logPseudoElement();
```

{{EmbedLiveSample("Examples", "100", "90")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- Giao diện {{domxref("KeyframeEffect")}}
- Hàm khởi tạo {{domxref("KeyframeEffect.KeyframeEffect", "KeyframeEffect()")}}
- Thuộc tính {{domxref("KeyframeEffect.target", "target")}}
