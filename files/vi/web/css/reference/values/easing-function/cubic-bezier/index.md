---
title: cubic-bezier()
slug: Web/CSS/Reference/Values/easing-function/cubic-bezier
page-type: css-function
browser-compat: css.types.easing-function.cubic-bezier
sidebar: cssref
---

Hàm [CSS](/vi/docs/Web/CSS) **`cubic-bezier()`** tạo ra một chuyển đổi mượt mà bằng cách sử dụng đường cong [Bézier](/vi/docs/Glossary/Bezier_curve) bậc ba.
Là một {{cssxref("easing-function")}}, nó có thể được dùng để làm mượt điểm bắt đầu và kết thúc của {{Glossary("interpolation", "nội suy")}}.

## Cú pháp

```css
cubic-bezier(0.25, 0.1, 0.25, 1)
cubic-bezier(0.1, -0.6, 0.2, 0)
cubic-bezier(0, 0, 1, 1)
```

### Tham số

Hàm nhận bốn tham số sau, biểu diễn tọa độ của hai điểm kiểm soát:

- `<x1>`
  - : Một {{cssxref("&lt;number&gt;")}} biểu diễn tọa độ trục x của điểm kiểm soát thứ nhất.
    Phải nằm trong khoảng `[0, 1]`.
- `<y1>`
  - : Một {{cssxref("&lt;number&gt;")}} biểu diễn tọa độ trục y của điểm kiểm soát thứ nhất.
- `<x2>`
  - : Một {{cssxref("&lt;number&gt;")}} biểu diễn tọa độ trục x của điểm kiểm soát thứ hai.
    Phải nằm trong khoảng `[0, 1]`.
- `<y2>`
  - : Một {{cssxref("&lt;number&gt;")}} biểu diễn tọa độ trục y của điểm kiểm soát thứ hai.

## Mô tả

Các hàm Bézier bậc ba, thường được gọi là các hàm làm mượt "mượt mà", liên kết một tiến trình đầu vào với một tiến trình đầu ra, cả hai đều được biểu thị dưới dạng {{cssxref("&lt;number&gt;")}}, trong đó `0.0` biểu diễn trạng thái ban đầu và `1.0` biểu diễn trạng thái cuối.
Nếu đường cong Bézier bậc ba không hợp lệ, CSS bỏ qua toàn bộ thuộc tính.

Một đường cong Bézier bậc ba được định nghĩa bởi bốn điểm: P0, P1, P2 và P3. Các điểm P0 và P3 biểu diễn điểm đầu và điểm cuối của đường cong. Trong CSS, điểm bắt đầu P0 được cố định tại `(0, 0)` và điểm cuối P3 được cố định tại `(1, 1)`, trong khi các điểm trung gian P1 và P2 được định nghĩa bởi các tham số hàm `(<x1>, <y1>)` và `(<x2>, <y2>)` tương ứng. Trục x biểu diễn tiến trình đầu vào và trục y biểu diễn tiến trình đầu ra.

![Đồ thị tiến trình đầu vào sang tiến trình đầu ra hiển thị đường cong S từ gốc tọa độ đến (1, 1) với các điểm kiểm soát Bezier P1(0.1, 0.6) và P2(0.7, 0.2).](cubic-bezier.svg)

Không phải tất cả các đường cong Bézier bậc ba đều phù hợp làm hàm làm mượt vì không phải tất cả đều là [hàm toán học](https://en.wikipedia.org/wiki/Function_%28mathematics%29); tức là, đường cong mà với một tọa độ trục x nhất định có giá trị bằng không hoặc một. Với P0 và P3 được cố định như định nghĩa bởi CSS, một đường cong Bézier bậc ba là hàm và hợp lệ khi tọa độ trục x của P1 và P2 đều nằm trong khoảng [0, 1].

Các đường cong Bézier bậc ba với tung độ P1 hoặc P2 nằm ngoài khoảng `[0, 1]` có thể khiến giá trị vượt quá trạng thái cuối rồi quay lại. Trong hoạt ảnh, điều này tạo ra một loại hiệu ứng "nảy".

![Các đồ thị của hàm làm mượt cubic-bezier(0.3, 0.2, 0.2, 1.4), một trong số đó hiển thị tiến trình đầu ra vượt quá 1 bắt đầu từ một tiến trình đầu vào nhất định, cái còn lại hiển thị tiến trình đầu ra đạt đến và sau đó ở lại 1.](cubic-bezier_out_of_range.svg)

Tuy nhiên, một số thuộc tính sẽ giới hạn đầu ra nếu nó vượt ra ngoài phạm vi cho phép. Ví dụ, thành phần màu lớn hơn `255` hoặc nhỏ hơn `0` trong {{CSSXref("color_value/rgb", "rgb()")}} sẽ bị cắt về giá trị gần nhất được phép (`255` và `0`, tương ứng). Một số giá trị `cubic-bezier()` thể hiện tính chất này.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Hiệu ứng nảy

Trong ví dụ này, quả bóng đỏ nảy ra khỏi hộp khi được chuyển từ vị trí ban đầu. Điều này xảy ra vì một trong các giá trị P2 là `2.3`, vượt quá khoảng `[0, 1]`.

```html hidden
<div tabindex="0">
  <span></span>
</div>
```

```css hidden
div {
  margin: 8px auto;
  padding: 8px;
  width: 256px;
  border-radius: 40px;
  background-color: wheat;
}

span {
  display: block;
  width: 64px;
  height: 64px;
  border-radius: 50%;
  background: tomato;
}

div:hover span,
div:focus span {
  translate: 192px 0;
}
```

```css
span {
  transition: translate 0.3s cubic-bezier(0.3, 0.8, 0.3, 2.3);
}
```

{{EmbedLiveSample("Bouncing effect")}}

### Sử dụng hàm cubic-bezier()

Các đường cong Bézier bậc ba này hợp lệ để dùng trong CSS:

```css example-good
/* Đường cong Bézier chính tắc với bốn <number> trong khoảng [0,1] */
cubic-bezier(0.1, 0.7, 1.0, 0.1)

/* Dùng <integer> hợp lệ vì mọi <integer> cũng là <number> */
cubic-bezier(0, 0, 1, 1)

/* Giá trị âm cho tung độ hợp lệ, dẫn đến hiệu ứng nảy */
cubic-bezier(0.1, -0.6, 0.2, 0)

/* Giá trị lớn hơn 1.0 cho tung độ cũng hợp lệ */
cubic-bezier(0, 1.1, 0.8, 4)
```

Các định nghĩa đường cong Bézier bậc ba này không hợp lệ:

```css example-bad
/* Tham số phải là số */
cubic-bezier(0.1, red, 1.0, green)

/* Tọa độ X phải nằm trong khoảng [0, 1] */
cubic-bezier(2.45, 0.6, 4, 0.1)

/* Phải có đúng bốn tham số */
cubic-bezier(0.3, 2.1)

/* Tọa độ X phải nằm trong khoảng [0, 1] */
cubic-bezier(-1.9, 0.3, -0.2, 2.1)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hàm làm mượt khác: {{cssxref("easing-function/linear", "linear()")}} và {{cssxref("easing-function/steps", "steps()")}}
- Module [Hàm làm mượt CSS](/vi/docs/Web/CSS/Guides/Easing_functions)
- [cubic-bezier.com](https://cubic-bezier.com/) bởi Lea Verou
