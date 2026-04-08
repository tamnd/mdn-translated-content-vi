---
title: ::selection
slug: Web/CSS/Reference/Selectors/::selection
page-type: css-pseudo-element
browser-compat: css.selectors.selection
sidebar: cssref
---

Phần tử giả **`::selection`** trong [CSS](/en-US/docs/Web/CSS) áp dụng kiểu cho phần của tài liệu đã được người dùng tô sáng (chẳng hạn bằng cách nhấp và kéo chuột qua văn bản).

Phần tử giả `::selection` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

{{InteractiveExample("CSS Demo: ::selection", "tabbed-shorter")}}

```css interactive-example
p::selection {
  color: red;
  background-color: yellow;
}
```

```html interactive-example
<p>
  Select a fragment of this paragraph, to see how its appearance is affected.
</p>
```

## Các thuộc tính được phép sử dụng

Chỉ một số thuộc tính CSS nhất định có thể được dùng với `::selection`:

- {{CSSxRef("color")}}
- {{CSSxRef("background-color")}}
- {{CSSxRef("text-decoration")}} và các thuộc tính liên quan
- {{CSSxRef("text-shadow")}}
- {{CSSxRef("-webkit-text-stroke-color")}}, {{CSSxRef("-webkit-text-fill-color")}} và {{CSSxRef("-webkit-text-stroke-width")}}

Đặc biệt, {{CSSxRef("background-image")}} bị bỏ qua.

## Cú pháp

```css
::selection {
  /* ... */
}
```

## Khả năng tiếp cận

**Đừng ghi đè kiểu văn bản được chọn chỉ vì lý do thẩm mỹ** — người dùng có thể tùy chỉnh chúng theo nhu cầu của mình. Đối với những người có vấn đề về nhận thức hoặc ít thành thạo về công nghệ, những thay đổi bất ngờ đối với kiểu chọn có thể ảnh hưởng đến khả năng hiểu chức năng của họ.

Nếu có ghi đè, điều quan trọng là đảm bảo rằng **tỷ lệ tương phản** giữa màu văn bản và màu nền của vùng chọn đủ cao để những người có thị lực kém có thể đọc được.

Tỷ lệ tương phản màu được tìm thấy bằng cách so sánh độ sáng của văn bản được chọn và màu nền văn bản được chọn. Để đáp ứng [Hướng dẫn Tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, nội dung văn bản phải có tỷ lệ tương phản là **4.5:1**, hoặc 3:1 đối với văn bản lớn hơn như tiêu đề. (WCAG định nghĩa văn bản lớn là từ `18.66px` đến `24px` và [đậm](/en-US/docs/Web/CSS/Reference/Properties/font-weight), hoặc `24px` trở lên.)

- [WebAIM: Color Contrast Checker](https://webaim.org/resources/contrastchecker/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.3 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

## Ví dụ

### HTML

```html
This text has special styles when you highlight it.
<p>Also try selecting text in this paragraph.</p>
```

### CSS

```css hidden
::-moz-selection {
  color: gold;
  background-color: red;
}

p::-moz-selection {
  color: white;
  background-color: blue;
}
```

```css
/* Make selected text gold on a red background */
::selection {
  color: gold;
  background-color: red;
}

/* Make selected text in a paragraph white on a blue background */
p::selection {
  color: white;
  background-color: blue;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("pointer-events")}} - kiểm soát sự kiện nào đang hoạt động trên phần tử
