---
title: size
slug: Web/CSS/Reference/At-rules/@page/size
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.page.size
sidebar: cssref
---

Mô tả **`size`** của [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules), được sử dụng với at-rule {{cssxref("@page")}}, xác định kích thước và hướng của hộp được sử dụng để đại diện cho một trang. Phần lớn thời gian, kích thước này tương ứng với kích thước mục tiêu của trang được in nếu có thể.

Kích thước có thể được xác định bằng từ khóa "có thể thay đổi tỷ lệ" (trong trường hợp này, trang sẽ lấp đầy các kích thước có sẵn) hoặc bằng kích thước tuyệt đối.

## Cú pháp

```css
/* Giá trị từ khóa cho kích thước có thể thay đổi tỷ lệ */
size: auto;
size: portrait;
size: landscape;

/* Giá trị <length> */
/* 1 giá trị: chiều cao = chiều rộng */
size: 6in;

/* 2 giá trị: chiều rộng rồi chiều cao */
size: 4in 6in;

/* Giá trị từ khóa cho kích thước tuyệt đối */
size: A4;
size: B5;
size: JIS-B4;
size: letter;

/* Kết hợp kích thước và hướng */
size: A4 portrait;
```

### Giá trị

- `auto`
  - : Tác nhân người dùng quyết định kích thước của trang. Trong hầu hết các trường hợp, kích thước và hướng của tờ đích được sử dụng.
- `landscape`
  - : Nội dung của trang được hiển thị theo chế độ ngang (tức là, cạnh dài nhất của hộp là nằm ngang).
- `portrait`
  - : Nội dung của trang được hiển thị theo chế độ dọc (tức là, cạnh dài nhất của hộp là thẳng đứng). Đây là hướng mặc định.
- `<length>`
  - : Bất kỳ giá trị độ dài nào (xem {{cssxref("&lt;length&gt;")}}). Giá trị đầu tiên tương ứng với chiều rộng của hộp trang và giá trị thứ hai tương ứng với chiều cao của nó. Nếu chỉ cung cấp một giá trị, nó được sử dụng cho cả chiều rộng và chiều cao.
- `<page-size>`
  - : Một từ khóa có thể là bất kỳ giá trị nào sau đây:
    - A5
      - : Khớp với kích thước tiêu chuẩn ISO: 148mm x 210mm.
    - A4
      - : Khớp với kích thước tiêu chuẩn ISO: 210mm x 297mm. (kích thước được sử dụng thường xuyên nhất cho in cá nhân.)
    - A3
      - : Khớp với kích thước tiêu chuẩn ISO: 297mm x 420mm.
    - B5
      - : Khớp với kích thước tiêu chuẩn ISO: 176mm x 250mm.
    - B4
      - : Khớp với kích thước tiêu chuẩn ISO: 250mm x 353mm.
    - JIS-B5
      - : Tương ứng với kích thước tiêu chuẩn JIS: 182mm x 257mm.
    - JIS-B4
      - : Tương ứng với kích thước tiêu chuẩn JIS: 257mm x 364mm.
    - letter
      - : Từ khóa này tương đương với kích thước giấy letter ở Bắc Mỹ, tức là 8.5in x 11in.
    - legal
      - : Từ khóa này tương đương với kích thước giấy legal ở Bắc Mỹ, tức là 8.5in x 14in.
    - ledger
      - : Từ khóa này tương đương với kích thước trang ledger ở Bắc Mỹ, tức là 11in x 17in.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Chỉ định kích thước và hướng

```css
@page {
  size: A4 landscape;
}
```

### Chỉ định kích thước tùy chỉnh

```css
@page {
  size: 4in 6in;
}
```

### Lồng bên trong quy tắc @media

```css
@media print {
  @page {
    size: 50mm 150mm;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
