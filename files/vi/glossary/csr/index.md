---
title: Client-side rendering (CSR)
slug: Glossary/CSR
page-type: glossary-definition
sidebar: glossarysidebar
---

**Kết xuất phía máy khách** (CSR - Client-side rendering) đề cập đến thực hành tạo nội dung HTML bằng JavaScript trong trình duyệt. CSR trái ngược với {{glossary("SSR","kết xuất phía máy chủ")}}, nơi máy chủ tạo nội dung HTML. Cả hai kỹ thuật không loại trừ lẫn nhau và có thể được sử dụng cùng nhau trong cùng một ứng dụng.

Một ứng dụng CSR thuần túy có thể trả về nội dung HTML sau:

```html
<!doctype html>
<html lang="vi">
  <head>
    <title>Ứng dụng của tôi</title>
    <script src="bundle.js"></script>
  </head>
  <body>
    <div id="root"></div>
    <noscript>
      <p>Ứng dụng này yêu cầu JavaScript để chạy.</p>
    </noscript>
  </body>
</html>
```

Sau đó, nội dung trang thực sự được tạo bởi JavaScript trong `bundle.js`, sử dụng [thao tác DOM](/en-US/docs/Web/API/Document_Object_Model).

Ưu điểm của CSR bao gồm:

- Tính tương tác: mọi cập nhật trang, bao gồm cả chuyển đổi route, không yêu cầu tải lại toàn bộ trang. Điều này làm cho ứng dụng cảm thấy nhanh hơn và phản hồi tốt hơn.
- Hiệu năng: máy chủ chỉ cần gửi nội dung HTML ban đầu và các tài nguyên JavaScript. Các cập nhật trang tiếp theo có thể được tải từ API, có thể nhanh hơn so với việc lấy toàn bộ trang HTML, và ít tải hơn cho máy chủ.

Cả SSR và CSR đều có những đánh đổi về hiệu năng riêng, và có thể kết hợp cả hai để tận dụng ưu điểm của từng kỹ thuật. Ví dụ, máy chủ có thể tạo ra khung trang với các chỗ trống, còn client sẽ tải thêm dữ liệu và cập nhật trang khi cần.

Lưu ý rằng {{glossary("SPA","ứng dụng trang đơn")}} không yêu cầu trang web phải dùng CSR. Các framework hiện đại như [React](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_getting_started), [Vue](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Vue_getting_started) và [Svelte](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Svelte_getting_started) đều có thể được dùng để xây dựng SPA với khả năng SSR.

## Xem thêm

- [Giới thiệu về các framework phía client > kết xuất phía máy chủ](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Introduction#server-side_rendering)
- [Client-side rendering](https://en.wikipedia.org/wiki/Client-side_rendering) trên Wikipedia
- {{glossary("SSR", "Kết xuất phía máy chủ")}}
- {{glossary("SSG", "Bộ tạo trang tĩnh")}}
- {{glossary("SPA", "Ứng dụng trang đơn")}}
