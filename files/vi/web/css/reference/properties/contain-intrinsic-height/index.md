---
title: contain-intrinsic-height
slug: Web/CSS/Reference/Properties/contain-intrinsic-height
page-type: css-property
browser-compat: css.properties.contain-intrinsic-height
sidebar: cssref
---

Thuộc tính CSS **`contain-intrinsic-height`** đặt chiều cao của một phần tử mà trình duyệt có thể dùng cho bố cục khi phần tử đó bị ràng buộc bởi [size containment](/en-US/docs/Web/CSS/Guides/Containment/Using#size_containment).

## Cú pháp

```css
/* Giá trị từ khóa */
contain-intrinsic-height: none;

/* Giá trị <length> */
contain-intrinsic-height: 1000px;
contain-intrinsic-height: 10rem;

/* auto <length> */
contain-intrinsic-height: auto 300px;

/* Giá trị toàn cục */
contain-intrinsic-height: inherit;
contain-intrinsic-height: initial;
contain-intrinsic-height: revert;
contain-intrinsic-height: revert-layer;
contain-intrinsic-height: unset;
```

### Giá trị

Các giá trị sau có thể được chỉ định cho một phần tử.

- `none`
  - : Phần tử không có chiều cao nội tại.
- `<length>`
  - : Phần tử có chiều cao được chỉ định ({{cssxref("&lt;length&gt;")}}).
- `auto <length>`
  - : Giá trị được ghi nhớ của chiều cao phần tử được "hiển thị bình thường" nếu tồn tại và phần tử đang bỏ qua nội dung của nó (ví dụ, khi nó nằm ngoài màn hình); ngược lại là `<length>` được chỉ định.

## Mô tả

Thuộc tính này thường được áp dụng cùng với các phần tử có thể kích hoạt size containment, chẳng hạn như [`contain: size`](/en-US/docs/Web/CSS/Reference/Properties/contain) và {{cssxref("content-visibility")}}, và cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("contain-intrinsic-size")}} [shorthand property](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties).

Size containment cho phép user agent bố cục một phần tử như thể nó có kích thước cố định, ngăn các reflow không cần thiết bằng cách tránh re-render các phần tử con để xác định kích thước thực tế (từ đó cải thiện trải nghiệm người dùng).
Theo mặc định, size containment xử lý các phần tử như thể chúng không có nội dung, và có thể thu gọn bố cục giống như khi nội dung không có chiều cao (hay chiều rộng).
Thuộc tính `contain-intrinsic-height` cho phép tác giả chỉ định một giá trị phù hợp để dùng làm chiều cao cho bố cục.

Giá trị `auto <length>` cho phép chiều cao của phần tử được lưu trữ nếu phần tử đó từng được "hiển thị bình thường" (với các phần tử con của nó), sau đó được dùng thay vì chiều cao được chỉ định khi phần tử đang bỏ qua nội dung.
Điều này cho phép các phần tử ngoài màn hình với [`content-visibility: auto`](/en-US/docs/Web/CSS/Reference/Properties/content-visibility) hưởng lợi từ size containment mà không cần nhà phát triển ước tính chính xác kích thước phần tử.
Giá trị được ghi nhớ không được sử dụng nếu các phần tử con đang được hiển thị (nếu size containment được bật, `<length>` sẽ được sử dụng).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Ngoài ví dụ bên dưới, trang {{CSSxRef("contain-intrinsic-size")}} chứa ví dụ trực tiếp minh họa hiệu ứng của việc thay đổi chiều rộng và chiều cao nội tại.

### Đặt chiều cao nội tại

HTML bên dưới định nghĩa một phần tử "contained_element" sẽ bị ràng buộc kích thước và chứa một phần tử con.

```html
<div id="contained_element">
  <div class="child_element"></div>
</div>
```

CSS bên dưới đặt {{cssxref("content-visibility")}} của `contained_element` thành `auto`, vì vậy nếu phần tử bị ẩn nó sẽ bị ràng buộc kích thước.
Chiều rộng và chiều cao được dùng khi bị ràng buộc kích thước được đặt đồng thời bằng `contain-intrinsic-width` và `contain-intrinsic-height`, tương ứng.

```css
#contained_element {
  border: 2px solid green;
  width: 151px;
  content-visibility: auto;
  contain-intrinsic-width: 152px;
  contain-intrinsic-height: 52px;
}
.child_element {
  border: 1px solid red;
  background: blue;
  height: 50px;
  width: 150px;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [content-visibility: the new CSS property that boosts your rendering performance](https://web.dev/articles/content-visibility) (web.dev)
- {{CSSxRef("contain-intrinsic-size")}}
- {{CSSxRef("contain-intrinsic-width")}}
- {{CSSxRef("contain-intrinsic-block-size")}}
- {{CSSxRef("contain-intrinsic-inline-size")}}
