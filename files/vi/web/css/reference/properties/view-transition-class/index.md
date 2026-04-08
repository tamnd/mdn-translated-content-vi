---
title: view-transition-class
slug: Web/CSS/Reference/Properties/view-transition-class
page-type: css-property
browser-compat: css.properties.view-transition-class
sidebar: cssref
---

Thuộc tính **`view-transition-class`** của [CSS](/vi/docs/Web/CSS) cung cấp cho các phần tử được chọn một class định danh ({{cssxref("custom-ident")}}), cung cấp thêm một phương thức tạo kiểu cho các chuyển đổi xem của những phần tử đó.

## Cú pháp

```css
/* Các ví dụ giá trị <custom-ident> */
view-transition-class: card;

/* Giá trị từ khóa */
view-transition-class: none;

/* Giá trị toàn cục */
view-transition-class: inherit;
view-transition-class: initial;
view-transition-class: revert;
view-transition-class: revert-layer;
view-transition-class: unset;
```

### Giá trị

- {{cssxref("custom-ident")}}
  - : Tên định danh khiến phần tử được chọn tham gia vào một [chuyển đổi xem](/vi/docs/Web/API/View_Transition_API) riêng biệt từ chuyển đổi xem gốc. Định danh phải là duy nhất. Nếu hai phần tử được hiển thị có cùng `view-transition-name` cùng lúc, {{domxref("ViewTransition.ready")}} sẽ bị từ chối và chuyển đổi sẽ bị bỏ qua.
- `none`
  - : Không có class nào được áp dụng cho các phần tử giả chuyển đổi xem được đặt tên được tạo cho phần tử này.

## Mô tả

Giá trị `view-transition-class` cung cấp một móc nối tạo kiểu, tương tự như tên class CSS, có thể được dùng để áp dụng cùng kiểu cho nhiều phần tử giả chuyển đổi xem. Nó không đánh dấu phần tử để chụp. Mỗi phần tử riêng lẻ vẫn cần {{cssxref("view-transition-name")}} duy nhất của riêng nó; `view-transition-class` chỉ được dùng như một cách bổ sung để tạo kiểu cho các phần tử đã có `view-transition-name`.
Hỗ trợ xác định `view-transition-name` tự động đang được thảo luận trong thông số [CSS View Transitions Module Level 2](https://drafts.csswg.org/css-view-transitions-2/#auto-vt-name).

`view-transition-class` áp dụng kiểu bằng cách sử dụng các phần tử giả chuyển đổi xem, bao gồm {{cssxref("::view-transition-group()")}}, {{cssxref("::view-transition-image-pair()")}}, {{cssxref("::view-transition-old()")}} và {{cssxref("::view-transition-new()")}}. Điều này khác với `view-transition-name`, khớp chuyển đổi xem giữa phần tử ở trạng thái cũ với phần tử tương ứng ở trạng thái mới.

Cho đến khi thuộc tính `view-transition-class` được hỗ trợ đầy đủ trong tất cả các trình duyệt hỗ trợ chuyển đổi xem, hãy thêm `::view-transition-group()` tùy chỉnh cho từng phần tử.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

```css
::view-transition-group(.fast-card-slide) {
  animation-duration: 3s;
}

.product {
  view-transition-class: fast-card-slide;
}

.product#card1 {
  view-transition-name: show-card;
}

.product#card2 {
  view-transition-name: hide-card;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("view-transition-name")}}
- Hướng dẫn [Sử dụng View Transition API](/vi/docs/Web/API/View_Transition_API/Using)
- [View Transition API](/vi/docs/Web/API/View_Transition_API)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
