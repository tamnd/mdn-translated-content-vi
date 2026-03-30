---
title: Định tuyến hash
slug: Glossary/Hash_routing
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hash routing** (định tuyến dựa trên hash) là một kỹ thuật phía máy khách được sử dụng trong các ứng dụng một trang (SPA) để quản lý điều hướng và thay đổi trạng thái mà không cần tải lại toàn bộ trang.

## Bối cảnh lịch sử

Các SPA ban đầu không thể thay đổi phần [đường dẫn](/en-US/docs/Web/URI/Reference/Path) của URL mà không tải lại trang. Để giải quyết vấn đề này, các nhà phát triển đã sử dụng **định tuyến SPA dựa trên hash**, lưu trữ tuyến đường trong "[fragment](/en-US/docs/Web/URI/Reference/Fragment)", phần của URL theo sau ký hiệu `#`. Các mẫu phổ biến bao gồm `#/profile` và `#!/profile`. Các ứng dụng liên tục kiểm tra [`window.location.hash`](/en-US/docs/Web/API/Location/hash) (hoặc lắng nghe sự kiện [`hashchange`](/en-US/docs/Web/API/Window/hashchange_event) khi nó được hỗ trợ sau đó) để phát hiện các thay đổi fragment trong quá trình điều hướng của người dùng; SPA sau đó cập nhật view mỗi khi fragment thay đổi.

## Hạn chế

Mặc dù cách tiếp cận này không cần cài đặt server, nó có những hạn chế: hỗ trợ {{glossary("bfcache", "back/forward")}} bị hạn chế, các trang có URL dựa trên hash không được lập chỉ mục đúng cách (các công cụ tìm kiếm bỏ qua fragment), và các URL kết quả được coi là lộn xộn.

Định tuyến dựa trên hash hiện được coi là kỹ thuật lỗi thời. Nó được sử dụng, nếu có, chỉ như một giải pháp dự phòng cho các trình duyệt rất cũ hoặc cho các máy chủ tĩnh nơi định tuyến phía server không thể được cấu hình.

## Các lựa chọn thay thế hiện đại

Đến năm 2012, tất cả các trình duyệt lớn (Chrome 5, Safari 5, Firefox 4) đều hỗ trợ [History API](/en-US/docs/Web/API/History_API). Các SPA giờ có thể gọi [`pushState()`](/en-US/docs/Web/API/History/pushState), [`replaceState()`](/en-US/docs/Web/API/History/replaceState) và sự kiện [`popstate`](/en-US/docs/Web/API/PopStateEvent) để thao tác ngăn xếp lịch sử của trình duyệt, chuyển sang các đường dẫn như `/profile` trực tiếp và cập nhật view mà không cần tải lại hoàn toàn. Điều này cũng cho phép các URL sạch hơn không có fragment hash.
