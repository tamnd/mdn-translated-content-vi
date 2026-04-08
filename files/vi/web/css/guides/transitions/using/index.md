---
title: Using CSS transitions
short-title: Using transitions
slug: Web/CSS/Guides/Transitions/Using
page-type: guide
spec-urls: https://drafts.csswg.org/css-transitions/
sidebar: cssref
---

**CSS transitions** cung cấp cách kiểm soát tốc độ animation khi thay đổi các thuộc tính CSS. Thay vì để các thay đổi thuộc tính có hiệu lực ngay lập tức, bạn có thể làm cho các thay đổi thuộc tính diễn ra trong một khoảng thời gian. Ví dụ, nếu bạn thay đổi màu của một phần tử từ trắng sang đen, thông thường sự thay đổi diễn ra tức thì. Khi CSS transitions được bật, các thay đổi xảy ra theo các khoảng thời gian tuân theo đường cong gia tốc, tất cả đều có thể tùy chỉnh.

Các animation liên quan đến chuyển tiếp giữa hai trạng thái thường được gọi là _implicit transitions_ vì các trạng thái ở giữa trạng thái bắt đầu và trạng thái cuối được trình duyệt định nghĩa ngầm.

![Một CSS transition yêu cầu trình duyệt vẽ các trạng thái trung gian giữa trạng thái ban đầu và trạng thái cuối, tạo ra chuyển tiếp mượt mà cho người dùng.](transitionsprinciple.png)

CSS transitions cho phép bạn quyết định thuộc tính nào sẽ được animate (bằng cách [_liệt kê chúng một cách tường minh_](/en-US/docs/Web/CSS/Reference/Properties/transition-property)), khi nào animation bắt đầu (bằng cách đặt [_delay_](/en-US/docs/Web/CSS/Reference/Properties/transition-delay)), transition kéo dài bao lâu (bằng cách đặt [_duration_](/en-US/docs/Web/CSS/Reference/Properties/transition-duration)) và cách transition chạy (bằng cách định nghĩa [_easing function_](/en-US/docs/Web/CSS/Reference/Properties/transition-timing-function), ví dụ: tuyến tính hoặc nhanh ở đầu, chậm ở cuối).

## Thuộc tính CSS nào có thể được chuyển tiếp?

Tác giả web có thể định nghĩa thuộc tính nào cần được animate và theo cách nào. Điều này cho phép tạo ra các transitions phức tạp. Tuy nhiên, một số thuộc tính [không thể animate](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties) vì không có ý nghĩa khi animate chúng.

> [!NOTE]
> Giá trị `auto` thường là một trường hợp rất phức tạp. Đặc tả khuyến nghị không nên animate từ và đến `auto`. Một số user agent, như những trình duyệt dựa trên Gecko, thực hiện yêu cầu này, còn những trình duyệt khác như dựa trên WebKit thì kém nghiêm ngặt hơn. Sử dụng animations với `auto` có thể dẫn đến kết quả không thể đoán trước, tùy thuộc vào trình duyệt và phiên bản của nó, và nên tránh.

## Định nghĩa transitions

CSS Transitions được kiểm soát bằng thuộc tính shorthand {{cssxref("transition")}}. Đây là cách tốt nhất để cấu hình transitions, vì nó giúp tránh các tham số không đồng bộ, vốn có thể rất khó chịu khi phải debug trong CSS.

Bạn có thể kiểm soát các thành phần riêng lẻ của transition bằng các sub-property sau:

- {{cssxref("transition-property")}}
  - : Chỉ định tên hoặc các tên của thuộc tính CSS mà transitions nên được áp dụng. Chỉ các thuộc tính được liệt kê ở đây mới được animate trong quá trình transitions; các thay đổi đối với tất cả các thuộc tính khác xảy ra tức thì như thường.
- {{cssxref("transition-duration")}}
  - : Chỉ định khoảng thời gian để transitions xảy ra. Bạn có thể chỉ định một duration duy nhất áp dụng cho tất cả các thuộc tính trong quá trình transition, hoặc nhiều giá trị để cho phép mỗi thuộc tính chuyển tiếp trong một khoảng thời gian khác nhau.
- {{cssxref("transition-timing-function")}}
  - : Chỉ định một hàm để định nghĩa cách tính các giá trị trung gian cho thuộc tính. _Easing functions_ xác định cách tính các giá trị trung gian của transition. Hầu hết [easing functions](/en-US/docs/Web/CSS/Reference/Values/easing-function) có thể được chỉ định bằng cách cung cấp đồ thị của hàm tương ứng, được định nghĩa bởi bốn điểm xác định một cubic bezier. Bạn cũng có thể chọn easing từ [Easing functions cheat sheet](https://easings.net/).
- {{cssxref("transition-delay")}}
  - : Định nghĩa thời gian chờ giữa lúc thuộc tính thay đổi và khi transition thực sự bắt đầu.

Cú pháp CSS shorthand của `transition` được viết như sau:

```plain
transition: <property> <duration> <timing-function> <delay>;
```

## Ví dụ

### Ví dụ cơ bản

Ví dụ này thực hiện một transition kích thước phông chữ kéo dài bốn giây với độ trễ hai giây giữa lúc người dùng rê chuột qua phần tử và khi hiệu ứng animation bắt đầu:

```css
#delay {
  font-size: 14px;
  transition-property: font-size;
  transition-duration: 4s;
  transition-delay: 2s;
}

#delay:hover {
  font-size: 36px;
}
```

### Ví dụ nhiều thuộc tính được animate

```html hidden
<body>
  <p>
    The box below combines transitions for: width, height, background-color,
    rotate. Hover over the box to see these properties animated.
  </p>
  <div class="box">Sample</div>
</body>
```

#### CSS

```css
.box {
  border-style: solid;
  border-width: 1px;
  display: block;
  width: 100px;
  height: 100px;
  background-color: blue;
  transition:
    width 2s,
    height 2s,
    background-color 2s,
    rotate 2s;
}

.box:hover {
  background-color: #ffcccc;
  width: 200px;
  height: 200px;
  rotate: 180deg;
}
```

{{EmbedLiveSample('Multiple_animated_properties_example', 600, 300)}}

### Khi danh sách giá trị thuộc tính có độ dài khác nhau

Nếu danh sách giá trị của bất kỳ thuộc tính nào ngắn hơn các thuộc tính khác, các giá trị của nó sẽ được lặp lại để khớp. Ví dụ:

```css
div {
  transition-property: opacity, left, top, height;
  transition-duration: 3s, 5s;
}
```

Điều này được xử lý như thể nó là:

```css
div {
  transition-property: opacity, left, top, height;
  transition-duration: 3s, 5s, 3s, 5s;
}
```

Tương tự, nếu danh sách giá trị của bất kỳ thuộc tính nào dài hơn {{cssxref("transition-property")}}, nó sẽ bị cắt bớt, vì vậy nếu bạn có CSS sau:

```css
div {
  transition-property: opacity, left;
  transition-duration: 3s, 5s, 2s, 1s;
}
```

Điều này được hiểu là:

```css
div {
  transition-property: opacity, left;
  transition-duration: 3s, 5s;
}
```

### Sử dụng transitions khi làm nổi bật các mục menu

Một cách sử dụng CSS phổ biến là làm nổi bật các mục trong menu khi người dùng di chuột qua chúng. Rất dễ dàng để sử dụng transitions nhằm làm hiệu ứng trở nên hấp dẫn hơn.

Đầu tiên, chúng ta thiết lập menu bằng HTML:

```html
<nav>
  <a href="#">Home</a>
  <a href="#">About</a>
  <a href="#">Contact Us</a>
  <a href="#">Links</a>
</nav>
```

Sau đó, chúng ta xây dựng CSS để triển khai giao diện của menu:

```css
nav {
  display: flex;
  gap: 0.5rem;
}

a {
  flex: 1;
  background-color: #333333;
  color: white;
  border: 1px solid;
  padding: 0.5rem;
  text-align: center;
  text-decoration: none;
  transition: all 0.5s ease-out;
}

a:hover,
a:focus {
  background-color: white;
  color: #333333;
}
```

CSS này thiết lập giao diện của menu, với màu nền và màu văn bản đều thay đổi khi phần tử ở trạng thái {{cssxref(":hover")}} và {{cssxref(":focus")}}:

{{EmbedLiveSample("Using transitions when highlighting menus")}}

### Chuyển tiếp display và content-visibility

Ví dụ này minh họa cách {{cssxref("display")}} và {{cssxref("content-visibility")}} có thể được chuyển tiếp. Hành vi này hữu ích để tạo các animation vào/ra, ví dụ khi bạn muốn xóa một container khỏi DOM với `display: none`, nhưng muốn nó mờ dần với {{cssxref("opacity")}} thay vì biến mất ngay lập tức.

Các trình duyệt hỗ trợ chuyển tiếp `display` và `content-visibility` với một biến thể của [discrete animation type](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete). Điều này thường có nghĩa là các thuộc tính sẽ chuyển đổi giữa hai giá trị ở mốc 50% của quá trình animate giữa hai giá trị đó.

Tuy nhiên có một ngoại lệ, đó là khi animate đến/từ `display: none` hoặc `content-visibility: hidden`. Trong trường hợp này, trình duyệt sẽ chuyển đổi giữa hai giá trị sao cho nội dung được chuyển tiếp hiển thị trong suốt thời gian animation.

Vì vậy, ví dụ:

- Khi animate `display` từ `none` sang `block` (hoặc giá trị `display` hiển thị khác), giá trị sẽ chuyển sang `block` tại `0%` của thời gian animation để nó hiển thị suốt quá trình.
- Khi animate `display` từ `block` (hoặc giá trị `display` hiển thị khác) sang `none`, giá trị sẽ chuyển sang `none` tại `100%` của thời gian animation để nó hiển thị suốt quá trình.

Khi chuyển tiếp các thuộc tính này, cần đặt [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) trên các transitions. Điều này thực sự bật transitions cho `display`/`content-visibility`.

Khi chuyển tiếp `display`, cần có {{cssxref("@starting-style")}} để cung cấp một tập hợp các giá trị bắt đầu cho các thuộc tính được đặt trên phần tử mà bạn muốn chuyển tiếp từ khi phần tử nhận được cập nhật kiểu đầu tiên. Điều này cần thiết để tránh hành vi không mong muốn. Theo mặc định, CSS transitions không được kích hoạt trên các cập nhật kiểu đầu tiên của phần tử khi chúng xuất hiện trong DOM, bao gồm cả khi `display` thay đổi từ `none` sang trạng thái khác. `content-visibility` animations không cần các giá trị bắt đầu được chỉ định trong block `@starting-style`. Điều này là vì `content-visibility` không ẩn phần tử khỏi DOM như `display` mà: nó chỉ bỏ qua việc render nội dung của phần tử.

#### HTML

HTML chứa hai phần tử {{htmlelement("p")}} với một {{htmlelement("div")}} ở giữa mà chúng ta sẽ animate từ `display` `none` sang `block`.

```html
<p>
  Click anywhere on the screen or press any key to toggle the
  <code>&lt;div&gt;</code> between hidden and showing.
</p>

<div>
  This is a <code>&lt;div&gt;</code> element that transitions between
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

  display: none;
  opacity: 0;
  transition:
    opacity 1s,
    display 1s allow-discrete;
  /* Equivalent to
  transition: all 1s allow-discrete; */
}

.showing {
  opacity: 1;
  display: block;
}

@starting-style {
  .showing {
    opacity: 0;
  }
}
```

Lưu ý block `@starting-style` được dùng để chỉ định kiểu bắt đầu cho transition, và việc đưa thuộc tính `display` vào danh sách transitions với `allow-discrete` được đặt trên nó.

#### JavaScript

Cuối cùng, chúng ta thêm một chút JavaScript để thiết lập event listeners để kích hoạt transition (thông qua class `showing`).

```js
const divElem = document.querySelector("div");
const htmlElem = document.querySelector(":root");

htmlElem.addEventListener("click", showHide);
document.addEventListener("keydown", showHide);

function showHide() {
  divElem.classList.toggle("showing");
}
```

#### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("Transitioning display and content-visibility", "100%", "350") }}

## Ví dụ JavaScript

> [!NOTE]
> Cần cẩn thận khi sử dụng transition ngay sau:
>
> - thêm phần tử vào DOM bằng `.appendChild()`
> - xóa thuộc tính `display: none;` của phần tử.
>
> Điều này được xử lý như thể trạng thái ban đầu chưa bao giờ xảy ra và phần tử luôn ở trạng thái cuối cùng. Một cách để khắc phục giới hạn này là áp dụng `setTimeout()` với vài mili giây trước khi thay đổi thuộc tính CSS mà bạn muốn chuyển tiếp.

### Sử dụng transitions để làm mượt JavaScript

Transitions là công cụ tuyệt vời để làm mọi thứ trông mượt mà hơn mà không cần thay đổi bất kỳ điều gì trong JavaScript. Xem ví dụ sau.

```html live-sample___js-transitions
<p>Click anywhere to move the ball</p>
<div id="foo" class="ball"></div>
```

```js live-sample___js-transitions
// Make the ball move to a certain position:
const f = document.getElementById("foo");
document.addEventListener("click", (ev) => {
  f.style.transform = `translateY(${ev.clientY - 25}px)`;
  f.style.transform += `translateX(${ev.clientX - 25}px)`;
});
```

Với CSS, bạn có thể làm mượt các kiểu được áp dụng qua JavaScript. Thêm transition vào phần tử và bất kỳ thay đổi nào cũng sẽ xảy ra mượt mà:

```css hidden live-sample___js-transitions
body {
  background-color: white;
  color: #333333;
  font:
    1.2em / 1.5 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 0;
  margin: 0;
}

p {
  margin-top: 3em;
}

main {
  box-sizing: border-box;
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 660px;
  height: 400px;
  border: 1px solid #cccccc;
  padding: 20px;
}
```

```css live-sample___js-transitions
.ball {
  border-radius: 25px;
  width: 50px;
  height: 50px;
  background: #cc0000;
  position: absolute;
  top: 0;
  left: 0;
  transition: transform 1s;
}
```

{{EmbedLiveSample("js-transitions", "", "400px")}}

### Phát hiện điểm bắt đầu và kết thúc của một transition

Bạn có thể dùng sự kiện {{domxref("Element/transitionend_event", "transitionend")}} để phát hiện khi animation đã chạy xong. Đây là một đối tượng {{domxref("TransitionEvent")}}, có hai thuộc tính được thêm ngoài đối tượng {{domxref("Event")}} thông thường:

- `propertyName`
  - : Một chuỗi cho biết tên thuộc tính CSS mà transition đã hoàn thành.
- `elapsedTime`
  - : Một số thực (float) cho biết số giây transition đã chạy tại thời điểm sự kiện được kích hoạt. Giá trị này không bị ảnh hưởng bởi giá trị của {{cssxref("transition-delay")}}.

Như thường lệ, bạn có thể dùng phương thức {{domxref("EventTarget.addEventListener", "addEventListener()")}} để theo dõi sự kiện này:

```js
el.addEventListener("transitionend", updateTransition);
```

Bạn phát hiện điểm bắt đầu của transition bằng {{domxref("Element/transitionrun_event", "transitionrun")}} (kích hoạt trước bất kỳ độ trễ nào) và {{domxref("Element/transitionstart_event", "transitionstart")}} (kích hoạt sau bất kỳ độ trễ nào), theo cách tương tự:

```js
el.addEventListener("transitionrun", signalStart);
el.addEventListener("transitionstart", signalStart);
```

> [!NOTE]
> Sự kiện `transitionend` không kích hoạt nếu transition bị hủy trước khi hoàn thành vì phần tử được đặt thành {{cssxref("display", "display: none")}} hoặc giá trị thuộc tính đang animate bị thay đổi.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Giao diện {{domxref("TransitionEvent")}} và sự kiện {{domxref("Element/transitionend_event", "transitionend")}}
- [Sử dụng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
