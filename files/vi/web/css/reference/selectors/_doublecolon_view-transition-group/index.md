---
title: ::view-transition-group()
slug: Web/CSS/Reference/Selectors/::view-transition-group
page-type: css-pseudo-element
browser-compat: css.selectors.view-transition-group
sidebar: cssref
---

**`::view-transition-group()`** là một [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) đại diện cho một nhóm ảnh chụp (snapshot group) duy nhất trong quá trình chuyển tiếp khung nhìn (view transition).

Trong quá trình chuyển tiếp khung nhìn, `::view-transition-group()` được đưa vào cây phần tử giả liên kết như mô tả trong [Cây phần tử giả chuyển tiếp khung nhìn](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_pseudo-element_tree). Nó luôn là phần tử con của {{cssxref("::view-transition")}}, và có một {{cssxref("::view-transition-image-pair()")}} là phần tử con.

`::view-transition-group()` được cấp các kiểu mặc định sau trong bảng kiểu của tác nhân người dùng (UA stylesheet):

```css
:root::view-transition-group(*) {
  position: absolute;
  top: 0;
  left: 0;

  animation-duration: 0.25s;
  animation-fill-mode: both;
}
```

Theo mặc định, các phần tử được chọn ban đầu phản ánh kích thước và vị trí của phần tử giả {{cssxref("::view-transition-old()")}} đại diện cho trạng thái khung nhìn "cũ", hoặc phần tử giả {{cssxref("::view-transition-new()")}} đại diện cho trạng thái khung nhìn "mới" nếu không có trạng thái "cũ".

Nếu có cả trạng thái "cũ" và "mới", các kiểu trong bảng kiểu chuyển tiếp sẽ tạo hoạt ảnh cho {{cssxref("width")}} và {{cssxref("height")}} của phần tử giả này từ kích thước hộp đường viền của trạng thái "cũ" đến kích thước của trạng thái "mới".

> [!NOTE]
> Các kiểu chuyển tiếp khung nhìn được tạo động trong quá trình chuyển tiếp; xem phần [setup transition pseudo-elements](https://drafts.csswg.org/css-view-transitions-1/#setup-transition-pseudo-elements) và [update pseudo-element styles](https://drafts.csswg.org/css-view-transitions-1/#update-pseudo-element-styles) trong đặc tả để biết thêm chi tiết.

Ngoài ra, transform của phần tử được tạo hoạt ảnh từ phép biến đổi không gian màn hình của trạng thái "cũ" đến phép biến đổi không gian màn hình của trạng thái "mới". Kiểu này được tạo động vì các giá trị thuộc tính hoạt ảnh được xác định tại thời điểm bắt đầu chuyển tiếp.

## Cú pháp

```css-nolint
::view-transition-group([ <pt-name-selector> <pt-class-selector>? ] | <pt-class-selector>) {
  /* ... */
}
```

### Tham số

- `*`
  - : [Bộ chọn toàn thể (`*`)](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors); chọn tất cả các nhóm chuyển tiếp khung nhìn trên trang.
- `root`
  - : Thuộc tính {{cssxref("view-transition-name")}} được áp dụng cho {{cssxref(":root")}} khiến phần tử giả khớp với nhóm chuyển tiếp khung nhìn `root` mặc định. Đây là nhóm ảnh chụp được tác nhân người dùng tạo ra để chứa quá trình chuyển tiếp khung nhìn cho toàn bộ trang. Nhóm này bao gồm bất kỳ phần tử nào không được gán nhóm ảnh chụp chuyển tiếp khung nhìn riêng thông qua thuộc tính `view-transition-name`.
- `<pt-name-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-name")}}.
- `<pt-class-selector>`
  - : {{cssxref("custom-ident")}} được đặt làm giá trị của thuộc tính {{cssxref("view-transition-class")}}, đứng trước bởi một dấu chấm (`.`).

{{cssxref("specificity")}} của phần tử giả chuyển tiếp khung nhìn được đặt tên bằng với [độ ưu tiên của bộ chọn kiểu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#type_column), trừ khi tham số được sử dụng là bộ chọn toàn thể, trong trường hợp đó độ ưu tiên bằng không.

## Ví dụ

```css
::view-transition-group(embed-container) {
  animation-duration: 0.3s;
  animation-timing-function: ease;
  z-index: 1;
}

::view-transition-group(.card) {
  animation-duration: 1s;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
