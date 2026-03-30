---
title: Phân tích cú pháp suy đoán
slug: Glossary/Speculative_parsing
page-type: glossary-definition
sidebar: glossarysidebar
---

Theo truyền thống, trong các trình duyệt, trình phân tích HTML chạy trên luồng chính và bị chặn sau thẻ `</script>` cho đến khi script được lấy từ mạng và thực thi. Một số trình phân tích HTML, như Firefox từ phiên bản 4, hỗ trợ phân tích suy đoán (speculative parsing) ngoài luồng chính. Nó phân tích trước trong khi script đang được tải xuống và thực thi. Trình phân tích HTML bắt đầu tải suy đoán các script, stylesheet và hình ảnh mà nó tìm thấy phía trước trong luồng và chạy thuật toán xây dựng cây HTML theo cách suy đoán. Ưu điểm là khi một suy đoán thành công, không cần phân tích lại phần tệp đến đã được quét qua cho các script, stylesheet và hình ảnh. Nhược điểm là có nhiều công việc bị mất hơn khi suy đoán thất bại.

Tài liệu này giúp bạn tránh những điều làm cho suy đoán thất bại và làm chậm quá trình tải trang của bạn.

Để làm cho việc tải suy đoán các script, stylesheet và hình ảnh được liên kết thành công, hãy tránh {{domxref('document.write')}}. Nếu bạn sử dụng phần tử `<base>` để ghi đè URI cơ sở của trang, hãy đặt phần tử trong phần không có script của tài liệu. Đừng thêm nó qua `document.write()` hay {{domxref('document.createElement')}}.

## Tránh mất đầu ra của tree builder

Quá trình xây dựng cây suy đoán thất bại khi `document.write()` thay đổi trạng thái tree builder sao cho trạng thái suy đoán sau thẻ `</script>` không còn đúng khi tất cả nội dung được chèn bởi `document.write()` đã được phân tích. Tuy nhiên, chỉ các cách sử dụng bất thường của `document.write()` mới gây ra vấn đề. Đây là những điều cần tránh:

- Đừng viết các cây mất cân bằng. `<script>document.write("<div>");</script>` là không tốt. `<script>document.write("<div></div>");</script>` là được.
- Đừng viết token chưa hoàn thành. `<script>document.write("<div></div");</script>` là không tốt.
- Đừng kết thúc phần viết của bạn bằng ký tự xuống dòng. `<script>document.write("Hello World!\r");</script>` là không tốt. `<script>document.write("Hello World!\n");</script>` là được.
- Lưu ý rằng việc viết các thẻ cân bằng có thể khiến các thẻ khác được suy ra theo cách làm cho phần viết mất cân bằng. Ví dụ: `<script>document.write("<div></div>");</script>` bên trong phần tử `head` sẽ được hiểu là `<script>document.write("</head><body><div></div>");</script>` là mất cân bằng.
- Đừng định dạng một phần của bảng. `<table><script>document.write("<tr><td>Hello World!</td></tr>");</script></table>` là không tốt.
