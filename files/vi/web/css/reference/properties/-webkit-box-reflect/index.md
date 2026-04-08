---
title: -webkit-box-reflect
slug: Web/CSS/Reference/Properties/-webkit-box-reflect
page-type: css-property
status:
  - non-standard
browser-compat: css.properties.-webkit-box-reflect
sidebar: cssref
---

{{Non-standard_Header}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`-webkit-box-reflect`** cho phép bạn phản chiếu nội dung của một phần tử theo một hướng cụ thể.

## Cú pháp

```css
/* Giá trị hướng */
-webkit-box-reflect: above;
-webkit-box-reflect: below;
-webkit-box-reflect: left;
-webkit-box-reflect: right;

/* Giá trị độ lệch */
-webkit-box-reflect: below 10px;

/* Giá trị mặt nạ */
-webkit-box-reflect: below 0 linear-gradient(transparent, white);

/* Giá trị toàn cục */
-webkit-box-reflect: inherit;
-webkit-box-reflect: initial;
-webkit-box-reflect: revert;
-webkit-box-reflect: revert-layer;
-webkit-box-reflect: unset;
```

### Giá trị

- `above`_,_ `below`_,_ `right`_,_ `left`
  - : Là các từ khóa chỉ định hướng phản chiếu xảy ra.
- {{CSSxRef("&lt;length&gt;")}}
  - : Chỉ định kích thước của phần phản chiếu.
- {{cssxref("image")}}
  - : Mô tả mặt nạ được áp dụng cho phần phản chiếu.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`-webkit-box-reflect = [ above | below | right | left ]? <length>? <image>?`)}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào. Cách tiêu chuẩn để tạo phản chiếu trong CSS là sử dụng hàm CSS {{cssxref("element()")}}.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariCSSRef/Articles/StandardCSSProperties.html) của Apple.
- [Đặc tả](https://webkit.org/blog/182/css-reflections/) của WebKit.
