---
title: :target-current
slug: Web/CSS/Reference/Selectors/:target-current
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.target-current
sidebar: cssref
---

{{SeeCompatTable}}

Lớp giả **`:target-current`** trong [CSS](/en-US/docs/Web/CSS) chọn **scroll marker đang hoạt động** — tức là scroll marker của {{cssxref("scroll-marker-group")}} hiện đang được cuộn đến. [Bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors) này có thể dùng để tạo kiểu cho vị trí điều hướng đang hoạt động trong một nhóm scroll marker.

> [!NOTE]
> Lớp giả `:target-current` chỉ hợp lệ trên phần tử giả {{cssxref("::scroll-marker")}} và các phần tử đã được chỉ định làm scroll marker bằng thuộc tính {{cssxref("scroll-target-group")}}.

## Cú pháp

```css-nolint
:target-current {
  /* ... */
}
```

## Ví dụ

Xem [Tạo carousel bằng CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) và {{cssxref("::scroll-marker")}} để có ví dụ đầy đủ sử dụng lớp giả `:target-current`.

### Sử dụng cơ bản

```css
::scroll-marker {
  background-color: white;
}

::scroll-marker:target-current {
  background-color: black;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- {{cssxref("scroll-target-group")}}
- {{cssxref(":target-before")}}, {{cssxref(":target-after")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::scroll-marker-group")}}
- [Tạo carousel bằng CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Mô-đun [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
