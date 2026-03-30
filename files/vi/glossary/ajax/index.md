---
title: Ajax
slug: Glossary/AJAX
page-type: glossary-definition
sidebar: glossarysidebar
---

Asynchronous JavaScript and XML (**Ajax**, hay **AJAX**) là một kỹ thuật phát triển web trong đó ứng dụng web lấy nội dung từ máy chủ bằng cách thực hiện các yêu cầu HTTP bất đồng bộ, và sử dụng nội dung mới để cập nhật các phần liên quan của trang mà không cần tải lại toàn bộ trang. Điều này có thể làm cho trang phản hồi nhanh hơn, vì chỉ những phần cần cập nhật mới được yêu cầu.

Ajax có thể được sử dụng để tạo {{Glossary("SPA", "ứng dụng một trang")}}, trong đó toàn bộ ứng dụng web bao gồm một tài liệu duy nhất, sử dụng Ajax để cập nhật nội dung khi cần.

Ban đầu, Ajax được triển khai bằng giao diện {{domxref("XMLHttpRequest")}}, nhưng API {{domxref("Window/fetch", "fetch()")}} phù hợp hơn cho các ứng dụng web hiện đại: nó mạnh mẽ hơn, linh hoạt hơn và tích hợp tốt hơn với các công nghệ ứng dụng web cơ bản như [service workers](/en-US/docs/Web/API/Service_Worker_API). Các framework web hiện đại cũng cung cấp các lớp trừu tượng cho Ajax.

Kỹ thuật này phổ biến đến mức trong phát triển web hiện đại, thuật ngữ cụ thể "Ajax" hiếm khi được sử dụng.

## Xem thêm

- [Học: Thực hiện yêu cầu mạng với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests)
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- Các thuật ngữ liên quan:
  - {{Glossary("SPA", "Single-page application")}}
- {{DOMxRef("XMLHttpRequest")}}
- [AJAX](https://en.wikipedia.org/wiki/AJAX) trên Wikipedia
