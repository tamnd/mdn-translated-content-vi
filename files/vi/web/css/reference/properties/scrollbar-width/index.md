---
title: scrollbar-width
slug: Web/CSS/Reference/Properties/scrollbar-width
page-type: css-property
browser-compat: css.properties.scrollbar-width
sidebar: cssref
---

Thuộc tính **`scrollbar-width`** cho phép tác giả đặt độ dày mong muốn của thanh cuộn của một phần tử khi chúng được hiển thị.

Mục đích của `scrollbar-width` là tối ưu hóa không gian chiếm bởi thanh cuộn trên trang hoặc phần tử; mục đích không liên quan đến thẩm mỹ của thanh cuộn. Các giá trị từ khóa được định sẵn của `scrollbar-width` chỉ ra cho user agent xem nên hiển thị thanh cuộn bình thường hay nhỏ hơn. Tránh sử dụng `none`, vì ẩn thanh cuộn ảnh hưởng tiêu cực đến [khả năng tiếp cận](#khả-năng-tiếp-cận).

> [!NOTE]
> Đối với các phần tử chỉ có thể cuộn qua phương tiện lập trình chứ không phải tương tác trực tiếp của người dùng, hãy sử dụng thuộc tính {{cssxref("overflow")}} với giá trị `hidden` thay vì `scrollbar-width: none`.

## Cú pháp

```css
/* Giá trị từ khóa */
scrollbar-width: auto;
scrollbar-width: thin;
scrollbar-width: none;

/* Giá trị toàn cục */
scrollbar-width: inherit;
scrollbar-width: initial;
scrollbar-width: revert;
scrollbar-width: revert-layer;
scrollbar-width: unset;
```

### Giá trị

- `auto`
  - : Độ rộng thanh cuộn mặc định của nền tảng.
- `thin`
  - : Biến thể độ rộng thanh cuộn mỏng trên các nền tảng cung cấp tùy chọn đó, hoặc thanh cuộn mỏng hơn độ rộng thanh cuộn nền tảng mặc định.
- `none`
  - : Không hiển thị thanh cuộn, tuy nhiên phần tử vẫn có thể cuộn.

> [!NOTE]
> User Agent phải áp dụng bất kỳ giá trị `scrollbar-width` nào được đặt trên phần tử gốc cho viewport.

## Khả năng tiếp cận

Sử dụng thuộc tính này một cách thận trọng — đặt `scrollbar-width` thành `thin` hoặc `none` có thể làm cho nội dung khó hoặc không thể cuộn nếu tác giả không cung cấp cơ chế cuộn thay thế. Trong khi cử chỉ vuốt hoặc con lăn chuột có thể cho phép cuộn trên nội dung như vậy, một số thiết bị không có cách cuộn thay thế.

Tiêu chí WCAG 2.1.1 (Keyboard) đã tồn tại từ lâu để tư vấn về khả năng tiếp cận bàn phím cơ bản, và điều này nên bao gồm cuộn các vùng nội dung. Và được giới thiệu trong WCAG 2.1, tiêu chí 2.5.5 (Target Size) khuyến nghị các mục tiêu cảm ứng phải có chiều rộng và chiều cao ít nhất 44px (mặc dù vấn đề phức tạp hơn trên màn hình độ phân giải cao; khuyến nghị kiểm tra kỹ lưỡng).

- [MDN Understanding WCAG, Guideline 2.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.1_—_keyboard_accessible_make_all_functionality_available_from_a_keyboard)
- [MDN Understanding WCAG, Guideline 2.5 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.5_input_modalities_make_it_easier_for_users_to_operate_functionality_through_various_inputs_beyond_keyboard)
- [Understanding Success Criterion 2.1.1 | W3C Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/keyboard)
- [Understanding Success Criterion 2.5.5 | W3C Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html)

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Điều chỉnh kích thước thanh cuộn tràn

#### CSS

```css
.scroller {
  width: 300px;
  height: 100px;
  overflow-y: scroll;
  scrollbar-width: thin;
}
```

#### HTML

```html
<div class="scroller">
  Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion
  daikon amaranth tatsoi tomatillo melon azuki bean garlic. Gumbo beet greens
  corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts
  fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber
  earthnut pea peanut soko zucchini.
</div>
```

#### Kết quả

{{EmbedLiveSample("Sizing_overflow_scrollbars")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scrollbars styling](/en-US/docs/Web/CSS/Guides/Scrollbars_styling)
- {{CSSxRef("overflow")}}
- {{CSSxRef("scrollbar-gutter")}}
- {{CSSxRef("scrollbar-color")}}
