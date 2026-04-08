---
title: container-name
slug: Web/CSS/Reference/Properties/container-name
page-type: css-property
browser-compat: css.properties.container-name
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **container-name** chỉ định danh sách tên container truy vấn được sử dụng bởi quy tắc at-rule [@container](/en-US/docs/Web/CSS/Reference/At-rules/@container) trong [container query](/en-US/docs/Web/CSS/Guides/Containment/Container_queries).
Một container query sẽ áp dụng kiểu dáng cho các phần tử dựa trên [kích thước](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_size_queries) hoặc [trạng thái cuộn](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries) của tổ tiên gần nhất có ngữ cảnh containment.
Khi một ngữ cảnh containment được đặt tên, nó có thể được nhắm đến cụ thể bằng quy tắc at-rule {{Cssxref("@container")}} thay vì tổ tiên gần nhất có containment.

## Cú pháp

```css
container-name: none;

/* A single name */
container-name: my-layout;

/* Multiple names */
container-name: my-page-layout my-component-library;

/* Global Values */
container-name: inherit;
container-name: initial;
container-name: revert;
container-name: revert-layer;
container-name: unset;
```

### Giá trị

- `none`
  - : Giá trị mặc định. Container truy vấn không có tên.

- {{cssxref("custom-ident")}}
  - : Chuỗi phân biệt chữ hoa/thường dùng để xác định container.
    Các điều kiện sau áp dụng:
    - Tên không được bằng `or`, `and`, `not` hoặc `default`.
    - Giá trị tên không được đặt trong dấu nháy.
    - Dashed ident dành cho các định danh do tác giả xác định (ví dụ: `--container-name`) được cho phép.
    - Danh sách nhiều tên cách nhau bởi khoảng trắng được cho phép.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng tên container

Với ví dụ HTML sau đây là thành phần card có tiêu đề và một số văn bản:

```html
<div class="card">
  <div class="post-meta">
    <h2>Card title</h2>
    <p>My post details.</p>
  </div>
  <div class="post-excerpt">
    <p>
      A preview of my <a href="https://example.com">blog post</a> about cats.
    </p>
  </div>
</div>
```

Để tạo ngữ cảnh containment, thêm thuộc tính `container-type` vào một phần tử trong CSS.
Ví dụ sau tạo hai ngữ cảnh containment, một cho thông tin meta của card và một cho đoạn trích bài viết:

> [!NOTE]
> Cú pháp viết tắt cho các khai báo này được mô tả trong trang {{cssxref("container")}}.

```css
.post-meta {
  container-type: inline-size;
}

.post-excerpt {
  container-type: inline-size;
  container-name: excerpt;
}
```

Viết container query thông qua quy tắc at-rule {{Cssxref("@container")}} sẽ áp dụng kiểu dáng cho các phần tử của container khi truy vấn được đánh giá là đúng.
Ví dụ sau có hai container query, một chỉ áp dụng cho nội dung của phần tử `.post-excerpt` và một áp dụng cho cả nội dung `.post-meta` và `.post-excerpt`:

```css
@container excerpt (width >= 400px) {
  p {
    visibility: hidden;
  }
}

@container (width >= 400px) {
  p {
    font-size: 2rem;
  }
}
```

Để biết thêm thông tin về cách viết container query, xem trang [CSS Container Queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries).

### Sử dụng nhiều tên container

Bạn cũng có thể cung cấp nhiều tên cho một ngữ cảnh container cách nhau bởi dấu cách:

```css
.post-meta {
  container-type: inline-size;
  container-name: meta card;
}
```

Điều này cho phép bạn nhắm đến container bằng một trong hai tên trong quy tắc at-rule {{cssxref("@container")}}.
Điều này hữu ích nếu bạn muốn nhắm đến cùng một container với nhiều container query khi một trong hai điều kiện có thể đúng:

```css
@container meta (width <= 500px) {
  p {
    visibility: hidden;
  }
}

@container card (width <= 200px) {
  h2 {
    font-size: 1.5em;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- {{Cssxref("@container")}} at-rule
- CSS {{Cssxref("container")}} shorthand property
- CSS {{Cssxref("container-type")}} property
- CSS {{cssxref("content-visibility")}} property
