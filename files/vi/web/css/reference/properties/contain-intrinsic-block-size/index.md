---
title: contain-intrinsic-block-size
slug: Web/CSS/Reference/Properties/contain-intrinsic-block-size
page-type: css-property
browser-compat: css.properties.contain-intrinsic-block-size
sidebar: cssref
---

[Thuộc tính logic](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) CSS **`contain-intrinsic-block-size`** xác định kích thước block của một phần tử mà trình duyệt có thể dùng cho bố cục khi phần tử đó bị ràng buộc bởi [size containment](/en-US/docs/Web/CSS/Guides/Containment/Using#size_containment).

Kích thước block là kích thước của phần tử theo chiều vuông góc với chiều chảy của văn bản trong một dòng. Trong [chế độ viết](/en-US/docs/Web/CSS/Reference/Properties/writing-mode) ngang như tiếng Anh chuẩn, kích thước block là chiều dọc (chiều cao); trong chế độ viết dọc, kích thước block là chiều ngang.

## Cú pháp

```css
/* Giá trị từ khóa */
contain-intrinsic-block-size: none;

/* Giá trị <length> */
contain-intrinsic-block-size: 1000px;
contain-intrinsic-block-size: 10rem;

/* auto <length> */
contain-intrinsic-block-size: auto 300px;

/* Giá trị toàn cục */
contain-intrinsic-block-size: inherit;
contain-intrinsic-block-size: initial;
contain-intrinsic-block-size: revert;
contain-intrinsic-block-size: revert-layer;
contain-intrinsic-block-size: unset;
```

### Giá trị

Các giá trị sau có thể được chỉ định cho kích thước block nội tại của một phần tử:

- `none`
  - : Phần tử không có kích thước block nội tại.
- `<length>`
  - : Phần tử có kích thước block được chỉ định, được biểu thị bằng kiểu dữ liệu ({{cssxref("&lt;length&gt;")}}).
- `auto <length>`
  - : Khi phần tử đang trong size containment và bỏ qua nội dung của nó (ví dụ, khi nó nằm ngoài màn hình và `content-visibility: auto` được đặt), kích thước block được ghi nhớ từ kích thước thực tế của phần tử khi nó lần cuối có thể hiển thị các phần tử con.
    Nếu phần tử chưa bao giờ hiển thị các phần tử con và do đó không có giá trị được ghi nhớ cho kích thước phần tử được hiển thị bình thường, hoặc nếu nó không bỏ qua nội dung, kích thước block là `<length>` được chỉ định.

## Mô tả

Thuộc tính này thường được áp dụng cùng với các phần tử có thể kích hoạt size containment, chẳng hạn như [`contain: size`](/en-US/docs/Web/CSS/Reference/Properties/contain) và {{cssxref("content-visibility")}}.

Size containment cho phép user agent bố cục một phần tử như thể nó có kích thước cố định.
Điều này ngăn các reflow không cần thiết bằng cách tránh re-render các phần tử con để xác định kích thước thực tế (từ đó cải thiện trải nghiệm người dùng).
Theo mặc định, size containment xử lý các phần tử như thể chúng không có nội dung và có thể thu gọn bố cục giống như khi nội dung không có chiều rộng hay chiều cao.
Thuộc tính `contain-intrinsic-block-size` cho phép tác giả chỉ định một giá trị phù hợp để dùng làm kích thước block cho bố cục.

Giá trị `auto <length>` cho phép kích thước block của một phần tử được lưu trữ nếu phần tử đó từng được "hiển thị bình thường" (với các phần tử con của nó), sau đó được dùng thay vì giá trị được chỉ định khi phần tử không có nội dung.
Điều này cho phép các phần tử ngoài màn hình với [`content-visibility: auto`](/en-US/docs/Web/CSS/Reference/Properties/content-visibility) hưởng lợi từ size containment mà không cần nhà phát triển ước tính chính xác kích thước phần tử.
Giá trị được ghi nhớ không được sử dụng nếu các phần tử con đang được hiển thị; nếu size containment được bật, giá trị `<length>` sẽ được sử dụng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước block nội tại

HTML bên dưới định nghĩa một phần tử "contained_element" sẽ bị ràng buộc kích thước và chứa một phần tử con.

```html
<div id="contained_element">
  <div class="child_element"></div>
</div>
```

CSS bên dưới đặt {{cssxref("content-visibility")}} của `contained_element` thành `auto`, vì vậy nếu phần tử bị ẩn nó sẽ bị ràng buộc kích thước.
Kích thước block và inline nội tại được dùng khi bị ràng buộc kích thước được đặt đồng thời bằng `contain-intrinsic-block-size` và `contain-intrinsic-inline-size`, tương ứng.

```css
#contained_element {
  border: 2px solid green;
  inline-size: 151px;
  content-visibility: auto;
  contain-intrinsic-inline-size: 152px;
  contain-intrinsic-block-size: 52px;
}
.child_element {
  border: 1px solid red;
  background: blue;
  block-size: 50px;
  inline-size: 150px;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [content-visibility: the new CSS property that boosts your rendering performance](https://web.dev/articles/content-visibility) (web.dev)
- {{CSSxRef("contain-intrinsic-inline-size")}}
- {{CSSxRef("contain-intrinsic-size")}}
- {{CSSxRef("contain-intrinsic-width")}}
- {{CSSxRef("contain-intrinsic-height")}}
