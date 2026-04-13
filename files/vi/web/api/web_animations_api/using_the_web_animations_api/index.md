---
title: Using the Web Animations API
slug: Web/API/Web_Animations_API/Using_the_Web_Animations_API
page-type: guide
---

{{DefaultAPISidebar("Web Animations")}}

Web Animations API cho phép bạn tạo hoạt ảnh bằng JavaScript. Bài viết này giới thiệu các khái niệm cơ bản và cách dùng API này để tạo hoạt ảnh cho phần tử DOM.

## Tổng quan

Web Animations API kết hợp cú pháp khai báo của CSS với sức mạnh của JavaScript. Bạn xác định các keyframes và tùy chọn định thời, rồi gọi `animate()` trên phần tử mục tiêu.

## Các khái niệm cơ bản

Đoạn này mô tả keyframe, timing, playback control và các điểm khác biệt so với CSS animations.

## Ví dụ

```js
element.animate(
  [
    { opacity: 0, transform: "translateY(20px)" },
    { opacity: 1, transform: "translateY(0)" },
  ],
  {
    duration: 300,
    easing: "ease-out",
  },
);
```

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [Keyframe Formats](/en-US/docs/Web/API/Web_Animations_API/Keyframe_Formats)
- [Tips and Tricks](/en-US/docs/Web/API/Web_Animations_API/Tips)
