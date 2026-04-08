---
title: ::-webkit-progress-inner-element
slug: Web/CSS/Reference/Selectors/::-webkit-progress-inner-element
page-type: css-pseudo-element
status:
  - non-standard
browser-compat: css.selectors.-webkit-progress-inner-element
sidebar: cssref
---

{{Non-standard_header}}

Phần tử giả **`::-webkit-progress-inner-element`** trong [CSS](/en-US/docs/Web/CSS) là [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) đại diện cho vùng chứa ngoài cùng của phần tử {{HTMLElement("progress")}}. Nó là phần tử cha của phần tử giả {{cssxref("::-webkit-progress-bar")}}.

> [!NOTE]
> Để `::-webkit-progress-value` có hiệu lực, {{cssxref("appearance")}} cần được đặt thành `none` trên phần tử `<progress>`.

## Cú pháp

```css
::-webkit-progress-inner-element {
  /* ... */
}
```

## Ví dụ

Các ví dụ này chỉ hoạt động trên Blink và WebKit.

### Thêm viền đen xung quanh thanh tiến trình

Trong ví dụ này, viền đen rộng 2px được thêm xung quanh thanh tiến trình.

#### HTML

```html
<progress value="10" max="50"></progress>
```

#### CSS

```css
progress {
  -webkit-appearance: none;
}

::-webkit-progress-inner-element {
  border: 2px solid black;
}
```

#### Kết quả

{{EmbedLiveSample("Adding_a_black_border_around_the_progress_bar", 200, 50)}}

#### Ảnh chụp màn hình kết quả

Nếu bạn không sử dụng trình duyệt Blink hoặc WebKit, đoạn mã trên tạo ra một thanh tiến trình trông như thế này:

![Progressbar is a long green and grey box with a black border. The left 20% of the box is green. The right 80% is grey.](-webkit-progress-inner-element_example.png)

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả được WebKit/Blink sử dụng để tạo kiểu cho các phần khác của phần tử {{HTMLElement("progress")}}:
  - {{cssxref("::-webkit-progress-bar")}}
  - {{cssxref("::-webkit-progress-value")}}

- {{cssxref("::-moz-progress-bar")}}
