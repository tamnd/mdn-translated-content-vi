---
title: bfcache
slug: Glossary/bfcache
page-type: glossary-definition
sidebar: glossarysidebar
---

**Bộ nhớ đệm tiến/lùi** (back/forward cache), hay **bfcache**, là một tính năng nâng cao hiệu suất có sẵn trong các trình duyệt hiện đại cho phép điều hướng tức thì qua lại giữa các trang đã truy cập trước đó. Nó làm điều này bằng cách lưu trữ một ảnh chụp nhanh hoàn chỉnh của trang khi người dùng điều hướng đi; trình duyệt có thể nhanh chóng khôi phục ảnh chụp nhanh nếu người dùng quyết định quay lại, thay vì cần lặp lại các yêu cầu mạng để tải trang.

Ảnh chụp nhanh chứa toàn bộ trang trong bộ nhớ, bao gồm cả heap JavaScript; code đang thực thi bị tạm dừng khi người dùng điều hướng đi và được tiếp tục khi họ quay lại trang. Ngược lại, một mục bộ nhớ đệm HTTP thông thường chỉ chứa phản hồi cho các yêu cầu trước đó. Do đó bfcache cung cấp kết quả nhanh hơn so với bộ nhớ đệm HTTP.

Nhược điểm là các mục bfcache yêu cầu nhiều tài nguyên hơn và tạo ra sự phức tạp về cách biểu diễn code đang thực thi. Một số tính năng code (ví dụ như trình xử lý [`unload`](/en-US/docs/Web/API/Window/unload_event)) không tương thích, vì vậy sự hiện diện của chúng trên trang chặn trang sử dụng bfcache.

bfcache rất tốt cho hiệu suất, vì vậy bạn có lợi ích để đảm bảo trang của mình không bị chặn khỏi việc sử dụng nó. Bạn có thể sử dụng [API `notRestoredReasons`](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để theo dõi xem các trang có bị chặn khỏi việc sử dụng bfcache hay không, và lý do tại sao.

## Xem thêm

- [Back and forward cache](https://web.dev/articles/bfcache) trên web.dev (2023)
