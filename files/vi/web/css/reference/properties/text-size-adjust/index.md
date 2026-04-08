---
title: text-size-adjust
slug: Web/CSS/Reference/Properties/text-size-adjust
page-type: css-property
status:
  - experimental
browser-compat: css.properties.text-size-adjust
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/API/CSS) **`text-size-adjust`** kiểm soát thuật toán phóng to văn bản được sử dụng trên một số điện thoại thông minh và máy tính bảng. Các trình duyệt khác sẽ bỏ qua thuộc tính này.

Vì nhiều trang web không được phát triển với các thiết bị nhỏ trong tâm trí, các trình duyệt di động khác với các trình duyệt máy tính để bàn trong cách hiển thị trang web. Thay vì trình bày các trang theo chiều rộng màn hình thiết bị, chúng trình bày chúng sử dụng {{glossary("viewport")}} rộng hơn nhiều, thường là 800 hoặc 1000 pixel. Để ánh xạ bố cục rộng hơn này trở lại kích thước thiết bị gốc, chúng hiển thị chỉ một phần của toàn bộ kết xuất hoặc thu nhỏ viewport để vừa vặn.

Do văn bản được thu nhỏ để vừa với màn hình di động có thể rất nhỏ, nhiều trình duyệt di động áp dụng thuật toán phóng to văn bản để phóng to văn bản làm cho nó dễ đọc hơn. Khi một phần tử chứa văn bản sử dụng 100% chiều rộng màn hình, thuật toán tăng kích thước văn bản của nó, nhưng không thay đổi bố cục. Thuộc tính `text-size-adjust` cho phép các tác giả web vô hiệu hóa hoặc thay đổi hành vi này, vì các trang web được thiết kế với màn hình nhỏ trong tâm trí không cần điều đó.

## Cú pháp

```css
/* Keyword values */
text-size-adjust: none;
text-size-adjust: auto;

/* <percentage> value */
text-size-adjust: 80%;

/* Global values */
text-size-adjust: inherit;
text-size-adjust: initial;
text-size-adjust: revert;
text-size-adjust: revert-layer;
text-size-adjust: unset;
```

Thuộc tính `text-size-adjust` được chỉ định là `none`, `auto` hoặc `<percentage>`.

### Giá trị

- `none`
  - : Vô hiệu hóa thuật toán phóng to của trình duyệt.
- `auto`
  - : Bật thuật toán phóng to của trình duyệt. Giá trị này được dùng để hủy giá trị `none` đã được đặt trước bằng CSS.
- `<percentage>`
  - : Bật thuật toán phóng to của trình duyệt, chỉ định giá trị phần trăm để tăng kích thước phông chữ.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản để vô hiệu hóa

Như gợi ý ở trên, trên một trang responsive được thiết kế đúng cách, hành vi `text-size-adjust` không cần thiết, vì vậy các nhà phát triển có thể chọn tắt nó bằng cách chỉ định giá trị none:

```css
p {
  -webkit-text-size-adjust: none;
  text-size-adjust: none;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Apple](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/AdjustingtheTextSize/AdjustingtheTextSize.html#//apple_ref/doc/uid/TP40006510-SW16) (2016)
- [Mô tả hành vi của Google Chrome](https://docs.google.com/document/d/1PPcEwAhXJJ1TQShor29KWB17KJJq7UJOM34oHwYP3Zg/edit) (2014)
- [Mô tả hành vi của Gecko](https://dbaron.org/log/20111126-font-inflation), bởi L. David Baron (2011)
