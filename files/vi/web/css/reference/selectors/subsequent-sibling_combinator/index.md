---
title: Subsequent-sibling combinator
slug: Web/CSS/Reference/Selectors/Subsequent-sibling_combinator
page-type: css-combinator
browser-compat: css.selectors.subsequent-sibling
sidebar: cssref
---

**Bộ kết hợp anh em tiếp theo** (`~`, dấu ngã) phân tách hai bộ chọn và khớp với _tất cả các phiên bản_ của phần tử thứ hai theo sau phần tử đầu tiên (không nhất thiết phải liền ngay) và có cùng phần tử cha.

Trong ví dụ sau, bộ kết hợp anh em tiếp theo (`~`) giúp chọn và tạo kiểu cho các đoạn văn là anh em của hình ảnh và xuất hiện sau bất kỳ hình ảnh nào.

```css
img ~ p {
  color: red;
}
```

## Cú pháp

```css-nolint
/* The white space around the ~ combinator is optional but recommended. */
former_element ~ target_element { style properties }
```

## Ví dụ

### Sử dụng bộ kết hợp với các bộ chọn đơn giản

Ví dụ này hiển thị việc sử dụng bộ kết hợp `~` khi cả hai bộ chọn đều là bộ chọn đơn giản (`p` và `span`).

```html
<article>
  <span>This is not red because it appears before any paragraph.</span>
  <p>Here is a paragraph.</p>
  <code>Here is some code.</code>
  <span>
    This span is red because it appears after the paragraph, even though there
    are other nodes in between.
  </span>
  <p>Whatever it may be, keep smiling.</p>
  <h1>Dream big</h1>
  <span>
    Doesn't matter how many or what kind of nodes are in between, all spans from
    the same parent after a paragraph are red.
  </span>
</article>
<span>
  This span is not red because it doesn't share a parent with a paragraph.
</span>
```

```css
p ~ span {
  color: red;
}
```

{{EmbedLiveSample("Using the combinator with simple selectors", "auto", 300)}}

### Sử dụng bộ kết hợp với các bộ chọn phức tạp

Ví dụ này chứa hai [bộ chọn phức tạp](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#complex_selector), cả hai đều sử dụng bộ kết hợp anh em tiếp theo: `.foo p ~ span` và `.foo p ~ .foo span`.

- Bộ chọn phức tạp đầu tiên, `.foo p ~ span`, khớp với tất cả span đến sau một đoạn văn _nếu_ span và đoạn văn có cùng cha **và** cha đó hoặc một tổ tiên của cha đó có lớp `.foo`.
- Bộ chọn phức tạp thứ hai, `.foo p ~ .foo span`, khớp với tất cả span là phần tử con của phần tử có lớp `.foo` _nếu_ phần tử đó là anh em của đoạn văn đã đề cập trước đó.

Ví dụ dưới đây cho thấy rằng phần tử đích trong bộ chọn phức tạp phải có cùng cha với phần tử ban đầu trong bộ chọn phức tạp.

```html
<h1>Dream big</h1>
<span>And yet again this is a red span!</span>
<div class="foo">
  <p>Here is another paragraph.</p>
  <span>A blue span</span>
  <div class="foo">
    <span>A green span</span>
  </div>
</div>
```

```css
.foo p ~ span {
  color: blue;
}

.foo p ~ .foo span {
  color: green;
}
```

{{EmbedLiveSample("Using the combinator with complex selectors", "auto", 200)}}

Trong HTML trên, hai anh em của `.foo p` là `span` và `.foo`. `span` màu xanh lá là phần tử con của lớp `.foo`, là anh em của `p`.

- Khi bộ chọn đích là `span`, phần tử `span` là anh em của `p` được chọn. Phần tử `p` là phần tử con của `.foo`, các anh em `span` của nó cũng vậy.
- Trong `.foo p ~ .foo span`, bộ chọn đích là `span` là phần tử con của `.foo`. Trong trường hợp này, phần tử `span` là phần tử con của `.foo` được chọn nếu `.foo` đó là anh em của `p`; về cơ bản, cả hai đều được lồng trong một tổ tiên của `.foo`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Next-sibling combinator](/en-US/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator)
