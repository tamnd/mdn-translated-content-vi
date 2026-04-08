---
title: "@view-transition"
slug: Web/CSS/Reference/At-rules/@view-transition
page-type: css-at-rule
browser-compat: css.at-rules.view-transition
sidebar: cssref
---

**`@view-transition`** là một [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) của [CSS](/en-US/docs/Web/CSS) được dùng để đăng ký cho các tài liệu hiện tại và đích thực hiện [chuyển tiếp chế độ xem (view transition)](/en-US/docs/Web/API/View_Transition_API), trong trường hợp điều hướng liên tài liệu.

Để chuyển tiếp chế độ xem liên tài liệu hoạt động, các tài liệu hiện tại và đích của điều hướng cần phải có cùng nguồn gốc.

## Cú pháp

```css
@view-transition {
  navigation: auto | none;
  types: none | <custom-ident>#;
}
```

### Các bộ mô tả

- `navigation`
  - : Một từ khóa chỉ định hiệu ứng mà quy tắc at này sẽ có trên hành vi chuyển tiếp chế độ xem của tài liệu. Các giá trị có thể là:
    - `auto`
      - : Tài liệu sẽ thực hiện chuyển tiếp chế độ xem khi tham gia điều hướng, miễn là điều hướng là [cùng nguồn gốc (same-origin)](/en-US/docs/Web/Security/Defenses/Same-origin_policy), không có chuyển hướng liên nguồn gốc, và {{domxref("NavigateEvent.navigationType", "navigationType")}} của nó là `traverse`, `push`, hoặc `replace`. Trong trường hợp `push` hoặc `replace`, điều hướng phải được khởi tạo bởi người dùng tương tác với nội dung trang, không phải bởi tính năng giao diện người dùng của trình duyệt.
    - `none`
      - : Tài liệu sẽ không thực hiện chuyển tiếp chế độ xem.

- `types`
  - : Chỉ định các [loại](/en-US/docs/Web/API/View_Transition_API/Using_types) chuyển tiếp chế độ xem để đặt trên chuyển tiếp chế độ xem hoạt động cho các tài liệu hiện tại và đích. Các giá trị có thể là:
    - `<custom-ident>+`
      - : Một hoặc nhiều giá trị {{cssxref("&lt;custom-ident>")}} được phân tách bởi khoảng trắng đại diện cho các loại cần đặt.
    - `none`
      - : Không có loại nào được đặt.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Chuyển tiếp chế độ xem trang

Các đoạn mã sau đây cho thấy các khái niệm chính được dùng trong demo chuyển tiếp trang.
Demo dùng chuyển tiếp chế độ xem liên tài liệu; một chuyển tiếp nửa giây xảy ra khi điều hướng giữa hai trang của một trang web.
Để xem demo đầy đủ, hãy xem [View transitions multi-page app demo](https://mdn.github.io/dom-examples/view-transitions/mpa/).

Quy tắc at `@view-transition` được chỉ định trong CSS cho cả tài liệu hiện tại và đích của điều hướng để đăng ký cả hai vào chuyển tiếp chế độ xem:

```css
@view-transition {
  navigation: auto;
}
```

Ngoài quy tắc at `@view-transition`, chúng ta dùng quy tắc at {{cssxref("@keyframes")}} để định nghĩa hai hoạt ảnh khung chính và dùng thuộc tính tốc ký {{cssxref("animation")}} để áp dụng các hoạt ảnh khung chính đó cho các phần tử trong trang ra đi ({{cssxref("::view-transition-old()")}}) và trang đến ({{cssxref("::view-transition-new()")}}) mà chúng ta muốn tạo hoạt ảnh.

```css
/* Create a custom animation */
@keyframes move-out {
  from {
    transform: translateY(0%);
  }

  to {
    transform: translateY(-100%);
  }
}

@keyframes move-in {
  from {
    transform: translateY(100%);
  }

  to {
    transform: translateY(0%);
  }
}

/* Apply the custom animation to the old and new page states */
::view-transition-old(root) {
  animation: 0.4s ease-in both move-out;
}

::view-transition-new(root) {
  animation: 0.4s ease-in both move-in;
}
```

Xem demo trực tiếp [transitions multi-page app](https://mdn.github.io/dom-examples/view-transitions/mpa/).

### Sử dụng các loại chuyển tiếp chế độ xem

[Ví dụ về loại chuyển tiếp MPA](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-transition-types/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/mpa-chapter-nav-transition-types)) minh họa cách dùng `types` qua `@view-transition`:

```css
@view-transition {
  navigation: auto;
  types: slide;
}
```

Xem [Sử dụng các loại với chuyển tiếp chế độ xem liên tài liệu qua `@view-transition`](/en-US/docs/Web/API/View_Transition_API/Using_types#using_types_with_cross-document_view_transitions_via_view-transition) để biết hướng dẫn về ví dụ được tham chiếu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::view-transition", "::view-transition")}}
- {{cssxref("::view-transition-new()")}}
- {{cssxref("::view-transition-old()")}}
- {{cssxref("::view-transition-group()")}}
- {{cssxref("::view-transition-image-pair()")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Sử dụng các loại chuyển tiếp chế độ xem](/en-US/docs/Web/API/View_Transition_API/Using_types)
- [Các quy tắc at CSS](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- [Các hàm quy tắc at CSS](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
