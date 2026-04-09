---
title: Triển khai Cross-Origin Resource Policy (CORP)
short-title: Cross-Origin Resource Policy (CORP)
slug: Web/Security/Practical_implementation_guides/CORP
page-type: guide
sidebar: security
---

Cross-Origin Resource Policy (CORP) được thiết lập bởi header phản hồi {{httpheader("Cross-Origin-Resource-Policy")}}, cho phép website và ứng dụng chủ động chọn tham gia vào việc bảo vệ khỏi các lỗ hổng liên quan đến một số yêu cầu cross-origin nhất định (chẳng hạn những yêu cầu được thực hiện bởi các phần tử {{htmlelement("script")}} và {{htmlelement("img")}}).

## Vấn đề

Một số lỗ hổng phần cứng kênh phụ (còn được gọi là Cross-site leaks, hoặc XS-Leaks), chẳng hạn như [Meltdown](<https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability)>) và [Spectre](<https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)>), khai thác một điều kiện chạy đua phát sinh như một phần của chức năng thực thi suy đoán của các bộ xử lý hiện đại. Chức năng này được thiết kế để cải thiện hiệu năng nhưng có thể bị thao túng để tiết lộ dữ liệu nhạy cảm.

## Giải pháp

Dùng `Cross-Origin-Resource-Policy` để chặn các yêu cầu cross-origin [`no-cors`](/en-US/docs/Web/API/RequestInit#mode) tới các tài nguyên nhất định. Vì chính sách này được thể hiện qua header phản hồi, yêu cầu thực tế không bị ngăn chặn. Thay vào đó, trình duyệt ngăn kết quả bị rò rỉ bằng cách loại bỏ phần thân phản hồi.

Các giá trị có thể dùng là:

- `same-origin`
  - : Giới hạn truy cập tài nguyên cho các yêu cầu đến từ cùng origin. Điều này được khuyến nghị cho các URL trả về thông tin nhạy cảm của người dùng hoặc API riêng tư.
- `same-site`
  - : Giới hạn truy cập tài nguyên cho các yêu cầu đến từ cùng site. Điều này được khuyến nghị cho các phản hồi từ những origin có chức năng được chia sẻ trên nhiều origin cùng site khác. Ví dụ gồm một CDN của công ty phục vụ tài nguyên tĩnh, và một ứng dụng đăng nhập một lần (SSO) xử lý xác thực.
- `cross-origin`
  - : Cho phép tài nguyên được truy cập bởi các yêu cầu cross-origin. Điều này chỉ được khuyến nghị cho các phản hồi từ những origin được dùng rộng rãi, chẳng hạn CDN công khai hoặc widget. Đây là giá trị mặc định nếu `Cross-Origin-Resource-Policy` không được đặt.

Đặt giá trị hạn chế nhất có thể cho site của bạn.

Nếu ngược lại, site của bạn cần truy cập tài nguyên cross-origin, hãy chủ động chọn một mặc định tốt hơn bằng cách gửi header {{httpheader("Cross-Origin-Embedder-Policy")}} cùng với các yêu cầu liên quan. Điều này sẽ ngăn tải các tài nguyên cross-origin mà cũng không gửi rõ ràng header `Cross-Origin-Resource-Policy: cross-origin`.

## Ví dụ

Yêu cầu trình duyệt không cho phép các yêu cầu cross-origin được thực hiện ở chế độ `no-cors`:

```http
Cross-Origin-Resource-Policy: same-origin
```

Yêu cầu trình duyệt cho phép truy cập tài nguyên cross-origin, bao gồm quyền truy cập vào các tính năng có bộ hẹn giờ không bị giới hạn (chẳng hạn các đối tượng {{jsxref("SharedArrayBuffer")}} hoặc {{domxref("Performance.now()")}}):

```http
Cross-Origin-Resource-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

Điều này cũng cho phép các tài nguyên như vậy được nhúng.

## Xem thêm

- [Cân nhắc triển khai Cross-Origin Resource Policy](https://resourcepolicy.fyi/)
- [XS-Leaks Wiki](https://xsleaks.dev/)
- [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin)
- [`Cross-Origin-Embedder-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy)
- [`Cross-Origin-Opener-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Opener-Policy)
- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
