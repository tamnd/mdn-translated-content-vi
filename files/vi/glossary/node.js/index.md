---
title: Node.js
slug: Glossary/Node.js
page-type: glossary-definition
sidebar: glossarysidebar
---

Node.js là một môi trường chạy {{Glossary("JavaScript")}} đa nền tảng cho phép các nhà phát triển xây dựng ứng dụng phía máy chủ và ứng dụng mạng bằng JavaScript.

## Trình quản lý gói Node (npm)

[npm](https://www.npmjs.com/) là một trình quản lý gói được tải xuống và đi kèm với Node.js. Máy khách dòng lệnh (CLI) `npm` của nó có thể được sử dụng để tải xuống, cấu hình và tạo các gói để sử dụng trong các dự án Node.js. Các gói đã tải xuống có thể được nhập bằng [câu lệnh import ES](/en-US/docs/Web/JavaScript/Reference/Statements/import) và [`require()` của CommonJS](https://en.wikipedia.org/wiki/CommonJS) mà không cần bao gồm thư mục phụ thuộc `node_modules/` nơi chúng được tải xuống, vì Node.js [phân giải](https://nodejs.org/api/modules.html#loading-from-node_modules-folders) các gói mà không có đường dẫn tương đối hoặc tuyệt đối được chỉ định trong phần import của chúng.

Các gói được lưu trữ trên npm được tải xuống từ registry tại [https://registry.npmjs.org/](https://registry.npmjs.org/), nhưng CLI có thể được cấu hình để sử dụng bất kỳ phiên bản tương thích nào.

## Xem thêm

- [Node.js](https://en.wikipedia.org/wiki/Node.js) trên Wikipedia
- [Trang web Node.js](https://nodejs.org/)
- [Tài liệu tham khảo API](https://nodejs.org/api/)
- [Hướng dẫn](https://nodejs.org/en/learn/getting-started/introduction-to-nodejs)
- [Tài liệu npm](https://docs.npmjs.com/)
