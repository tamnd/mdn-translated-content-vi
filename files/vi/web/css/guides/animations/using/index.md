---
title: Using CSS animations
short-title: Using animations
slug: Web/CSS/Guides/Animations/Using
page-type: guide
sidebar: cssref
---

**CSS animations** cho phép tạo hiệu ứng chuyển đổi từ cấu hình CSS style này sang cấu hình khác. Animations bao gồm hai thành phần: một style mô tả CSS animation và một tập hợp các keyframe chỉ định trạng thái đầu và cuối của style animation, cũng như các điểm trung gian tùy chọn.

Có ba ưu điểm chính của CSS animations so với các kỹ thuật animation truyền thống dựa trên script:

1. Bạn có thể tạo các animation cơ bản chỉ với vài dòng CSS; không cần JavaScript.
2. Animations chạy tốt, ngay cả khi hệ thống chịu tải vừa phải. Các animation đơn giản thường hoạt động kém hiệu quả trong JavaScript. Rendering engine có thể dùng frame-skipping và các kỹ thuật khác để giữ hiệu suất mượt mà nhất có thể.
3. Để trình duyệt kiểm soát chuỗi animation giúp trình duyệt tối ưu hóa hiệu suất, ví dụ như giảm tần suất cập nhật các animation đang chạy trong các tab không hiển thị.

## Cấu hình animation

Để tạo một chuỗi CSS animation, bạn áp dụng style cho phần tử muốn animate bằng thuộc tính {{cssxref("animation")}} hoặc các sub-properties của nó. Điều này cho phép bạn cấu hình timing, duration và các chi tiết khác về cách chuỗi animation diễn ra. Điều này **không** cấu hình diện mạo thực tế của animation, vốn được thực hiện bằng at-rule {{cssxref("@keyframes")}} như mô tả trong phần [Định nghĩa chuỗi animation bằng keyframes](#defining_an_animation_sequence_using_keyframes) bên dưới.

Các sub-properties của thuộc tính {{cssxref("animation")}} gồm:

- {{cssxref("animation-composition")}}
  - : Chỉ định {{Glossary("composite operation")}} dùng khi nhiều animation ảnh hưởng đến cùng một thuộc tính đồng thời. Thuộc tính này không nằm trong shorthand property `animation`.
- {{cssxref("animation-delay")}}
  - : Chỉ định độ trễ giữa lúc phần tử tải xong và lúc bắt đầu chuỗi animation, cũng như liệu animation có nên bắt đầu ngay từ đầu hay từ giữa chừng.
- {{cssxref("animation-direction")}}
  - : Chỉ định liệu lần lặp đầu tiên của animation có đi theo chiều xuôi hay ngược, và liệu các lần lặp tiếp theo có xen kẽ chiều mỗi lần hay reset về điểm đầu và lặp lại.
- {{cssxref("animation-duration")}}
  - : Chỉ định khoảng thời gian để animation hoàn thành một chu kỳ.
- {{cssxref("animation-fill-mode")}}
  - : Chỉ định cách animation áp dụng style cho phần tử đích trước và sau khi chạy.
    > [!NOTE]
    > Trong trường hợp animation có fill mode [forwards](/en-US/docs/Web/CSS/Reference/Properties/animation-fill-mode#forwards), các thuộc tính được animate hoạt động như thể được đưa vào giá trị thuộc tính {{cssxref("will-change")}} đã đặt. Nếu một stacking context mới được tạo ra trong quá trình animation, phần tử đích sẽ giữ lại stacking context đó sau khi animation kết thúc.
- {{cssxref("animation-iteration-count")}}
  - : Chỉ định số lần animation lặp lại.
- {{cssxref("animation-name")}}
  - : Chỉ định tên của at-rule {{cssxref("@keyframes")}} mô tả các keyframe của animation.
- {{cssxref("animation-play-state")}}
  - : Chỉ định việc tạm dừng hay phát chuỗi animation.
- {{cssxref("animation-timeline")}}
  - : Chỉ định timeline được dùng để kiểm soát tiến trình của CSS animation.
- {{cssxref("animation-timing-function")}}
  - : Chỉ định cách animation chuyển đổi qua các keyframe bằng cách thiết lập acceleration curves.

## Định nghĩa chuỗi animation bằng keyframes

Sau khi cấu hình timing của animation, bạn cần định nghĩa diện mạo của animation. Điều này được thực hiện bằng cách thiết lập một hoặc nhiều keyframe dùng at-rule {{cssxref("@keyframes")}}. Mỗi keyframe mô tả cách phần tử được animate hiển thị tại một thời điểm nhất định trong chuỗi animation.

Vì timing của animation được xác định trong CSS style cấu hình animation, các keyframe dùng {{cssxref("percentage")}} để chỉ thời điểm trong chuỗi animation. 0% biểu thị thời điểm đầu tiên của chuỗi animation, trong khi 100% biểu thị trạng thái cuối cùng. Vì hai thời điểm này rất quan trọng, chúng có bí danh đặc biệt: `from` và `to`. Cả hai đều là tùy chọn. Nếu `from`/`0%` hoặc `to`/`100%` không được chỉ định, trình duyệt sẽ bắt đầu hoặc kết thúc animation bằng các giá trị được tính toán của tất cả thuộc tính.

Bạn có thể tùy chọn thêm các keyframe bổ sung để mô tả các bước trung gian giữa trạng thái đầu và cuối của animation.

## Sử dụng animation shorthand

Shorthand {{cssxref("animation")}} hữu ích để tiết kiệm không gian. Ví dụ, một số quy tắc chúng ta đã sử dụng trong bài viết này:

```css
p {
  animation-duration: 3s;
  animation-name: slide-in;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
```

...có thể được thay thế bằng cách dùng shorthand `animation`.

```css
p {
  animation: 3s infinite alternate slide-in;
}
```

Để tìm hiểu thêm về thứ tự các giá trị thuộc tính animation có thể được chỉ định khi dùng shorthand `animation`, xem trang tham chiếu {{cssxref("animation")}}.

## Đặt nhiều giá trị thuộc tính animation

Các longhand properties của CSS animation có thể chấp nhận nhiều giá trị, phân cách bởi dấu phẩy. Tính năng này có thể được dùng khi bạn muốn áp dụng nhiều animation trong một quy tắc và đặt các duration, iteration count khác nhau cho mỗi animation. Hãy xem một số ví dụ nhanh để giải thích các hoán vị khác nhau.

Trong ví dụ đầu tiên, có ba giá trị duration và ba giá trị iteration count. Vì vậy mỗi animation được gán một giá trị duration và iteration count có cùng vị trí với tên animation. Animation `fadeInOut` được gán duration là `2.5s` và iteration count là `2`, và animation `bounce` được gán duration là `1s` và iteration count là `5`.

```css
animation-name: fadeInOut, moveLeft300px, bounce;
animation-duration: 2.5s, 5s, 1s;
animation-iteration-count: 2, 1, 5;
```

Trong ví dụ thứ hai, có ba tên animation được đặt, nhưng chỉ có một duration và một iteration count. Trong trường hợp này, cả ba animation đều được gán cùng duration và iteration count.

```css
animation-name: fadeInOut, moveLeft300px, bounce;
animation-duration: 3s;
animation-iteration-count: 1;
```

Trong ví dụ thứ ba, có ba animation được chỉ định, nhưng chỉ có hai duration và hai iteration count. Trong những trường hợp không có đủ giá trị để gán riêng lẻ cho mỗi animation, việc gán giá trị sẽ lặp từ phần tử đầu đến phần tử cuối trong danh sách hiện có, rồi quay lại phần tử đầu tiên. Vì vậy, `fadeInOut` nhận duration là `2.5s`, và `moveLeft300px` nhận duration là `5s`, đây là giá trị cuối cùng trong danh sách duration. Việc gán giá trị duration nay reset về giá trị đầu tiên; do đó `bounce` nhận duration là `2.5s`. Các giá trị iteration count (và bất kỳ giá trị thuộc tính nào khác bạn chỉ định) sẽ được gán theo cách tương tự.

```css
animation-name: fadeInOut, moveLeft300px, bounce;
animation-duration: 2.5s, 5s;
animation-iteration-count: 2, 1;
```

Nếu sự không khớp về số lượng animation và giá trị thuộc tính animation bị đảo ngược, chẳng hạn có năm giá trị `animation-duration` cho ba giá trị `animation-name`, thì các giá trị thuộc tính animation thừa hoặc không được dùng, trong trường hợp này là hai giá trị `animation-duration`, sẽ không áp dụng cho bất kỳ animation nào và bị bỏ qua.

## Ví dụ

### Làm cho văn bản trượt qua cửa sổ trình duyệt

Ví dụ cơ bản này áp dụng style cho phần tử {{HTMLElement("p")}} bằng các thuộc tính transition {{cssxref("translate")}} và {{cssxref("scale")}} để văn bản trượt vào từ phía ngoài cạnh phải của cửa sổ trình duyệt.

```css
p {
  animation-duration: 3s;
  animation-name: slide-in;
}

@keyframes slide-in {
  from {
    translate: 150vw 0;
    scale: 200% 1;
  }

  to {
    translate: 0 0;
    scale: 100% 1;
  }
}
```

Trong ví dụ này, style cho phần tử {{HTMLElement("p")}} chỉ định rằng animation sẽ mất 3 giây để thực thi từ đầu đến cuối, sử dụng thuộc tính {{cssxref("animation-duration")}} và tên của at-rule {{ cssxref("@keyframes")}} định nghĩa các keyframe cho chuỗi animation là `slide-in`.

Trong trường hợp này, chúng ta chỉ có hai keyframe. Keyframe đầu tiên xuất hiện tại `0%` (dùng bí danh `from`). Ở đây, chúng ta cấu hình thuộc tính {{cssxref("translate")}} của phần tử là `150vw` (tức là nằm ngoài cạnh phải của phần tử chứa), và {{cssxref("scale")}} của phần tử là 200% (hay hai lần kích thước inline mặc định), khiến đoạn văn rộng gấp đôi khối chứa `<body>`. Điều này khiến frame đầu tiên của animation có header được vẽ ngoài cạnh phải của cửa sổ trình duyệt.

Keyframe thứ hai xuất hiện tại `100%` (dùng bí danh `to`). Thuộc tính {{cssxref("translate")}} được đặt thành `0%` và {{cssxref("scale")}} của phần tử được đặt thành `1`, tức là `100%`. Điều này khiến header kết thúc animation ở trạng thái mặc định, sát cạnh trái của vùng nội dung.

```html
<p>
  The Caterpillar and Alice looked at each other for some time in silence: at
  last the Caterpillar took the hookah out of its mouth, and addressed her in a
  languid, sleepy voice.
</p>
```

> [!NOTE]
> Tải lại trang để xem animation.

{{EmbedLiveSample("Making_text_slide_across_the_browser_window","100%","250")}}

### Thêm một keyframe animation khác

Hãy thêm một keyframe khác vào animation của ví dụ trước. Giả sử chúng ta muốn tên Alice chuyển sang màu hồng, phóng to rồi thu nhỏ trở lại kích thước và màu sắc ban đầu khi di chuyển từ phải sang trái. Trong khi chúng ta có thể thay đổi {{cssxref("font-size")}}, việc thay đổi bất kỳ thuộc tính nào ảnh hưởng đến box model sẽ ảnh hưởng tiêu cực đến hiệu suất. Thay vào đó, chúng ta bọc tên của cô ấy trong một {{htmlelement("span")}} và sau đó scale và gán màu riêng cho đó. Điều đó đòi hỏi thêm một animation thứ hai chỉ ảnh hưởng đến `<span>`:

```css
@keyframes grow-shrink {
  25%,
  75% {
    scale: 100%;
  }

  50% {
    scale: 200%;
    color: magenta;
  }
}
```

Toàn bộ code bây giờ trông như thế này:

```css
p {
  animation-duration: 3s;
  animation-name: slide-in;
}
p span {
  display: inline-block;
  animation-duration: 3s;
  animation-name: grow-shrink;
}

@keyframes slide-in {
  from {
    translate: 150vw 0;
    scale: 200% 1;
  }

  to {
    translate: 0 0;
    scale: 100% 1;
  }
}

@keyframes grow-shrink {
  25%,
  75% {
    scale: 100%;
  }

  50% {
    scale: 200%;
    color: magenta;
  }
}
```

Chúng ta đã thêm {{htmlelement("span")}} xung quanh "Alice":

```html
<p>
  The Caterpillar and <span>Alice</span> looked at each other for some time in
  silence: at last the Caterpillar took the hookah out of its mouth, and
  addressed her in a languid, sleepy voice.
</p>
```

Điều này cho trình duyệt biết tên cô ấy phải bình thường trong 25% đầu và cuối của animation, nhưng chuyển sang màu hồng trong khi được scale lên và thu lại ở giữa. Chúng ta đặt thuộc tính {{cssxref("display")}} của span thành `inline-block` vì các thuộc tính `transform` không ảnh hưởng đến {{glossary("inline-level content")}} không thay thế.

> [!NOTE]
> Tải lại trang để xem animation.

{{EmbedLiveSample("Adding_another_keyframe","100%","250")}}

### Lặp lại animation

Để làm cho animation lặp lại, dùng thuộc tính {{cssxref("animation-iteration-count")}} để chỉ định số lần lặp. Trong trường hợp này, hãy dùng `infinite` để animation lặp vô thời hạn:

```css
p {
  animation-duration: 3s;
  animation-name: slide-in;
  animation-iteration-count: infinite;
}
```

```css hidden
@keyframes slide-in {
  from {
    translate: 150vw 0;
    scale: 200% 1;
  }

  to {
    translate: 0 0;
    scale: 100% 1;
  }
}
```

```html hidden
<p>
  The Caterpillar and Alice looked at each other for some time in silence: at
  last the Caterpillar took the hookah out of its mouth, and addressed her in a
  languid, sleepy voice.
</p>
```

{{EmbedLiveSample("Repeating_the_animation","100%","250")}}

### Làm cho animation di chuyển qua lại

Animation đã lặp lại, nhưng việc nó nhảy về đầu mỗi khi bắt đầu trông rất kỳ lạ. Điều chúng ta thực sự muốn là nó di chuyển qua lại trên màn hình. Điều đó dễ dàng thực hiện bằng cách đặt {{cssxref("animation-direction")}} thành `alternate`:

```css
p {
  animation-duration: 3s;
  animation-name: slide-in;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
```

```css hidden
@keyframes slide-in {
  from {
    translate: 150vw 0;
    scale: 200% 1;
  }

  to {
    translate: 0 0;
    scale: 100% 1;
  }
}
```

```html hidden
<p>
  The Caterpillar and Alice looked at each other for some time in silence: at
  last the Caterpillar took the hookah out of its mouth, and addressed her in a
  languid, sleepy voice.
</p>
```

{{EmbedLiveSample("Making_the_animation_move_back_and_forth","100%","250")}}

### Sử dụng animation events

Bạn có thể kiểm soát animations tốt hơn — cũng như có thêm thông tin hữu ích về chúng — bằng cách sử dụng animation events. Những event này, được đại diện bởi đối tượng {{domxref("AnimationEvent")}}, có thể được dùng để phát hiện khi nào animation bắt đầu, kết thúc và bắt đầu một lần lặp mới. Mỗi event bao gồm thời điểm xảy ra cũng như tên của animation đã kích hoạt event đó.

Chúng ta sẽ chỉnh sửa ví dụ văn bản trượt để xuất một số thông tin về mỗi animation event khi nó xảy ra, để chúng ta có thể quan sát cách chúng hoạt động.

Chúng ta đã bao gồm cùng keyframe animation như ví dụ trước. Animation này sẽ kéo dài 3 giây, được gọi là "slide-in", lặp lại 3 lần và di chuyển theo chiều xen kẽ mỗi lần. Trong {{cssxref("@keyframes")}}, scale và translation được thao tác dọc theo trục x để làm cho phần tử trượt qua màn hình.

```css
.slide-in {
  animation-duration: 3s;
  animation-name: slide-in;
  animation-iteration-count: 3;
  animation-direction: alternate;
}
```

```css hidden
@keyframes slide-in {
  from {
    translate: 150vw 0;
    scale: 200% 1;
  }

  to {
    translate: 0 0;
    scale: 100% 1;
  }
}
```

#### Thêm các event listener cho animation

Chúng ta sẽ dùng code JavaScript để lắng nghe cả ba animation event có thể xảy ra. Code này cấu hình các event listener của chúng ta; chúng ta gọi nó khi tài liệu được tải lần đầu để thiết lập mọi thứ.

```js
const element = document.getElementById("watch-me");
element.addEventListener("animationstart", listener);
element.addEventListener("animationend", listener);
element.addEventListener("animationiteration", listener);

element.className = "slide-in";
```

Đây là code khá tiêu chuẩn; bạn có thể xem chi tiết về cách hoạt động trong tài liệu về {{domxref("eventTarget.addEventListener()")}}. Điều cuối cùng code này làm là đặt `class` trên phần tử chúng ta sẽ animate thành "slide-in"; chúng ta làm điều này để bắt đầu animation.

Tại sao? Vì event `animationstart` kích hoạt ngay khi animation bắt đầu, và trong trường hợp này, điều đó xảy ra trước khi code của chúng ta chạy. Vì vậy chúng ta sẽ tự bắt đầu animation bằng cách đặt class của phần tử thành style được animate sau đó.

#### Nhận các events

Các event được gửi đến hàm `listener()`, được hiển thị bên dưới.

```js
function listener(event) {
  const l = document.createElement("li");
  switch (event.type) {
    case "animationstart":
      l.textContent = `Started: elapsed time is ${event.elapsedTime}`;
      break;
    case "animationend":
      l.textContent = `Ended: elapsed time is ${event.elapsedTime}`;
      break;
    case "animationiteration":
      l.textContent = `New loop started at time ${event.elapsedTime}`;
      break;
  }
  document.getElementById("output").appendChild(l);
}
```

Code này cũng rất đơn giản. Nó xem {{domxref("event.type")}} để xác định loại animation event nào đã xảy ra, rồi thêm ghi chú phù hợp vào {{HTMLElement("ul")}} (danh sách không có thứ tự) mà chúng ta dùng để ghi lại các event này.

Kết quả đầu ra, khi tất cả xong, trông đại loại như thế này:

- Started: elapsed time is 0
- New loop started at time 3.01200008392334
- New loop started at time 6.00600004196167
- Ended: elapsed time is 9.234000205993652

Lưu ý rằng các thời điểm rất gần, nhưng không hoàn toàn chính xác như mong đợi dựa trên timing được thiết lập khi cấu hình animation. Cũng lưu ý rằng sau lần lặp cuối cùng của animation, event `animationiteration` không được gửi; thay vào đó, event `animationend` được gửi.

Chỉ để đầy đủ, đây là HTML hiển thị nội dung trang, bao gồm danh sách mà script chèn thông tin về các event nhận được vào:

```html
<h1 id="watch-me">Watch me move</h1>
<p>
  This example shows how to use CSS animations to make <code>H1</code>
  elements move across the page.
</p>
<p>
  In addition, we output some text each time an animation event fires, so you
  can see them in action.
</p>
<ul id="output"></ul>
```

Và đây là kết quả trực tiếp.

> [!NOTE]
> Tải lại trang để xem animation.

{{EmbedLiveSample('Using_animation_events', '600', '300')}}

### Animate display và content-visibility

Ví dụ này trình bày cách {{cssxref("display")}} và {{cssxref("content-visibility")}} có thể được animate. Hành vi này hữu ích để tạo các animation vào/ra, ví dụ khi bạn muốn xóa một container khỏi DOM với `display: none`, nhưng muốn nó mờ dần mượt mà bằng {{cssxref("opacity")}} thay vì biến mất ngay lập tức.

Các trình duyệt hỗ trợ animate `display` và `content-visibility` với biến thể của [kiểu animation discrete](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete). Điều này thường có nghĩa là các thuộc tính sẽ chuyển đổi giữa hai giá trị ở 50% của quá trình animate giữa hai giá trị.

Tuy nhiên có một ngoại lệ, đó là khi animate đến/từ `display: none` hoặc `content-visibility: hidden` sang một giá trị visible. Trong trường hợp này, trình duyệt sẽ chuyển đổi giữa hai giá trị sao cho nội dung được animate hiển thị trong suốt thời gian animation.

Ví dụ:

- Khi animate `display` từ `none` sang `block` (hoặc giá trị `display` visible khác), giá trị sẽ chuyển sang `block` tại `0%` của animation duration để nó hiển thị trong suốt.
- Khi animate `display` từ `block` (hoặc giá trị `display` visible khác) sang `none`, giá trị sẽ chuyển sang `none` tại `100%` của animation duration để nó hiển thị trong suốt.

#### HTML

HTML chứa hai phần tử {{htmlelement("p")}} với một {{htmlelement("div")}} ở giữa mà chúng ta sẽ animate từ `display` `none` sang `block`.

```html
<p>
  Click anywhere on the screen or press any key to toggle the
  <code>&lt;div&gt;</code> between hidden and showing.
</p>

<div>
  This is a <code>&lt;div&gt;</code> element that animates between
  <code>display: none; opacity: 0</code> and
  <code>display: block; opacity: 1</code>. Neat, huh?
</div>

<p>
  This is another paragraph to show that <code>display: none;</code> is being
  applied and removed on the above <code>&lt;div&gt; </code>. If only its
  <code>opacity</code> was being changed, it would always take up the space in
  the DOM.
</p>
```

#### CSS

```css
html {
  height: 100vh;
}

div {
  font-size: 1.6rem;
  padding: 20px;
  border: 3px solid red;
  border-radius: 20px;
  width: 480px;
  opacity: 0;
  display: none;
}

/* Animation classes */

div.fade-in {
  display: block;
  animation: fade-in 0.7s ease-in forwards;
}

div.fade-out {
  animation: fade-out 0.7s ease-out forwards;
}

/* Animation keyframes */

@keyframes fade-in {
  0% {
    opacity: 0;
    display: none;
  }

  100% {
    opacity: 1;
    display: block;
  }
}

@keyframes fade-out {
  0% {
    opacity: 1;
    display: block;
  }

  100% {
    opacity: 0;
    display: none;
  }
}
```

Lưu ý việc đưa thuộc tính `display` vào các keyframe animations.

#### JavaScript

Cuối cùng, chúng ta thêm một ít JavaScript để thiết lập các event listener kích hoạt animations. Cụ thể, chúng ta thêm class `fade-in` vào `<div>` khi muốn nó xuất hiện, và `fade-out` khi muốn nó biến mất.

```js
const divElem = document.querySelector("div");
const htmlElem = document.querySelector(":root");

htmlElem.addEventListener("click", showHide);
document.addEventListener("keydown", showHide);

function showHide() {
  if (divElem.classList[0] === "fade-in") {
    divElem.classList.remove("fade-in");
    divElem.classList.add("fade-out");
  } else {
    divElem.classList.remove("fade-out");
    divElem.classList.add("fade-in");
  }
}
```

#### Kết quả

Code hiển thị như sau:

{{ EmbedLiveSample("Animating display and content-visibility", "100%", "350") }}

## Xem thêm

- [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) module
- {{domxref("AnimationEvent", "AnimationEvent")}}
- [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
- [Sử dụng Web Animations API](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API)
