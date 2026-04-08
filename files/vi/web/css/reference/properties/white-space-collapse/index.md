---
title: white-space-collapse
slug: Web/CSS/Reference/Properties/white-space-collapse
page-type: css-property
browser-compat: css.properties.white-space-collapse
sidebar: cssref
---

Thuộc tính **`white-space-collapse`** của [CSS](/vi/docs/Web/CSS) kiểm soát cách {{Glossary("whitespace", "khoảng trắng")}} bên trong một phần tử được thu gọn.

> [!NOTE]
> Các thuộc tính `white-space-collapse` và {{CSSxRef("text-wrap-mode")}} có thể được khai báo cùng nhau bằng thuộc tính viết tắt {{CSSxRef("white-space")}}.

## Cú pháp

```css
/* Giá trị từ khóa */
white-space-collapse: collapse;
white-space-collapse: preserve;
white-space-collapse: preserve-breaks;
white-space-collapse: preserve-spaces;
white-space-collapse: break-spaces;

/* Giá trị toàn cục */
white-space-collapse: inherit;
white-space-collapse: initial;
white-space-collapse: revert;
white-space-collapse: revert-layer;
white-space-collapse: unset;
```

Thuộc tính `white-space-collapse` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị dưới đây.

### Giá trị

- `collapse`
  - : Các chuỗi khoảng trắng được [thu gọn](/vi/docs/Web/CSS/Guides/Text/Whitespace#collapsing_and_transformation).
- `preserve`
  - : Các chuỗi khoảng trắng và ký tự ngắt đoạn được bảo toàn.
- `preserve-breaks`
  - : Các chuỗi khoảng trắng được thu gọn, trong khi ký tự ngắt đoạn được bảo toàn.
- `preserve-spaces`
  - : Các chuỗi khoảng trắng được bảo toàn, trong khi tab và ký tự ngắt đoạn được chuyển thành dấu cách.
- `break-spaces`
  - : Hành vi giống hệt `preserve`, ngoại trừ:
    - Bất kỳ chuỗi khoảng trắng được bảo toàn nào luôn chiếm không gian, kể cả ở cuối dòng.
    - Cơ hội ngắt dòng tồn tại sau mỗi ký tự khoảng trắng được bảo toàn, kể cả giữa các ký tự khoảng trắng.
    - Khoảng trắng được bảo toàn chiếm không gian và không treo, do đó ảnh hưởng đến kích thước nội tại của hộp (kích thước {{cssxref("min-content")}} và {{cssxref("max-content")}}).

> [!NOTE]
> _Ký tự ngắt đoạn_ là các ký tự như ký tự xuống dòng khiến văn bản ngắt sang dòng mới.

> [!NOTE]
> Mô-đun [văn bản CSS](/vi/docs/Web/CSS/Guides/Text) định nghĩa giá trị `discard` cho thuộc tính `white-space-collapse` để loại bỏ tất cả khoảng trắng trong phần tử, tuy nhiên giá trị này chưa được hỗ trợ trong bất kỳ trình duyệt nào.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### HTML

<!-- prettier-ignore-start -->
```html
<h2 class="collapse">Default behavior;
  all   whitespace   is   collapsed
  in    the          heading       .</h2>

<h2 class="preserve">In this case
  all   whitespace   is   preserved
  in    the          heading       .</h2>

<h2 class="preserve-breaks">In this case only
  the   line breaks  are  preserved
  in    the          heading       .</h2>

<h2 class="preserve-spaces">In this case only
  the   spaces       are  preserved
  in    the          heading       .</h2>
```
<!-- prettier-ignore-end -->

### CSS

```css
.collapse {
  white-space-collapse: collapse;
}

.preserve {
  white-space-collapse: preserve;
}

.preserve-breaks {
  white-space-collapse: preserve-breaks;
}

.preserve-spaces {
  white-space-collapse: preserve-spaces;
}

h2 {
  font-size: 1.6rem;
  font-family: monospace;
  border-bottom: 1px dotted #cccccc;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 350)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Viết tắt cho `white-space-collapse` và {{CSSxRef("text-wrap-mode")}}: Thuộc tính {{CSSxRef("white-space")}}.
- [Mô-đun văn bản CSS](/vi/docs/Web/CSS/Guides/Text)
- [Xử lý khoảng trắng trong CSS](/vi/docs/Web/CSS/Guides/Text/Whitespace)
