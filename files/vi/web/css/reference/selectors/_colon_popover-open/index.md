---
title: :popover-open
slug: Web/CSS/Reference/Selectors/:popover-open
page-type: css-pseudo-class
browser-compat: css.selectors.popover-open
sidebar: cssref
---

Lớp giả **`:popover-open`** trong [CSS](/en-US/docs/Web/CSS) ([pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)) đại diện cho một phần tử {{domxref("Popover API", "popover", "", "nocode")}} (tức là phần tử có thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)) đang ở trạng thái hiển thị. Bạn có thể sử dụng lớp giả này để áp dụng kiểu cho các phần tử popover chỉ khi chúng đang được hiển thị.

## Cú pháp

```css
:popover-open {
  /* ... */
}
```

## Ví dụ

Theo mặc định, các popover xuất hiện ở giữa viewport. Kiểu mặc định được thực hiện như thế này trong stylesheet của tác nhân người dùng:

```css
[popover] {
  position: fixed;
  inset: 0;
  width: fit-content;
  height: fit-content;
  margin: auto;
  border: solid;
  padding: 0.25em;
  overflow: auto;
  color: CanvasText;
  background-color: Canvas;
}
```

Để ghi đè các kiểu mặc định và làm cho popover xuất hiện ở vị trí khác trên viewport, bạn có thể ghi đè các kiểu trên bằng cách như sau:

```css
:popover-open {
  width: 200px;
  height: 100px;
  position: absolute;
  inset: unset;
  bottom: 5px;
  right: 5px;
  margin: 0;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
- [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) HTML global attribute
