---
title: Cumulative Layout Shift (CLS)
slug: Glossary/CLS
page-type: glossary-definition
sidebar: glossarysidebar
---

**Cumulative Layout Shift (CLS)** là một chỉ số khả năng sử dụng cho các trang web, được Google thiết kế như một trong các chỉ số [Core Web Vital](https://web.dev/articles/vitals).

Nó đo lường mức độ người dùng gặp phải các sự thay đổi bố cục bất ngờ, trong đó các phần tử trên trang bị di chuyển theo cách không mong đợi: tức là, không phải kết quả của một hành động người dùng như nhấn nút hoặc là một phần của hoạt ảnh.

Sự thay đổi bố cục có thể được gây ra, ví dụ, bởi các phần tử {{htmlelement("img")}} hoặc {{htmlelement("video")}} không được cung cấp thuộc tính `width` và `height`, vì vậy trình duyệt không biết chúng sẽ chiếm bao nhiêu không gian cho đến khi chúng được tải.

Giao diện {{domxref("LayoutShift")}}, là một phần của [Performance API](/en-US/docs/Web/API/Performance_API), có thể được sử dụng để đo các thay đổi bố cục riêng lẻ, sau đó có thể được sử dụng để tính điểm CLS cho một trang web.

## Xem thêm

- [CLS](https://web.dev/articles/cls) trên web.dev
