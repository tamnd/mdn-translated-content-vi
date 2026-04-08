---
title: box-direction
slug: Web/CSS/Reference/Properties/box-direction
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-direction
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính của bản thảo Module bố cục hộp linh hoạt CSS ban đầu, và đã được thay thế bởi một tiêu chuẩn mới hơn. `-moz-box-direction` chỉ được sử dụng cho XUL trong khi tiêu chuẩn trước đó `box-direction` đã được thay thế bởi `flex-direction`. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện tại.

Thuộc tính **`box-direction`** [CSS](/en-US/docs/Web/CSS) chỉ định liệu một hộp bố cục nội dung của nó theo hướng bình thường (từ cạnh trên hoặc trái), hay theo hướng ngược lại (từ cạnh dưới hoặc phải).

## Cú pháp

```css
/* Giá trị từ khóa */
box-direction: normal;
box-direction: reverse;

/* Giá trị toàn cục */
box-direction: inherit;
box-direction: initial;
box-direction: revert;
box-direction: revert-layer;
box-direction: unset;
```

Thuộc tính `box-direction` được chỉ định bằng một trong các giá trị từ khóa liệt kê dưới đây.

### Giá trị

- `normal`
  - : Hộp bố cục nội dung từ phần đầu (cạnh trái hoặc trên).
- `reverse`
  - : Hộp bố cục nội dung từ phần cuối (cạnh phải hoặc dưới).

## Ghi chú

Cạnh của hộp được chỉ định là _start_ cho mục đích bố cục phụ thuộc vào hướng của hộp:

- Đối với phần tử ngang, _start_ là cạnh trên.
- Đối với phần tử dọc, _start_ là cạnh trái.

Cạnh đối diện với start được gọi là _end_.

Nếu hướng được đặt bằng thuộc tính `dir` của phần tử, thì style sẽ bị bỏ qua.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-direction = normal | reverse`)}}

## Ví dụ

### Đặt hướng hộp

```css
.example {
  /* bottom-to-top layout */
  -moz-box-direction: reverse; /* Mozilla */
  -webkit-box-direction: reverse; /* WebKit */
  box-direction: reverse; /* As specified */
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("box-orient")}}
- {{CSSxRef("box-pack")}}
- {{CSSxRef("box-align")}}
- {{CSSxRef("flex-direction")}}
