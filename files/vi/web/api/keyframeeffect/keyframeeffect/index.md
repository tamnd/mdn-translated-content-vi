---
title: "KeyframeEffect: hàm khởi tạo KeyframeEffect()"
short-title: KeyframeEffect()
slug: Web/API/KeyframeEffect/KeyframeEffect
page-type: web-api-constructor
browser-compat: api.KeyframeEffect.KeyframeEffect
---

{{ APIRef("Web Animations") }}

Hàm khởi tạo **`KeyframeEffect()`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một phiên bản đối tượng {{domxref("KeyframeEffect")}} mới, đồng thời cho phép bạn sao chép một phiên bản đối tượng keyframe effect hiện có.

## Cú pháp

```js-nolint
new KeyframeEffect(target, keyframes)
new KeyframeEffect(target, keyframes, options)
new KeyframeEffect(sourceKeyFrames)
```

### Tham số

Hàm khởi tạo nhiều đối số (xem ở trên) tạo một phiên bản đối tượng {{domxref("KeyframeEffect")}} hoàn toàn mới. Các tham số của nó là:

- `target`
  - : Phần tử DOM cần hoạt hình, hoặc `null`.
- `keyframes`
  - : Một [đối tượng keyframes](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats) hoặc `null`.
- `options` {{optional_inline}}
  - : Một số nguyên đại diện cho thời lượng của hoạt hình (tính bằng mili giây), hoặc một đối tượng chứa một hoặc nhiều trong các mục sau:
    - `delay` {{optional_inline}}
      - : Số mili giây để trì hoãn bắt đầu hoạt hình. Mặc định là 0.
    - `direction` {{optional_inline}}
      - : Liệu hoạt hình có chạy tiến (`normal`), lùi (`reverse`), đổi hướng sau mỗi lần lặp (`alternate`), hay chạy lùi và đổi hướng sau mỗi lần lặp (`alternate-reverse`). Mặc định là `"normal"`.
    - `duration` {{optional_inline}}
      - : Số mili giây mỗi lần lặp của hoạt hình cần để hoàn thành. Mặc định là 0. Mặc dù điều này về mặt kỹ thuật là tùy chọn, hãy nhớ rằng hoạt hình của bạn sẽ không chạy nếu giá trị này là 0.
    - `easing` {{optional_inline}}
      - : Tốc độ thay đổi hoạt hình theo thời gian. Chấp nhận {{cssxref("easing-function")}}, chẳng hạn như `"linear"`, `"ease-in"`, `"step-end"` hoặc `"cubic-bezier(0.42, 0, 0.58, 1)"`. Mặc định là `"linear"`.
    - `endDelay` {{optional_inline}}
      - : Số mili giây để trì hoãn sau khi kết thúc hoạt hình. Điều này chủ yếu hữu ích khi sắp xếp các hoạt hình dựa trên thời gian kết thúc của hoạt hình khác. Mặc định là 0.
    - `fill` {{optional_inline}}
      - : Quy định liệu các hiệu ứng của hoạt hình có được phản ánh bởi (các) phần tử trước khi phát (`"backwards"`), được giữ lại sau khi hoạt hình kết thúc phát (`"forwards"`), hay `both`. Mặc định là `"none"`.
    - `iterationStart` {{optional_inline}}
      - : Mô tả tại điểm nào trong lần lặp hoạt hình nên bắt đầu. 0.5 sẽ cho biết bắt đầu ở nửa chừng lần lặp đầu tiên, ví dụ như với giá trị này được đặt, hoạt hình có 2 lần lặp sẽ kết thúc ở nửa chừng lần lặp thứ ba. Mặc định là 0.0.
    - `iterations` {{optional_inline}}
      - : Số lần hoạt hình nên lặp. Mặc định là `1`, và cũng có thể lấy giá trị {{jsxref("Infinity")}} để lặp miễn là phần tử tồn tại.
    - `composite` {{optional_inline}}
      - : Xác định cách các giá trị được kết hợp giữa hoạt hình này và các hoạt hình riêng biệt khác không chỉ định thao tác tổng hợp riêng của chúng. Mặc định là `replace`.
        - `add` quy định hiệu ứng cộng, trong đó mỗi lần lặp tiếp theo xây dựng trên lần trước đó.
        - `accumulate` tương tự nhưng thông minh hơn: `blur(2)` và `blur(5)` trở thành `blur(7)`, không phải `blur(2) blur(5)`.
        - `replace` ghi đè giá trị trước bằng giá trị mới.

    - `iterationComposite` {{optional_inline}}
      - : Xác định cách các giá trị xây dựng từ lần lặp sang lần lặp trong hoạt hình này. Có thể được đặt thành `accumulate` hoặc `replace` (xem ở trên). Mặc định là `replace`.
    - `pseudoElement` {{optional_inline}}
      - : Một `string` chứa bộ chọn {{cssxref("pseudo-elements","phần tử giả")}}, chẳng hạn như `"::before"`. Nếu có, hiệu ứng được áp dụng cho phần tử giả đã chọn của `target`, thay vì cho chính `target`.

Hàm khởi tạo đơn đối số (xem ở trên) tạo bản sao của phiên bản đối tượng {{domxref("KeyframeEffect")}} hiện có. Tham số của nó như sau:

- `sourceKeyFrames`
  - : Một đối tượng {{domxref("KeyframeEffect")}} bạn muốn sao chép.

## Ví dụ

Trong ví dụ sau, hàm khởi tạo KeyframeEffect được sử dụng để tạo tập hợp các keyframe quy định cách biểu tượng cảm xúc nên lăn trên sàn:

```js
const emoji = document.querySelector("div"); // element to animate

const rollingKeyframes = new KeyframeEffect(
  emoji,
  [
    { transform: "translateX(0) rotate(0)" }, // keyframe
    { transform: "translateX(200px) rotate(1.3turn)" }, // keyframe
  ],
  {
    // keyframe options
    duration: 2000,
    direction: "alternate",
    easing: "ease-in-out",
    iterations: "Infinity",
  },
);

const rollingAnimation = new Animation(rollingKeyframes, document.timeline);
rollingAnimation.play();
```

```html
<div>🤣</div>
```

```css hidden
body {
  box-shadow: 0 5px 5px pink;
}

div {
  width: fit-content;
  margin-left: calc(50% - 132px);
  font-size: 64px;
  user-select: none;
  margin-top: 1rem;
}
```

{{ EmbedLiveSample("Examples", "100%", "120") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giao diện KeyframeEffect](/en-US/docs/Web/API/KeyframeEffect)
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
