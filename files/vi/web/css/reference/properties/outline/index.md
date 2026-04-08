---
title: outline
slug: Web/CSS/Reference/Properties/outline
page-type: css-shorthand-property
browser-compat: css.properties.outline
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) viết tắt **`outline`** đặt hầu hết các thuộc tính outline trong một khai báo duy nhất.

{{InteractiveExample("CSS Demo: outline")}}

```css interactive-example-choice
outline: solid;
```

```css interactive-example-choice
outline: dashed red;
```

```css interactive-example-choice
outline: 1rem solid;
```

```css interactive-example-choice
outline: thick double #32a1ce;
```

```css interactive-example-choice
outline: 8px ridge rgb(170 50 220 / 0.6);
border-radius: 2rem;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with an outline around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  padding: 0.75rem;
  width: 80%;
  height: 100px;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("outline-width")}}
- {{cssxref("outline-style")}}
- {{cssxref("outline-color")}}

## Cú pháp

```css
/* style */
outline: solid;

/* style | color */
outline: dashed #ff6666;

/* width | style */
outline: thick inset;

/* width | style | color*/
outline: 3px solid green;

/* Giá trị toàn cục */
outline: inherit;
outline: initial;
outline: revert;
outline: revert-layer;
outline: unset;
```

Thuộc tính `outline` có thể được chỉ định bằng một, hai hoặc ba giá trị liệt kê bên dưới. Thứ tự của các giá trị không quan trọng. Như với tất cả các thuộc tính viết tắt, bất kỳ giá trị con nào bị bỏ qua sẽ được đặt về [giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value).

> [!NOTE]
> Outline sẽ vô hình với nhiều phần tử nếu kiểu của nó không được xác định. Điều này là do kiểu mặc định là `none`. Một ngoại lệ đáng chú ý là các phần tử `input`, được trình duyệt cấp kiểu mặc định.

### Giá trị

- `<'outline-width'>`
  - : Đặt độ dày của outline. Mặc định là `medium` nếu bị bỏ qua. Xem {{cssxref("outline-width")}}.
- `<'outline-style'>`
  - : Đặt kiểu của outline. Mặc định là `none` nếu bị bỏ qua. Xem {{cssxref("outline-style")}}.
- `<'outline-color'>`
  - : Đặt màu của outline. Mặc định là `invert` cho các trình duyệt hỗ trợ nó, `currentColor` cho các trình duyệt khác. Xem {{cssxref("outline-color")}}.

## Mô tả

Outline là đường kẻ bên ngoài [border](/en-US/docs/Web/CSS/Reference/Properties/border) của phần tử. Không giống như các vùng khác của hộp, outline không chiếm không gian, vì vậy chúng không ảnh hưởng đến bố cục tài liệu theo bất kỳ cách nào.

Có một số thuộc tính ảnh hưởng đến giao diện của outline. Có thể thay đổi kiểu, màu sắc và chiều rộng bằng thuộc tính `outline`, khoảng cách từ border bằng thuộc tính {{cssxref("outline-offset")}}, và góc bo tròn bằng thuộc tính {{cssxref("border-radius")}}.

Outline không bắt buộc phải là hình chữ nhật: Khi xử lý văn bản nhiều dòng, một số trình duyệt sẽ vẽ outline cho từng hộp dòng riêng biệt, trong khi các trình duyệt khác sẽ bao toàn bộ văn bản bằng một outline duy nhất.

## Khả năng tiếp cận

Việc gán `outline` giá trị `0` hoặc `none` sẽ xóa kiểu tiêu điểm mặc định của trình duyệt. Nếu một phần tử có thể tương tác, nó phải có chỉ báo tiêu điểm hiển thị. Hãy cung cấp kiểu tiêu điểm rõ ràng nếu kiểu tiêu điểm mặc định bị xóa.

- [How to Design Useful and Usable Focus Indicators](https://www.deque.com/blog/give-site-focus-tips-designing-usable-focus-indicators/)
- WCAG 2.1: [Understanding Success Criterion 2.4.7: Focus Visible](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng outline để đặt kiểu tiêu điểm

#### HTML

```html
<a href="#">This link has a special focus style.</a>
```

#### CSS

```css
a {
  border: 1px solid;
  border-radius: 3px;
  display: inline-block;
  margin: 10px;
  padding: 5px;
}

a:focus {
  outline: 4px dotted #ee7733;
  outline-offset: 4px;
  background: #ffffaa;
}
```

#### Kết quả

{{EmbedLiveSample("Using_outline_to_set_a_focus_style", "100%", 85)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("outline-width")}}
- {{cssxref("outline-style")}}
- {{cssxref("outline-color")}}
- {{Cssxref("border")}}
