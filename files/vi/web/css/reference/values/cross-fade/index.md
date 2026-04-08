---
title: cross-fade()
slug: Web/CSS/Reference/Values/cross-fade
page-type: css-function
browser-compat: css.types.image.cross-fade
sidebar: cssref
---

Hàm **`cross-fade()`** trong [CSS](/vi/docs/Web/CSS) có thể được sử dụng để pha trộn hai hoặc nhiều hình ảnh ở độ trong suốt đã định nghĩa.
Nó có thể được sử dụng cho nhiều thao tác hình ảnh cơ bản, chẳng hạn như tô màu hình ảnh với màu đặc hoặc làm nổi bật một khu vực cụ thể của trang bằng cách kết hợp hình ảnh với gradient xuyên tâm.

## Cú pháp

> [!WARNING]
> Thông số kỹ thuật và các cài đặt hiện tại có cú pháp khác nhau.
> Cú pháp thông số kỹ thuật được giải thích trước.

### Cú pháp thông số kỹ thuật

Hàm `cross-fade()` nhận danh sách các hình ảnh với tỷ lệ phần trăm xác định bao nhiêu phần của mỗi hình ảnh được giữ lại về mặt độ mờ khi nó được pha trộn với các hình ảnh khác. Giá trị phần trăm phải được mã hóa không có dấu ngoặc kép, phải chứa ký hiệu `'%'`, và giá trị của nó phải nằm giữa 0% và 100%.

Hàm có thể được sử dụng trong CSS ở bất kỳ đâu có thể sử dụng tham chiếu hình ảnh thông thường.

#### Tỷ lệ phần trăm cross-fade

Hãy nghĩ về tỷ lệ phần trăm như giá trị độ mờ cho mỗi hình ảnh. Điều này có nghĩa là giá trị 0% có nghĩa là hình ảnh hoàn toàn trong suốt trong khi giá trị 100% làm cho hình ảnh hoàn toàn đục.

```css
cross-fade(url("white.png") 0%, url("black.png") 100%); /* hoàn toàn đen */
cross-fade(url("white.png") 25%, url("black.png") 75%); /* 25% trắng, 75% đen */
cross-fade(url("white.png") 50%, url("black.png") 50%); /* 50% trắng, 50% đen */
cross-fade(url("white.png") 75%, url("black.png") 25%); /* 75% trắng, 25% đen */
cross-fade(url("white.png") 100%, url("black.png") 0%); /* hoàn toàn trắng */
cross-fade(url("green.png") 75%, url("red.png") 75%); /* cả green và red ở 75% */
```

Nếu bất kỳ tỷ lệ phần trăm nào bị bỏ qua, tất cả các tỷ lệ phần trăm được chỉ định được cộng lại và trừ đi từ `100%`.
Nếu kết quả lớn hơn 0%, kết quả sau đó được chia đều cho tất cả các hình ảnh có tỷ lệ phần trăm bị bỏ qua.

Trong trường hợp đơn giản nhất, hai hình ảnh được pha dần vào nhau. Để làm điều đó, chỉ một trong các hình ảnh cần có tỷ lệ phần trăm, hình ảnh kia sẽ được pha dần tương ứng.
Ví dụ, giá trị 0% được định nghĩa cho hình ảnh đầu tiên chỉ mang lại hình ảnh thứ hai, trong khi 100% chỉ mang lại hình ảnh đầu tiên.
Giá trị 25% hiển thị hình ảnh đầu tiên ở 25% và hình ảnh thứ hai ở 75%. Giá trị 75% là ngược lại, hiển thị hình ảnh đầu tiên ở 75% và hình ảnh thứ hai ở 25%.

Ở trên cũng có thể được viết như sau:

```css
cross-fade(url("white.png") 0%, url("black.png")); /* hoàn toàn đen */
cross-fade(url("white.png") 25%, url("black.png")); /* 25% trắng, 75% đen */
cross-fade(url("white.png"), url("black.png")); /* 50% trắng, 50% đen */
cross-fade(url("white.png") 75%, url("black.png")); /* 75% trắng, 25% đen */
cross-fade(url("white.png") 100%, url("black.png")); /* hoàn toàn trắng */
cross-fade(url("green.png") 75%, url("red.png") 75%); /* cả green và red ở 75% */
```

Nếu không có tỷ lệ phần trăm nào được khai báo, cả hai hình ảnh sẽ ở 50% độ mờ, với cross-fade hiển thị như sự hợp nhất đều của cả hai hình ảnh.
Ví dụ 50%/50% ở trên không cần liệt kê các tỷ lệ phần trăm, vì khi giá trị tỷ lệ phần trăm bị bỏ qua, các tỷ lệ phần trăm đã bao gồm được cộng lại và trừ đi từ 100%.
Kết quả, nếu lớn hơn 0, sau đó được chia đều cho tất cả các hình ảnh có tỷ lệ phần trăm bị bỏ qua.

Trong ví dụ cuối cùng, tổng của cả hai tỷ lệ phần trăm không phải là 100%, và do đó cả hai hình ảnh đều bao gồm độ mờ tương ứng của chúng.

Nếu không có tỷ lệ phần trăm nào được khai báo và ba hình ảnh được bao gồm, mỗi hình ảnh sẽ ở 33,33% độ mờ. Hai dòng sau đây (gần như) giống hệt nhau:

```css
cross-fade(url("red.png"), url("yellow.png"), url("blue.png")); /* tất cả ba sẽ ở 33.3333% độ mờ */
cross-fade(url("red.png") 33.33%, url("yellow.png") 33.33%, url("blue.png") 33.33%);
```

### Cú pháp cũ, đã được cài đặt

```css
cross-fade( <image>, <image>, <percentage> )
```

Thông số kỹ thuật cho hàm `cross-fade()` cho phép nhiều hình ảnh và mỗi hình ảnh có các giá trị độ trong suốt độc lập với các giá trị khác.
Điều này không phải lúc nào cũng như vậy.
Cú pháp gốc, đã được cài đặt trong một số trình duyệt, chỉ cho phép hai hình ảnh, với tổng độ trong suốt của hai hình ảnh đó chính xác là 100%.
Cú pháp gốc được hỗ trợ trong Safari và được hỗ trợ với tiền tố `-webkit-` trong Chrome, Opera, và các trình duyệt dựa trên blink khác.

```css
cross-fade(url("white.png"), url("black.png"), 0%);   /* hoàn toàn đen */
cross-fade(url("white.png"), url("black.png"), 25%);  /* 25% trắng, 75% đen */
cross-fade(url("white.png"), url("black.png"), 50%);  /* 50% trắng, 50% đen */
cross-fade(url("white.png"), url("black.png"), 75%);  /* 75% trắng, 25% đen */
cross-fade(url("white.png"), url("black.png"), 100%); /* hoàn toàn trắng */
```

Trong cú pháp đã được cài đặt, hai hình ảnh được phân tách bằng dấu phẩy được khai báo trước, theo sau là dấu phẩy và giá trị phần trăm bắt buộc. Bỏ qua dấu phẩy hoặc phần trăm làm cho giá trị không hợp lệ.
Phần trăm là độ mờ của hình ảnh được khai báo đầu tiên. Tỷ lệ phần trăm đã bao gồm được trừ đi từ 100%, với hiệu là độ mờ của hình ảnh thứ hai.

Ví dụ green/red (với tổng phần trăm là 150%) và ví dụ yellow/red/blue (với ba hình ảnh) từ phần cú pháp thông số kỹ thuật, không thể thực hiện trong cài đặt này.

## Khả năng truy cập

Trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt gì cho người dùng.
Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó một cách ngữ nghĩa trong tài liệu.
Khi sử dụng hình ảnh nền, hãy đảm bảo độ tương phản màu đủ lớn để bất kỳ văn bản nào cũng dễ đọc trên hình ảnh cũng như khi hình ảnh bị thiếu.

- [MDN Hiểu WCAG, Giải thích hướng dẫn 1.1](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Hiểu Tiêu chí Thành công 1.1.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cú pháp cũ cho cross-fade

#### HTML

```html
<div class="cross-fade"></div>
```

#### CSS

```css
.cross-fade {
  width: 300px;
  height: 300px;
  background-image: -webkit-cross-fade(url("br.png"), url("tr.png"), 75%);
  background-image: cross-fade(url("br.png"), url("tr.png"), 75%);
}
```

#### Kết quả

{{EmbedLiveSample("Older_syntax_for_cross-fade", "330", "330")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("image")}}
- {{cssxref("url_value", "&lt;url&gt;")}}
- {{cssxref("image/image", "image()")}}
- {{cssxref("image/image-set", "image-set()")}}
- {{cssxref("element")}}
- [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient: {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
