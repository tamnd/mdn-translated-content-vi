---
title: CSS container queries
short-title: Container queries
slug: Web/CSS/Guides/Containment/Container_queries
page-type: guide
sidebar: cssref
---

Container queries cho phép bạn áp dụng các kiểu dáng cho một phần tử dựa trên một số thuộc tính của container chứa nó:

- Kích thước của container.
- Các kiểu dáng được áp dụng cho container.
- Trạng thái cuộn của container hoặc ancestor cuộn của nó.
- Liệu container có được [anchor-positioned](/en-US/docs/Web/CSS/Guides/Anchor_positioning) hay không và có [position-try fallback option](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding) nào được áp dụng cho nó không.

Container queries là một sự thay thế cho [media queries](/en-US/docs/Web/CSS/Guides/Media_queries), vốn áp dụng các kiểu dáng cho các phần tử dựa trên kích thước viewport hoặc các đặc điểm thiết bị khác.

Bài viết này cung cấp phần giới thiệu về cách sử dụng container queries, đặc biệt tập trung vào size container queries. Các hướng dẫn khác thảo luận chi tiết về [style](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries), [scroll-state](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries), và [anchored](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries) container queries.

![Hai loại query khác nhau. Đầu tiên là media query dựa trên chiều rộng viewport, chiếm toàn bộ chiều rộng trình duyệt. Thứ hai là container query dựa trên chiều rộng của một phần tử container.](container-query.svg)

## Sử dụng container size queries

Trong khi container queries áp dụng kiểu dáng dựa trên loại container, container size queries áp dụng kiểu dáng cụ thể dựa trên kích thước của container. Để sử dụng container size queries, bạn cần khai báo một **containment context** trên một phần tử để trình duyệt biết rằng bạn có thể muốn truy vấn kích thước của container này sau.
Để làm điều này, hãy sử dụng thuộc tính {{cssxref("container-type")}} với giá trị `size`, `inline-size`, hoặc `normal`.

Các giá trị này có các hiệu ứng sau:

- `size`
  - : Query sẽ dựa trên các kích thước [inline và block](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts#block_and_inline_dimensions) của container.
    Áp dụng [containment](/en-US/docs/Web/CSS/Guides/Containment/Using) layout, style, và size cho container.
- `inline-size`
  - : Query sẽ dựa trên kích thước [inline](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts#block_and_inline_dimensions) của container.
    Áp dụng containment layout, style, và inline-size cho phần tử.
- `normal`
  - : Phần tử không phải là query container cho bất kỳ container size query nào, nhưng vẫn là query container cho container style queries.

Hãy xem xét ví dụ sau về một card component cho bài đăng blog với tiêu đề và một số văn bản:

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

Bạn có thể tạo một containment context bằng cách sử dụng thuộc tính `container-type`:

```css
.post {
  container-type: inline-size;
}
```

Tiếp theo, sử dụng at-rule {{cssxref("@container")}} để định nghĩa một container query.
Query trong ví dụ sau sẽ áp dụng các kiểu dáng cho các phần tử dựa trên kích thước của ancestor gần nhất có containment context.
Cụ thể, query này sẽ áp dụng cỡ chữ lớn hơn cho tiêu đề card nếu container rộng hơn `700px`:

```css
/* Kiểu tiêu đề mặc định cho tiêu đề card */
.card h2 {
  font-size: 1em;
}

/* Nếu container lớn hơn 700px */
@container (width > 700px) {
  .card h2 {
    font-size: 2em;
  }
}
```

Khi sử dụng container queries, card có thể được tái sử dụng ở nhiều khu vực trên trang mà không cần biết cụ thể nơi nó sẽ được đặt mỗi lần.
Nếu container chứa card hẹp hơn `700px`, phông chữ tiêu đề card sẽ nhỏ, và nếu card nằm trong container rộng hơn `700px`, phông chữ tiêu đề card sẽ lớn hơn.

Để biết thêm thông tin về cú pháp của container queries, hãy xem trang {{cssxref("@container")}}.

### Đặt tên containment contexts

Trong phần trước, một container query đã áp dụng kiểu dáng dựa trên ancestor gần nhất có containment context.
Có thể đặt tên cho containment context bằng thuộc tính {{Cssxref("container-name")}}. Sau khi đặt tên, tên đó có thể được dùng trong `@container` query để nhắm đến một container cụ thể.
Ví dụ sau tạo một containment context với tên `sidebar`:

```css
.post {
  container-type: inline-size;
  container-name: sidebar;
}
```

Sau đó bạn có thể nhắm đến containment context này bằng at-rule `@container`:

```css
@container sidebar (width > 700px) {
  .card {
    font-size: 2em;
  }
}
```

Thêm thông tin về đặt tên containment contexts có trên trang {{cssxref("container-name")}}.

### Cú pháp viết tắt container

Cách khai báo viết tắt một containment context là sử dụng thuộc tính `container`:

```css
.post {
  container: sidebar / inline-size;
}
```

Để biết thêm thông tin về thuộc tính này, hãy xem tài liệu tham khảo {{Cssxref("container")}}.

### Các đơn vị độ dài container query

Khi áp dụng kiểu dáng cho một container bằng container queries, bạn có thể sử dụng các đơn vị độ dài container query.
Các đơn vị này xác định độ dài tương đối so với kích thước của query container.
Các component sử dụng đơn vị độ dài tương đối so với container của chúng sẽ linh hoạt hơn khi dùng trong các container khác nhau mà không cần phải tính lại các giá trị độ dài cụ thể.

Nếu không có container đủ điều kiện nào cho query, đơn vị độ dài container query mặc định sẽ là [small viewport unit](/en-US/docs/Web/CSS/Reference/Values/length#small_viewport_units) cho trục đó (`sv*`).

Các đơn vị độ dài container query là:

- `cqw`: 1% chiều rộng của query container
- `cqh`: 1% chiều cao của query container
- `cqi`: 1% kích thước inline của query container
- `cqb`: 1% kích thước block của query container
- `cqmin`: Giá trị nhỏ hơn giữa `cqi` hoặc `cqb`
- `cqmax`: Giá trị lớn hơn giữa `cqi` hoặc `cqb`

Ví dụ sau sử dụng đơn vị `cqi` để đặt cỡ chữ của tiêu đề dựa trên kích thước inline của container:

```css
@container (width > 700px) {
  .card h2 {
    font-size: max(1.5em, 1.23em + 2cqi);
  }
}
```

Để biết thêm thông tin về các đơn vị này, hãy xem tài liệu tham khảo [Container query length units](/en-US/docs/Web/CSS/Reference/Values/length#container_query_length_units).

## Fallback cho container queries

Đối với các trình duyệt chưa hỗ trợ container queries, {{cssxref("grid")}} và {{cssxref("flex")}} có thể được sử dụng để tạo hiệu ứng tương tự cho card component được dùng trên trang này.
Ví dụ sau sử dụng khai báo {{cssxref("grid-template-columns")}} để tạo bố cục hai cột cho card component.

```css
.card {
  display: grid;
  grid-template-columns: 2fr 1fr;
}
```

Nếu bạn muốn sử dụng bố cục một cột cho các thiết bị có viewport nhỏ hơn, bạn có thể dùng media query để thay đổi grid template:

```css
@media (width <= 700px) {
  .card {
    grid-template-columns: 1fr;
  }
}
```

## Xem thêm

- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- CSS at-rule {{Cssxref("@container")}}
- Thuộc tính CSS {{Cssxref("contain")}}
- Thuộc tính viết tắt CSS {{Cssxref("container")}}
- Thuộc tính CSS {{Cssxref("container-name")}}
- Thuộc tính CSS {{cssxref("content-visibility")}}
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- [Using anchored container queries](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries)
- [Say Hello to CSS Container Queries](https://ishadeed.com/article/say-hello-to-css-container-queries/) by Ahmad Shadeed
- [Container Queries: a Quick Start Guide](https://www.oddbird.net/2021/04/05/containerqueries/)
- [Collection of Container Queries articles](https://github.com/sturobson/Awesome-Container-Queries)
