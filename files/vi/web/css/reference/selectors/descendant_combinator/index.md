---
title: Descendant combinator
slug: Web/CSS/Reference/Selectors/Descendant_combinator
page-type: css-combinator
browser-compat: css.selectors.descendant
sidebar: cssref
---

**Bộ kết hợp hậu duệ** — thường được biểu diễn bằng một ký tự khoảng trắng (" ") — kết hợp hai bộ chọn sao cho các phần tử khớp với bộ chọn thứ hai được chọn nếu chúng có phần tử tổ tiên (cha, cha của cha, cha của cha của cha, v.v.) khớp với bộ chọn đầu tiên. Các bộ chọn sử dụng bộ kết hợp hậu duệ được gọi là _bộ chọn hậu duệ_.

```css
/* List items that are descendants of the "my-things" list */
ul.my-things li {
  margin: 2em;
}
```

Về mặt kỹ thuật, bộ kết hợp hậu duệ là một hoặc nhiều ký tự khoảng trắng {{Glossary("CSS")}} — ký tự khoảng trắng và/hoặc một trong bốn ký tự điều khiển: ký tự xuống dòng, cấp trang, dòng mới và ký tự tab — giữa hai bộ chọn khi không có bộ kết hợp nào khác. Ngoài ra, các ký tự khoảng trắng tạo thành bộ kết hợp có thể chứa bất kỳ số lượng nhận xét CSS nào.

## Cú pháp

```css
selector1 selector2 {
  /* property declarations */
}
```

## Ví dụ

### CSS

```css
li {
  list-style-type: disc;
}

li li {
  list-style-type: circle;
}
```

### HTML

```html
<ul>
  <li>
    <div>Item 1</div>
    <ul>
      <li>Subitem A</li>
      <li>Subitem B</li>
    </ul>
  </li>
  <li>
    <div>Item 2</div>
    <ul>
      <li>Subitem A</li>
      <li>Subitem B</li>
    </ul>
  </li>
</ul>
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 160)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bộ kết hợp con](/en-US/docs/Web/CSS/Reference/Selectors/Child_combinator)
