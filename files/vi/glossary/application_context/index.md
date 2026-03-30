---
title: Ngữ cảnh ứng dụng
slug: Glossary/Application_context
page-type: glossary-definition
sidebar: glossarysidebar
---

**Ngữ cảnh ứng dụng** (application context) đề cập đến {{glossary("browsing context", "ngữ cảnh duyệt web")}} cấp cao nhất của một [ứng dụng web](/en-US/docs/Web/Progressive_web_apps). Nó xác định cách ngữ cảnh duyệt web của ứng dụng, chẳng hạn như một tab hoặc cửa sổ, được trình bày và hoạt động.

Nhà phát triển web xác định ngữ cảnh ứng dụng trong [tệp manifest của ứng dụng web](/en-US/docs/Web/Progressive_web_apps/Manifest). Họ sử dụng thành phần [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) trong manifest để chỉ định tập hợp các URL được coi là một phần của ngữ cảnh ứng dụng và manifest áp dụng cho đó.

Manifest được áp dụng sau khi ngữ cảnh ứng dụng được tạo nhưng trước khi điều hướng bắt đầu đến URL khởi động hoặc một deep link. **URL khởi động** là trang ban đầu của ứng dụng web. **Deep link** là một URL hướng người dùng đến một trang cụ thể trong ứng dụng web, bỏ qua trang chủ. Ngữ cảnh ứng dụng đảm bảo rằng hành vi và cách trình bày được định nghĩa của ứng dụng được duy trì trong phạm vi của nó.

Khi ngữ cảnh ứng dụng được tạo, trình duyệt phải ngay lập tức điều hướng đến URL khởi động hoặc deep link. Điều hướng này thay thế mục nhập hiện tại trong lịch sử duyệt web. Nếu ngữ cảnh ứng dụng được tạo để điều hướng đến deep link, trình duyệt sẽ điều hướng trực tiếp đến deep link đó; nếu không, nó sẽ điều hướng đến URL khởi động.

Lưu ý rằng URL khởi động không nhất thiết là giá trị của thành phần [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) trong manifest. Trình duyệt có thể bỏ qua `start_url` được chỉ định hoặc có thể cho phép người dùng thay đổi giá trị của nó khi thêm ứng dụng web vào màn hình chủ hoặc đánh dấu nó.

## Xem thêm

- [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope)
- [Web app manifests](/en-US/docs/Web/Progressive_web_apps/Manifest)
- [Progressive web apps (PWA)](/en-US/docs/Web/Progressive_web_apps)
