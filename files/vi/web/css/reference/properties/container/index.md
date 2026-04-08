---
title: container
slug: Web/CSS/Reference/Properties/container
page-type: css-shorthand-property
browser-compat: css.properties.container
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **container** là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để thiết lập phần tử thành một container truy vấn và chỉ định tên cũng như kiểu của [ngữ cảnh containment](/en-US/docs/Web/CSS/Guides/Containment/Container_queries#naming_containment_contexts) được sử dụng trong [container query](/en-US/docs/Web/CSS/Guides/Containment/Container_queries).

## Các thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{Cssxref("container-name")}}
- {{Cssxref("container-type")}}

## Cú pháp

```css
/* <container-name> */
container: my-layout;

/* <container-name> / <container-type> */
container: my-layout / size;

/* Global Values */
container: inherit;
container: initial;
container: revert;
container: revert-layer;
container: unset;
```

### Giá trị

- `<container-name>`
  - : Tên phân biệt chữ hoa/thường cho ngữ cảnh containment.
    Chi tiết về cú pháp được đề cập trong trang thuộc tính {{cssxref("container-name")}}.
- `<container-type>`
  - : Kiểu của ngữ cảnh containment.
    Chi tiết về cú pháp được đề cập trong trang thuộc tính {{cssxref("container-type")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Thiết lập containment theo kích thước inline

Với ví dụ HTML sau đây là thành phần card có hình ảnh, tiêu đề và một số văn bản:

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

Cách tường minh để tạo ngữ cảnh container là khai báo `container-type` với tên `container-name` tùy chọn:

```css
.post {
  container-type: inline-size;
  container-name: sidebar;
}
```

Thuộc tính viết tắt `container` giúp đơn giản hóa việc khai báo này trong một dòng duy nhất:

```css
.post {
  container: sidebar / inline-size;
}
```

Sau đó bạn có thể nhắm đến container đó theo tên bằng quy tắc at-rule {{cssxref("@container")}}:

```css
@container sidebar (width >= 400px) {
  /* <stylesheet> */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- {{Cssxref("@container")}} at-rule
- CSS {{Cssxref("contain")}} property
- CSS {{Cssxref("container-type")}} property
- CSS {{Cssxref("container-name")}} property
- CSS {{cssxref("content-visibility")}} property
