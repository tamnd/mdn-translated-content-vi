---
title: :empty
slug: Web/CSS/Reference/Selectors/:empty
page-type: css-pseudo-class
browser-compat: css.selectors.empty
sidebar: cssref
---

**`:empty`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử nào không có con. Con có thể là các nút phần tử hoặc văn bản (bao gồm khoảng trắng). Các chú thích, chỉ thị xử lý và {{cssxref("content")}} của CSS không ảnh hưởng đến việc một phần tử được xem là rỗng hay không.

{{InteractiveExample("CSS Demo: :empty", "tabbed-shorter")}}

```css interactive-example
div:empty {
  outline: 2px solid deeppink;
  height: 1em;
}
```

```html interactive-example
<p>Element with no content:</p>
<div></div>

<p>Element with comment:</p>
<div><!-- A comment --></div>

<p>Element with nested empty element:</p>
<div><p></p></div>
```

> [!NOTE]
> Trong [Selectors Level 4](https://drafts.csswg.org/selectors-4/#the-empty-pseudo), lớp giả `:empty` đã được thay đổi để hoạt động như {{CSSxRef(":-moz-only-whitespace")}}, nhưng hiện tại chưa có trình duyệt nào hỗ trợ điều này.

## Cú pháp

```css
:empty {
  /* ... */
}
```

## Khả năng tiếp cận

Các công nghệ hỗ trợ như trình đọc màn hình không thể phân tích nội dung tương tác rỗng. Tất cả nội dung tương tác phải có tên có thể tiếp cận, được tạo bằng cách cung cấp giá trị văn bản cho phần tử cha của điều khiển tương tác ([liên kết](/en-US/docs/Web/HTML/Reference/Elements/a), [nút](/en-US/docs/Web/HTML/Reference/Elements/button), v.v.). Tên có thể tiếp cận hiển thị điều khiển tương tác cho [cây khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis), một API truyền đạt thông tin hữu ích cho các công nghệ hỗ trợ.

Văn bản cung cấp tên có thể tiếp cận của điều khiển tương tác có thể được ẩn bằng [tổ hợp các thuộc tính](https://gomakethings.com/hidden-content-for-better-a11y/#hiding-the-link) giúp loại bỏ nó về mặt hình ảnh khỏi màn hình nhưng vẫn có thể được phân tích bởi công nghệ hỗ trợ. Điều này thường được sử dụng cho các nút chỉ dựa vào biểu tượng để truyền đạt mục đích.

- [What is an accessible name? | Vispero](https://vispero.com/resources/what-is-an-accessible-name/)
- [Hidden content for better a11y | Go Make Things](https://gomakethings.com/hidden-content-for-better-a11y/)
- [MDN Understanding WCAG, Guideline 2.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_%e2%80%94_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Understanding Success Criterion 2.4.4 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-refs.html)

## Ví dụ

### HTML

```html
<div class="box"><!-- I will be lime. --></div>
<div class="box">I will be pink.</div>
<div class="box">
  <!-- I will be pink in older browsers because of the whitespace around this comment. -->
</div>
<div class="box">
  <p>
    <!-- I will be pink in all browsers because of the non-collapsible whitespace and elements around this comment. -->
  </p>
</div>
```

### CSS

```css hidden
body {
  display: flex;
  justify-content: space-around;
}
```

```css
.box {
  background: pink;
  height: 80px;
  width: 80px;
}

.box:empty {
  background: lime;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 80)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":-moz-only-whitespace")}} — Triển khai {{glossary("Vendor_Prefix", "có tiền tố")}} của các thay đổi trong [Selectors Level 4](https://drafts.csswg.org/selectors-4/#the-empty-pseudo)
- {{CSSxRef(":blank")}}
