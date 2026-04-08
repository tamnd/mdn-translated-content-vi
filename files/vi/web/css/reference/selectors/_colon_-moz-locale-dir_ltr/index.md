---
title: :-moz-locale-dir(ltr)
slug: Web/CSS/Reference/Selectors/:-moz-locale-dir_ltr
page-type: css-pseudo-class
status:
  - non-standard
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-locale-dir(ltr)`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với một phần tử nếu giao diện người dùng đang được hiển thị theo hướng trái sang phải. Điều này được xác định bởi tùy chọn `intl.uidirection.locale` (trong đó `locale` là ngôn ngữ hiện tại) được đặt thành "ltr".

> [!NOTE]
> Bộ chọn này chủ yếu được dùng bởi các tiện ích mở rộng và theme để điều chỉnh giao diện người dùng dựa trên ngôn ngữ của người dùng. (Điều này có thể khác nhau giữa các cửa sổ, thậm chí giữa các tab.) Nó cũng cho phép các tiện ích mở rộng hoạt động ngay cả khi chúng không hỗ trợ ngôn ngữ mặc định của người dùng, vì chúng có thể hỗ trợ cả bố cục trái sang phải và phải sang trái bất kể ngôn ngữ cụ thể.

> [!WARNING]
> Bộ chọn này không hoạt động đúng với HTML; nó luôn khớp, bất kể ngôn ngữ giao diện người dùng là trái sang phải hay phải sang trái.

## Cú pháp

```css
:-moz-locale-dir(ltr) {
  /* ... */
}
```

## Ví dụ

Ví dụ này sẽ không hoạt động nếu bạn không sử dụng Firefox, và có thể không hoạt động ngay cả trong Firefox do vấn đề với bộ chọn không hoạt động đúng với nội dung HTML. Nó được thiết kế để dùng với `XUL`.

### HTML

```html
<p>If you're using a left-to-right interface, this should be red.</p>
```

### CSS

```css
p:-moz-locale-dir(ltr) {
  color: red;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Xem thêm

- {{CSSxRef(":dir", ":dir(…)")}}
- {{CSSxRef(":-moz-locale-dir_rtl", ":-moz-locale-dir(rtl)")}}
