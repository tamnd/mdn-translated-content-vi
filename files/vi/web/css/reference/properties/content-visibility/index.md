---
title: content-visibility
slug: Web/CSS/Reference/Properties/content-visibility
page-type: css-property
browser-compat: css.properties.content-visibility
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`content-visibility`** kiểm soát liệu phần tử có hiển thị nội dung của nó hay không, cùng với việc áp dụng một tập hợp containment mạnh mẽ, cho phép user agent có thể bỏ qua khối lượng lớn công việc bố cục và hiển thị cho đến khi cần thiết. Nó cho phép user agent bỏ qua công việc hiển thị của phần tử (bao gồm bố cục và vẽ) cho đến khi cần — điều này giúp tải trang ban đầu nhanh hơn nhiều.

> [!NOTE]
> Sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}} kích hoạt trên bất kỳ phần tử nào có `content-visibility: auto` được đặt khi công việc hiển thị của nó bắt đầu hoặc ngừng bị bỏ qua. Điều này cung cấp một cách thuận tiện cho mã ứng dụng để bắt đầu hoặc dừng các quy trình hiển thị (ví dụ: vẽ trên {{htmlelement("canvas")}}) khi không cần thiết, từ đó tiết kiệm năng lượng xử lý.

{{InteractiveExample("CSS Demo: content-visibility")}}

```css interactive-example-choice
content-visibility: visible;
```

```css interactive-example-choice
content-visibility: hidden;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="container" id="example-element">
    <div class="child">
      <span>This is an inner div</span>
    </div>
  </div>
</section>
```

```css interactive-example
.container {
  width: 140px;
  height: 140px;
  border: 3px solid rgb(64 28 163);
  background-color: rgb(135 136 184);
  display: flex;
  align-items: center;
  justify-content: center;
}

.child {
  border: 3px solid rgb(64 28 163);
  background-color: wheat;
  color: black;
  width: 80%;
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

## Cú pháp

```css
/* Keyword values */
content-visibility: visible;
content-visibility: hidden;
content-visibility: auto;

/* Global values */
content-visibility: inherit;
content-visibility: initial;
content-visibility: revert;
content-visibility: revert-layer;
content-visibility: unset;
```

### Giá trị

- `visible`
  - : Không có hiệu lực. Nội dung phần tử được bố cục và hiển thị bình thường. Đây là giá trị mặc định.
- `hidden`
  - : Phần tử [bỏ qua nội dung của nó](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents). Nội dung bị bỏ qua không được phép truy cập bởi các tính năng user-agent, chẳng hạn như tìm kiếm trong trang, điều hướng tab-order, v.v., cũng không được chọn hoặc lấy tiêu điểm. Điều này tương tự như việc cho nội dung `display: none`.
- `auto`
  - : Phần tử bật layout containment, style containment và paint containment. Nếu phần tử không [liên quan đến người dùng](/en-US/docs/Web/CSS/Guides/Containment/Using#relevant_to_the_user), nó cũng bỏ qua nội dung. Không giống như hidden, nội dung bị bỏ qua vẫn phải có sẵn như bình thường cho các tính năng user-agent như tìm kiếm trong trang, điều hướng tab order, v.v., và phải có thể lấy tiêu điểm và được chọn như bình thường.

## Mô tả

### Hoạt ảnh và chuyển đổi content-visibility

Các [trình duyệt hỗ trợ](#browser_compatibility) tạo hoạt ảnh/chuyển đổi `content-visibility` với biến thể trên [kiểu hoạt ảnh rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete).

Hoạt ảnh rời rạc thường có nghĩa là thuộc tính sẽ chuyển đổi giữa hai giá trị vào 50% tiến trình hoạt ảnh. Tuy nhiên, trong trường hợp `content-visibility`, trình duyệt sẽ chuyển đổi giữa hai giá trị để hiển thị nội dung được hoạt ảnh trong toàn bộ thời gian hoạt ảnh. Vì vậy, ví dụ:

- Khi tạo hoạt ảnh `content-visibility` từ `hidden` đến `visible`, giá trị sẽ chuyển sang `visible` ở `0%` thời gian hoạt ảnh để nó hiển thị trong suốt.
- Khi tạo hoạt ảnh `content-visibility` từ `visible` đến `hidden`, giá trị sẽ chuyển sang `hidden` ở `100%` thời gian hoạt ảnh để nó hiển thị trong suốt.

Hành vi này hữu ích để tạo hoạt ảnh vào/ra khi bạn muốn, ví dụ: xóa một số nội dung khỏi DOM với `content-visibility: hidden`, nhưng bạn muốn chuyển đổi mượt mà (chẳng hạn như fade-out) thay vì biến mất ngay lập tức.

Khi tạo hoạt ảnh `content-visibility` với [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), cần đặt [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) trên `content-visibility`. Điều này có hiệu quả cho phép chuyển đổi `content-visibility`.

> [!NOTE]
> Khi chuyển đổi giá trị `content-visibility` của phần tử, bạn không cần cung cấp tập hợp giá trị bắt đầu cho các thuộc tính được chuyển đổi bằng khối {{cssxref("@starting-style")}}, như bạn làm khi [chuyển đổi `display`](/en-US/docs/Web/CSS/Reference/Properties/display#animating_display). Điều này là vì `content-visibility` không ẩn phần tử khỏi DOM như `display` làm: nó chỉ bỏ qua việc hiển thị nội dung phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Khả năng tiếp cận

Nội dung ngoài màn hình trong thuộc tính `content-visibility: auto` vẫn ở trong document object model và cây khả năng tiếp cận. Điều này cho phép cải thiện hiệu suất trang với `content-visibility: auto` mà không ảnh hưởng tiêu cực đến khả năng tiếp cận.

Vì các kiểu dáng cho nội dung ngoài màn hình không được hiển thị, các phần tử được cố ý ẩn với `display: none` hoặc `visibility: hidden` _vẫn sẽ xuất hiện trong cây khả năng tiếp cận_.
Nếu bạn không muốn một phần tử xuất hiện trong cây khả năng tiếp cận, hãy sử dụng `aria-hidden="true"`.

## Ví dụ

### Sử dụng auto để giảm chi phí hiển thị của trang dài

Ví dụ sau cho thấy việc sử dụng `content-visibility: auto` để bỏ qua vẽ và hiển thị các section ngoài màn hình.
Khi một `section` nằm ngoài viewport thì việc vẽ nội dung sẽ bị bỏ qua cho đến khi section tiếp cận gần với viewport, điều này giúp cải thiện cả thời gian tải và các tương tác trên trang.

#### HTML

```html
<section>
  <!-- Content for each section… -->
</section>
<section>
  <!-- Content for each section… -->
</section>
<section>
  <!-- Content for each section… -->
</section>
<!-- … -->
```

#### CSS

Thuộc tính `contain-intrinsic-size` thêm kích thước mặc định 500px cho chiều cao và chiều rộng của mỗi phần tử `section`. Sau khi section được hiển thị, nó sẽ giữ lại kích thước nội tại được hiển thị của nó, ngay cả khi nó bị cuộn ra khỏi viewport.

```css
section {
  content-visibility: auto;
  contain-intrinsic-size: auto 500px;
}
```

### Sử dụng hidden để quản lý khả năng hiển thị

Ví dụ sau cho thấy cách quản lý khả năng hiển thị nội dung bằng JavaScript.
Sử dụng `content-visibility: hidden;` thay vì `display: none;` bảo toàn trạng thái hiển thị của nội dung khi ẩn và hiển thị nhanh hơn.

#### HTML

```html
<div class="hidden">
  <button class="toggle">Show</button>
  <p>
    This content is initially hidden and can be shown by clicking the button.
  </p>
</div>
<div class="visible">
  <button class="toggle">Hide</button>
  <p>
    This content is initially visible and can be hidden by clicking the button.
  </p>
</div>
```

#### CSS

Thuộc tính `content-visibility` được đặt trên các đoạn văn là con trực tiếp của các phần tử với class `visible` và `hidden`. Trong ví dụ của chúng ta, chúng ta có thể hiển thị và ẩn nội dung trong các đoạn văn tùy thuộc vào class CSS của các phần tử div cha.

Thuộc tính `contain-intrinsic-size` được bao gồm để đại diện cho kích thước nội dung. Điều này giúp giảm sự dịch chuyển bố cục khi nội dung bị ẩn.

```css
p {
  contain-intrinsic-size: 0 1.1em;
  border: dotted 2px;
}

.hidden > p {
  content-visibility: hidden;
}

.visible > p {
  content-visibility: visible;
}
```

#### JavaScript

```js
const handleClick = (event) => {
  const button = event.target;
  const div = button.parentElement;
  button.textContent = div.classList.contains("visible") ? "Show" : "Hide";
  div.classList.toggle("hidden");
  div.classList.toggle("visible");
};

document.querySelectorAll("button.toggle").forEach((button) => {
  button.addEventListener("click", handleClick);
});
```

#### Kết quả

{{ EmbedLiveSample('Using hidden to manually manage visibility') }}

### Tạo hoạt ảnh content-visibility

Trong ví dụ này, chúng ta có phần tử {{htmlelement("div")}}, nội dung của nó có thể được chuyển đổi giữa hiển thị và ẩn bằng cách nhấp chuột hoặc nhấn phím bất kỳ.

#### HTML

```html
<p>
  Click anywhere on the screen or press any key to toggle the
  <code>&lt;div&gt;</code> content between hidden and showing.
</p>

<div>
  This is a <code>&lt;div&gt;</code> element that animates between
  <code>content-visibility: hidden;</code>and
  <code>content-visibility: visible;</code>. We've also animated the text color
  to create a smooth animation effect.
</div>
```

#### CSS

Trong CSS, ban đầu chúng ta đặt `content-visibility: hidden;` trên `<div>` để ẩn nội dung. Sau đó chúng ta thiết lập hoạt ảnh `@keyframes` và gắn chúng với các class để hiển thị và ẩn `<div>`, tạo hoạt ảnh `content-visibility` và {{cssxref("color")}} để bạn có hiệu ứng hoạt ảnh mượt mà khi nội dung được hiển thị/ẩn.

```css
div {
  font-size: 1.6rem;
  padding: 20px;
  border: 3px solid red;
  border-radius: 20px;
  width: 480px;

  content-visibility: hidden;
}

/* Animation classes */

.show {
  animation: show 0.7s ease-in forwards;
}

.hide {
  animation: hide 0.7s ease-out forwards;
}

/* Animation keyframes */

@keyframes show {
  0% {
    content-visibility: hidden;
    color: transparent;
  }

  100% {
    content-visibility: visible;
    color: black;
  }
}

@keyframes hide {
  0% {
    content-visibility: visible;
    color: black;
  }

  100% {
    content-visibility: hidden;
    color: transparent;
  }
}
```

#### JavaScript

Cuối cùng, chúng ta sử dụng JavaScript để áp dụng các class `.show` và `.hide` cho `<div>` khi thích hợp để áp dụng hoạt ảnh khi nó được chuyển đổi giữa trạng thái hiển thị và ẩn.

```js
const divElem = document.querySelector("div");
const htmlElem = document.querySelector(":root");

htmlElem.addEventListener("click", showHide);
document.addEventListener("keydown", showHide);

function showHide() {
  if (divElem.classList.contains("show")) {
    divElem.classList.remove("show");
    divElem.classList.add("hide");
  } else {
    divElem.classList.remove("hide");
    divElem.classList.add("show");
  }
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{ EmbedLiveSample("Animating content-visibility", "100%", "300") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Containment](/en-US/docs/Web/CSS/Guides/Containment)
- {{cssxref("contain-intrinsic-size")}}
- {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}
- [content-visibility: the new CSS property that boosts your rendering performance](https://web.dev/articles/content-visibility) (web.dev)
