---
title: Phân tách mã
slug: Glossary/Code_splitting
page-type: glossary-definition
sidebar: glossarysidebar
---

**Phân tách mã** (code splitting) là việc chia nhỏ code mà một ứng dụng web phụ thuộc vào — bao gồm code của chính nó và bất kỳ phụ thuộc bên thứ ba nào — thành các gói riêng biệt có thể được tải độc lập với nhau.
Điều này cho phép một ứng dụng chỉ tải code mà nó thực sự cần tại một thời điểm nhất định, và tải các gói khác theo yêu cầu.
Cách tiếp cận này được sử dụng để cải thiện hiệu suất ứng dụng, đặc biệt khi tải lần đầu.

Phân tách code là một tính năng được hỗ trợ bởi các bundler như [webpack](https://webpack.js.org/) và [Browserify](https://browserify.org/), có thể tạo ra nhiều gói có thể được tải động trong thời gian chạy.

## Xem thêm

- [Lazy loading](/en-US/docs/Web/Performance/Guides/Lazy_loading)
- Thuật ngữ liên quan:
  - {{Glossary("HTTP 2", "HTTP/2")}}
  - {{Glossary("Tree shaking")}}
