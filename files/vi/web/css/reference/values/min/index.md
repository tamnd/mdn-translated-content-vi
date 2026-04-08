---
title: min()
slug: Web/CSS/Reference/Values/min
page-type: css-function
browser-compat: css.types.min
sidebar: cssref
---

Hàm **`min()`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn đặt giá trị nhỏ nhất (âm nhất) từ danh sách các biểu thức phân cách bằng dấu phẩy làm giá trị của thuộc tính CSS. Hàm `min()` có thể được dùng ở bất kỳ nơi nào cho phép {{CSSxRef("&lt;length&gt;")}}, {{CSSxRef("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{CSSxRef("&lt;time&gt;")}}, {{CSSxRef("&lt;percentage&gt;")}}, {{CSSxRef("&lt;number&gt;")}} hoặc {{CSSxRef("&lt;integer&gt;")}}.

{{InteractiveExample("CSS Demo: min()")}}

```css interactive-example-choice
width: min(50vw, 200px);
```

```css interactive-example-choice
width: min(100vw, 4000px);
```

```css interactive-example-choice
width: min(150vw, 100px);
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

Trong ví dụ đầu tiên ở trên, chiều rộng sẽ tối đa là 200px, nhưng sẽ nhỏ hơn nếu viewport nhỏ hơn 400px (trong trường hợp đó 1vw sẽ là 4px, nên 50vw sẽ là 200px). Kỹ thuật này sử dụng một đơn vị tuyệt đối để chỉ định giá trị tối đa cố định cho thuộc tính và một đơn vị tương đối để cho phép giá trị thu hẹp lại phù hợp với các viewport nhỏ hơn.

## Cú pháp

```css
min(1, 2, 3)
min(1px, 2px, 3px)
```

### Tham số

Hàm `min()` nhận một hoặc nhiều biểu thức phân cách bằng dấu phẩy làm tham số, với kết quả giá trị biểu thức nhỏ nhất (âm nhất) được sử dụng làm giá trị.

Các biểu thức có thể là biểu thức toán học (sử dụng các toán tử số học), giá trị ký tự hoặc các biểu thức khác, chẳng hạn như {{cssxref("attr()")}}, đánh giá thành một kiểu đối số hợp lệ (như {{CSSxRef("&lt;length&gt;")}}).

Bạn có thể dùng các đơn vị khác nhau cho mỗi giá trị trong biểu thức của mình, nếu muốn. Bạn cũng có thể dùng dấu ngoặc để thiết lập thứ tự tính toán khi cần.

### Ghi chú

- Các biểu thức toán học liên quan đến phần trăm cho chiều rộng và chiều cao trên các cột bảng, nhóm cột bảng, hàng bảng, nhóm hàng bảng và ô bảng trong cả bảng bố cục tự động và cố định _có thể_ được xử lý như thể `auto` được chỉ định.
- Được phép lồng các hàm `max()` và `min()` khác làm giá trị biểu thức. Các biểu thức là biểu thức toán học đầy đủ, vì vậy bạn có thể dùng phép cộng, trừ, nhân và chia trực tiếp mà không cần dùng chính hàm `calc()`.
- Biểu thức có thể là các giá trị kết hợp các toán tử cộng ( + ), trừ ( - ), nhân ( \* ) và chia ( / ), sử dụng các quy tắc ưu tiên toán tử tiêu chuẩn. Đảm bảo đặt khoảng trắng ở mỗi bên của các toán hạng + và -. Các toán hạng trong biểu thức có thể là bất kỳ giá trị cú pháp `<length>` nào.
- Bạn có thể (và thường cần phải) kết hợp các giá trị `min()` và `max()`, hoặc dùng `min()` trong hàm `clamp()` hoặc `calc()`.
- Bạn có thể cung cấp nhiều hơn hai đối số, nếu bạn có nhiều ràng buộc để áp dụng.

## Cú pháp hình thức

{{CSSSyntax}}

## Khả năng truy cập

Khi dùng `min()` để đặt kích thước phông chữ tối đa, hãy đảm bảo rằng phông chữ vẫn có thể được thu phóng ít nhất 200% để dễ đọc (không có công nghệ hỗ trợ như chức năng zoom).

- [MDN Hiểu WCAG, Hướng dẫn 1.4](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.4 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Ví dụ

### Đặt kích thước tối đa cho nhãn và trường nhập

Một trường hợp sử dụng khác của `min()` là đặt kích thước tối đa trên các điều khiển biểu mẫu đáp ứng: cho phép chiều rộng của nhãn và đầu vào thu hẹp khi chiều rộng của biểu mẫu thu hẹp.

Hãy xem một số CSS:

```css
input,
label {
  padding: 2px;
  box-sizing: border-box;
  display: inline-block;
  width: min(40%, 400px);
  background-color: pink;
}

form {
  margin: 4px;
  border: 1px solid black;
  padding: 4px;
}
```

Ở đây, bản thân biểu mẫu, cùng với lề, đường viền và khoảng đệm, sẽ là 100% chiều rộng của phần tử cha. Chúng ta khai báo input và label là nhỏ hơn 40% chiều rộng biểu mẫu tính đến phần đệm hoặc 400px chiều rộng, tùy theo giá trị nào nhỏ hơn. Nói cách khác, chiều rộng tối đa mà nhãn và input có thể đạt là 400px. Chiều rộng hẹp nhất mà chúng sẽ là 40% chiều rộng biểu mẫu, rất nhỏ trên màn hình đồng hồ thông minh.

```html
<form>
  <label for="misc">Type something:</label>
  <input type="text" id="misc" name="misc" />
</form>
```

{{EmbedLiveSample("Setting_a_maximum_size_for_a_label_and_input", "100%", "110")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("calc()")}}
- {{cssxref("clamp()")}}
- {{cssxref("max()")}}
- [Học: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
