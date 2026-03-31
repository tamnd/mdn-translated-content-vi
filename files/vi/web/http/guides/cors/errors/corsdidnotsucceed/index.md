---
title: "Reason: CORS request did not succeed"
slug: Web/HTTP/Guides/CORS/Errors/CORSDidNotSucceed
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS request did not succeed
```

## Điều gì đã xảy ra sai?

Yêu cầu {{Glossary("HTTP")}} sử dụng CORS đã thất bại vì kết nối HTTP bị lỗi ở cấp độ mạng hoặc giao thức. Lỗi không liên quan trực tiếp đến CORS, mà là một lỗi mạng cơ bản nào đó.

Trong nhiều trường hợp, lỗi này do tiện ích mở rộng của trình duyệt (ví dụ: trình chặn quảng cáo hoặc bảo vệ quyền riêng tư) chặn yêu cầu.

## Cách sửa

- Kiểm tra DevTools > Network để xem yêu cầu có thất bại do phân giải DNS, hết thời gian chờ, kết nối bị từ chối hay lỗi bắt tay TLS không.
- Tắt tiện ích mở rộng trình duyệt hoặc thử cửa sổ duyệt web riêng tư, vì các trình chặn quảng cáo, tường lửa và công cụ quyền riêng tư có thể chặn các yêu cầu mạng.
- Sửa các vấn đề chứng chỉ hoặc {{Glossary("TLS")}}, chẳng hạn như chứng chỉ hết hạn hoặc không hợp lệ.
- Tránh nội dung hỗn hợp: nếu trang được tải qua HTTPS, các yêu cầu đến tài nguyên HTTP có thể thất bại. Phục vụ API qua HTTPS thay thế.
- Xác nhận rằng máy chủ đang phản hồi đúng cách và endpoint trả về phản hồi.

Nếu bạn đang sử dụng máy chủ dev cục bộ, hãy đảm bảo rằng scheme và cổng đúng và dịch vụ đang chạy.

Các nguyên nhân có thể khác bao gồm:

- Cố gắng truy cập tài nguyên `https` có chứng chỉ không hợp lệ sẽ gây ra lỗi này.
- Cố gắng truy cập tài nguyên `http` từ trang có nguồn gốc `https` cũng sẽ gây ra lỗi này.
- Từ Firefox 68 đến Firefox 84, các trang `https` không được phép truy cập `http://localhost`. Điều này đã được thay đổi với [Bug 1488740](https://bugzil.la/1488740).
- Máy chủ không phản hồi yêu cầu thực tế (ngay cả khi nó phản hồi {{Glossary("Preflight request")}}). Một tình huống có thể là dịch vụ HTTP đang được phát triển bị lỗi mà không trả về bất kỳ dữ liệu nào.
- Cửa sổ đang ở chế độ "Duyệt web riêng tư" (có thể có các yêu cầu bảo mật có thể chặn yêu cầu CORS).

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
