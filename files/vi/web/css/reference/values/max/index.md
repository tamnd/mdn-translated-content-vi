---
title: max()
slug: Web/CSS/Reference/Values/max
page-type: css-function
browser-compat: css.types.max
sidebar: cssref
---

Hàm **`max()`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn đặt giá trị lớn nhất (dương nhất) từ danh sách các biểu thức phân cách bằng dấu phẩy làm giá trị của thuộc tính CSS. Hàm `max()` có thể được dùng ở bất kỳ nơi nào cho phép {{CSSxRef("&lt;length&gt;")}}, {{CSSxRef("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{CSSxRef("&lt;time&gt;")}}, {{CSSxRef("&lt;percentage&gt;")}}, {{CSSxRef("&lt;number&gt;")}} hoặc {{CSSxRef("&lt;integer&gt;")}}.

{{InteractiveExample("CSS Demo: max()")}}

```css interactive-example-choice
width: max(20vw, 400px);
```

```css interactive-example-choice
width: max(20vw, 100px);
```

```css interactive-example-choice
width: max(5vw, 100px);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <img
      alt="Firefox logo"
      class="logo"
      src="/shared-assets/images/examples/firefox-logo.svg" />
  </div>
</section>
```

Trong ví dụ đầu tiên được hiển thị ở trên, chiều rộng sẽ ít nhất là 400px, nhưng sẽ rộng hơn nếu viewport rộng hơn 2000px (trong trường hợp đó 1vw sẽ là 20px, nên 20vw sẽ là 400px). Kỹ thuật này sử dụng một đơn vị tuyệt đối để chỉ định giá trị tối thiểu cố định cho thuộc tính và một đơn vị tương đối để cho phép giá trị tăng lên phù hợp với các viewport lớn hơn.

## Cú pháp

```css
max(1, 2, 3)
max(1px, 2px, 3px)
```

### Tham số

Hàm `max()` nhận một hoặc nhiều biểu thức phân cách bằng dấu phẩy làm tham số, với giá trị biểu thức lớn nhất (dương nhất) được sử dụng làm giá trị của thuộc tính được gán cho nó.

Các biểu thức có thể là biểu thức toán học (sử dụng các toán tử số học), giá trị ký tự hoặc các biểu thức khác, chẳng hạn như {{cssxref("attr()")}}, đánh giá thành một kiểu đối số hợp lệ (như {{CSSxRef("&lt;length&gt;")}}), hoặc các hàm {{cssxref("min()")}} và `max()` lồng nhau.

Bạn có thể dùng các đơn vị khác nhau cho mỗi giá trị trong biểu thức của mình. Bạn cũng có thể dùng dấu ngoặc để thiết lập thứ tự tính toán khi cần.

### Ghi chú

- Các biểu thức toán học liên quan đến phần trăm cho chiều rộng và chiều cao trên các cột bảng, nhóm cột bảng, hàng bảng, nhóm hàng bảng và ô bảng trong cả bảng bố cục tự động và cố định _có thể_ được xử lý như thể `auto` được chỉ định.
- Được phép lồng các hàm `min()` và `max()` khác làm giá trị biểu thức. Các biểu thức là biểu thức toán học đầy đủ, vì vậy bạn có thể dùng phép cộng, trừ, nhân và chia trực tiếp mà không cần dùng chính hàm calc().
- Biểu thức có thể là các giá trị kết hợp các toán tử cộng ( + ), trừ ( - ), nhân ( \* ) và chia ( / ), sử dụng các quy tắc ưu tiên toán tử tiêu chuẩn. Đảm bảo đặt khoảng trắng ở mỗi bên của các toán hạng + và -. Các toán hạng trong biểu thức có thể là bất kỳ giá trị cú pháp \<length> nào.
- Bạn có thể (và thường cần phải) kết hợp các giá trị `min()` và `max()`, hoặc dùng `max()` trong hàm `clamp()` hoặc `calc()`.

## Cú pháp hình thức

{{CSSSyntax}}

## Khả năng truy cập

Khi `max()` được dùng để kiểm soát kích thước văn bản, hãy đảm bảo văn bản luôn đủ lớn để đọc. Gợi ý là dùng hàm {{cssxref("min()")}} lồng trong `max()` có giá trị thứ hai là [đơn vị độ dài tương đối](/vi/docs/Web/CSS/Reference/Values/length#đơn_vị_độ_dài_tương_đối) luôn đủ lớn để đọc. Ví dụ:

```css
small {
  font-size: max(min(0.5vw, 0.5em), 1rem);
}
```

Điều này đảm bảo kích thước tối thiểu là _1rem_, với kích thước văn bản thu phóng nếu trang được phóng to.

- [MDN Hiểu WCAG, Hướng dẫn 1.4](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.4 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Ví dụ

### Đặt kích thước tối thiểu cho phông chữ

Một trường hợp sử dụng khác của `max()` là cho phép kích thước phông chữ tăng lên trong khi đảm bảo nó ít nhất ở kích thước tối thiểu, cho phép kích thước phông chữ đáp ứng trong khi vẫn đảm bảo khả năng đọc.

Hãy xem một số CSS:

```css
h1 {
  font-size: 2rem;
}
h1.responsive {
  font-size: max(4vw, 2em, 2rem);
}
```

Kích thước phông chữ sẽ ít nhất là 2rem, hoặc gấp đôi kích thước mặc định của phông chữ cho trang. Điều này đảm bảo rằng nó có thể đọc được và dễ tiếp cận.

```html
<h1>This text is always legible, but doesn't change size</h1>
<h1 class="responsive">
  This text is always legible, and is responsive, to a point
</h1>
```

{{EmbedLiveSample("Setting_a_minimum_size_for_a_font", "100%", "300")}}

Hãy nghĩ về hàm `max()` như việc tìm giá trị tối thiểu được phép cho một thuộc tính.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("calc()")}}
- {{cssxref("clamp()")}}
- {{cssxref("min()")}}
- [Học: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
