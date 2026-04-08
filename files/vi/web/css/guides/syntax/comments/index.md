---
title: Comments
slug: Web/CSS/Guides/Syntax/Comments
page-type: guide
spec-urls: https://drafts.csswg.org/css-syntax-3/#consume-comment
sidebar: cssref
---

**Comment** trong CSS được dùng để thêm ghi chú giải thích vào code hoặc ngăn trình duyệt diễn giải các phần cụ thể của stylesheet. Theo thiết kế, comment không có tác động đến bố cục của tài liệu.

## Cú pháp

Comment có thể được đặt ở bất kỳ nơi nào cho phép khoảng trắng trong stylesheet. Chúng có thể được dùng trên một dòng, hoặc kéo dài trên nhiều dòng.

```css
/* Comment */
```

## Ví dụ

```css
/* Một comment trên một dòng */

/*
Một comment
kéo dài
qua nhiều
dòng
*/

/* Comment bên dưới được dùng để
   vô hiệu hóa một số kiểu dáng cụ thể */
/*
span {
  color: blue;
  font-size: 1.5em;
}
*/
```

## Ghi chú

Cú pháp comment `/* */` được dùng cho cả comment một dòng và nhiều dòng. Không có cách nào khác để chỉ định comment trong các stylesheet bên ngoài. Tuy nhiên, khi sử dụng phần tử {{htmlelement("style")}}, bạn có thể dùng `<!-- -->` để ẩn CSS khỏi các trình duyệt cũ hơn, mặc dù điều này không được khuyến nghị. Như với hầu hết các ngôn ngữ lập trình sử dụng cú pháp comment `/* */`, comment không thể được lồng nhau. Nói cách khác, ký hiệu `*/` đầu tiên sau một ký hiệu `/*` sẽ đóng comment đó.

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
- Hướng dẫn [Syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [CSS error handling](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
