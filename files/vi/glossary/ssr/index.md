---
title: Kết xuất phía máy chủ (SSR)
slug: Glossary/SSR
page-type: glossary-definition
sidebar: glossarysidebar
---

**Kết xuất phía máy chủ** (Server-side rendering - SSR) đề cập đến phương pháp tạo nội dung HTML trên máy chủ và gửi nó đến máy khách. SSR trái ngược với {{glossary("CSR", "kết xuất phía máy khách")}}, nơi máy khách tạo nội dung HTML bằng JavaScript. Cả hai kỹ thuật không loại trừ nhau và có thể được sử dụng kết hợp trong cùng một ứng dụng.

Một {{glossary("SSG", "trang web tĩnh")}} có thể được coi là SSR (và có thể được tạo bằng cơ sở hạ tầng SSR), nhưng có những khác biệt tinh tế. Nội dung của một trang web tĩnh được tạo ra tại thời điểm xây dựng, không phải tại thời điểm yêu cầu. Các trang web tĩnh thường không cần triển khai trên máy chủ, và có thể được phục vụ từ {{glossary("CDN")}}.

Sự phân biệt SSR/CSR có ý nghĩa hơn đối với các trang web có nội dung động, ví dụ như nội dung cập nhật liên tục hoặc nội dung dành riêng cho người dùng. Trong những trường hợp này, với mỗi yêu cầu, máy chủ tạo nội dung HTML theo thời gian thực vì việc tạo trước mọi trang có thể là không khả thi. Tệp HTML chứa nội dung trang gần như đầy đủ, và bất kỳ tài nguyên JavaScript nào chỉ để kích hoạt tính năng tương tác.

Lợi ích của SSR bao gồm:

- Khả năng truy cập: trang có thể sử dụng được (một phần) mà không cần JavaScript, ví dụ khi kết nối Internet chậm, người dùng đã tắt JavaScript, hoặc trình duyệt cũ và JavaScript không chạy được. Tuy nhiên, mọi tính năng tương tác hay logic phía máy khách sẽ không hoạt động.
- Thân thiện với trình thu thập dữ liệu: công cụ tìm kiếm, trình thu thập dữ liệu mạng xã hội và các bot khác có thể dễ dàng đọc nội dung mà không cần thực thi JavaScript. Lưu ý rằng các công cụ tìm kiếm lớn có khả năng thực thi JavaScript nên các trang CSR thuần túy vẫn có thể được lập chỉ mục, nhưng trình thu thập mạng xã hội thường không làm được điều này.
- Hiệu suất: máy chủ có thể biết trước nội dung cần thiết và tải tất cả dữ liệu cần thiết cùng một lúc, so với CSR nơi máy khách thường chỉ nhận biết các phụ thuộc thêm khi hiển thị trang ban đầu, gây ra hiệu ứng thác nước của các yêu cầu.

Cả SSR và CSR đều có sự đánh đổi về hiệu suất, và có thể kết hợp SSR và CSR để tận dụng lợi ích của cả hai kỹ thuật. Ví dụ, máy chủ có thể tạo ra khung trang với các vùng chứa rỗng, và máy khách có thể tải thêm dữ liệu và cập nhật trang theo nhu cầu.

## Xem thêm

- [Giới thiệu về các framework phía client > kết xuất phía máy chủ](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Introduction#server-side_rendering)
- [Server-side scripting](https://en.wikipedia.org/wiki/Server-side_scripting) trên Wikipedia
- {{glossary("CSR", "Kết xuất phía máy khách")}}
- {{glossary("SSG", "Trình tạo trang web tĩnh")}}
- {{glossary("SPA", "Ứng dụng một trang")}}
