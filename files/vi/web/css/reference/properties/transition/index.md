---
title: transition
slug: Web/CSS/Reference/Properties/transition
page-type: css-shorthand-property
browser-compat: css.properties.transition
sidebar: cssref
---

Thuộc tính **`transition`** của [CSS](/vi/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) cho {{ cssxref("transition-property") }}, {{ cssxref("transition-duration") }}, {{ cssxref("transition-timing-function") }}, {{ cssxref("transition-delay") }} và {{ cssxref("transition-behavior") }}.

{{InteractiveExample("CSS Demo: transition")}}

```css interactive-example-choice
transition: margin-right 2s;
```

```css interactive-example-choice
transition: margin-right 2s 0.5s;
```

```css interactive-example-choice
transition: margin-right 2s ease-in-out;
```

```css interactive-example-choice
transition: margin-right 2s ease-in-out 0.5s;
```

```css interactive-example-choice
transition:
  margin-right 2s,
  color 1s;
```

```css interactive-example-choice
transition: all 1s ease-out;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">Hover to see<br />the transition.</div>
</section>
```

```css interactive-example
#example-element {
  background-color: #e4f0f5;
  color: black;
  padding: 1rem;
  border-radius: 0.5rem;
  font: 1em monospace;
  width: 100%;
  transition: margin-right 2s;
}

#default-example:hover > #example-element {
  background-color: #990099;
  color: white;
  margin-right: 40%;
}
```

Các transition cho phép bạn định nghĩa sự chuyển đổi giữa hai trạng thái của một phần tử. Các trạng thái khác nhau có thể được định nghĩa bằng cách sử dụng [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) như {{cssxref(":hover")}} hoặc {{cssxref(":active")}} hoặc được đặt động bằng JavaScript.

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("transition-behavior")}}
- {{cssxref("transition-delay")}}
- {{cssxref("transition-duration")}}
- {{cssxref("transition-property")}}
- {{cssxref("transition-timing-function")}}

## Cú pháp

```css
/* Áp dụng cho 1 thuộc tính */
/* tên thuộc tính | thời lượng */
transition: margin-right 4s;

/* tên thuộc tính | thời lượng | độ trễ */
transition: margin-right 4s 1s;

/* tên thuộc tính | thời lượng | hàm easing */
transition: margin-right 4s ease-in-out;

/* tên thuộc tính | thời lượng | hàm easing | độ trễ */
transition: margin-right 4s ease-in-out 1s;

/* tên thuộc tính | thời lượng | hành vi */
transition: display 4s allow-discrete;

/* Áp dụng cho 2 thuộc tính */
transition:
  margin-right 4s,
  color 1s;

/* Áp dụng cho tất cả thuộc tính thay đổi */
transition: all 0.5s ease-out allow-discrete;
transition: 200ms linear 50ms;

/* Giá trị toàn cục */
transition: inherit;
transition: initial;
transition: revert;
transition: revert-layer;
transition: unset;
```

Giá trị thuộc tính `transition` được chỉ định là một trong:

- Giá trị đặc biệt `none`, chỉ định rằng không có transition nào xảy ra trên phần tử này. Đây là giá trị mặc định.
- Một hoặc nhiều transition cho thuộc tính đơn, được phân tách bằng dấu phẩy.

Mỗi transition cho thuộc tính đơn mô tả transition sẽ được áp dụng cho một thuộc tính hoặc tất cả các thuộc tính. Nó bao gồm:

- không hoặc một giá trị đại diện cho thuộc tính hoặc các thuộc tính mà transition sẽ được áp dụng. Điều này có thể được đặt như:
  - Một {{cssxref("&lt;custom-ident&gt;")}} đại diện cho một thuộc tính đơn.
  - Giá trị đặc biệt `all`, chỉ định rằng transition sẽ được áp dụng cho tất cả các thuộc tính thay đổi khi phần tử thay đổi trạng thái.
  - Không có giá trị, trong trường hợp đó giá trị `all` sẽ được suy ra và transition được chỉ định vẫn áp dụng cho tất cả các thuộc tính thay đổi.
- không hoặc một giá trị {{cssxref("easing-function")}} đại diện cho hàm easing để sử dụng
- không, một hoặc hai giá trị {{cssxref("&lt;time&gt;")}}. Giá trị đầu tiên có thể được phân tích là thời gian được gán cho {{cssxref("transition-duration")}}, và giá trị thứ hai có thể được phân tích là thời gian được gán cho {{cssxref("transition-delay")}}.
- không hoặc một giá trị khai báo xem có bắt đầu transition cho các thuộc tính có hành vi hoạt ảnh là [rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete) hay không. Giá trị, nếu có, là từ khóa `allow-discrete` hoặc từ khóa `normal`.

Nếu bạn chỉ định `all` là thuộc tính transition cho một transition thuộc tính đơn, nhưng sau đó chỉ định các transition thuộc tính đơn tiếp theo với giá trị {{cssxref("&lt;custom-ident&gt;")}}, các transition tiếp theo đó sẽ ghi đè cái đầu tiên. Ví dụ:

```css
transition:
  all 200ms,
  opacity 400ms;
```

Trong trường hợp này, tất cả các thuộc tính thay đổi khi phần tử thay đổi trạng thái sẽ có transition với thời lượng 200ms ngoại trừ {{cssxref("opacity")}}, sẽ mất 400ms để transition.

Xem [cách xử lý mọi thứ](/en-US/docs/Web/CSS/Guides/Transitions/Using#when_property_value_lists_are_of_different_lengths) khi danh sách giá trị thuộc tính có độ dài khác nhau. Tóm lại, các mô tả transition vượt quá số lượng thuộc tính thực sự đang được hoạt ảnh sẽ bị bỏ qua.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, khi người dùng di chuột qua phần tử, có độ trễ nửa giây (`500ms`) trước khi transition `background-color` kéo dài hai giây xảy ra.

#### HTML

```html
<a class="target">Hover over me</a>
```

#### CSS

Chúng ta bao gồm hai giá trị {{cssxref("time")}}. Trong viết tắt `transition`, giá trị `<time>` đầu tiên là `transition-duration`. Giá trị thời gian thứ hai là `transition-delay`. Cả hai mặc định là `0s` nếu bị bỏ qua.

```css
.target {
  font-size: 2rem;
  background-color: palegoldenrod;
  transition: background-color 2s 500ms;
}

.target:hover {
  background-color: darkorange;
}
```

{{EmbedLiveSample('Basic_example', 600, 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Mô-đun [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)
- [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
- {{ domxref("TransitionEvent") }}
