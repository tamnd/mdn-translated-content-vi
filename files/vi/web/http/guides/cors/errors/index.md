---
title: CORS errors
slug: Web/HTTP/Guides/CORS/Errors
page-type: landing-page
sidebar: http
---

[Cross-Origin Resource Sharing](/en-US/docs/Web/HTTP/Guides/CORS) ({{Glossary("CORS")}}) là tiêu chuẩn cho phép máy chủ nới lỏng [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy). Tiêu chuẩn này được sử dụng để cho phép một số yêu cầu xuyên nguồn gốc trong khi từ chối các yêu cầu khác. Ví dụ: nếu một trang web cung cấp dịch vụ nhúng, có thể cần nới lỏng một số hạn chế nhất định. Thiết lập cấu hình CORS như vậy không nhất thiết là dễ dàng và có thể gặp một số thách thức. Trong các trang này, chúng ta sẽ xem xét một số thông báo lỗi CORS phổ biến và cách giải quyết chúng.

Nếu cấu hình CORS không được thiết lập đúng cách, bảng điều khiển trình duyệt sẽ hiển thị lỗi như `"Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at [some site]"` chỉ ra rằng yêu cầu đã bị chặn do vi phạm quy tắc bảo mật CORS. Điều này không nhất thiết là một lỗi thiết lập. Có thể yêu cầu thực sự đang bị cố ý từ chối bởi ứng dụng web của người dùng và dịch vụ bên ngoài từ xa. Tuy nhiên, nếu endpoint được thiết kế để có thể truy cập, cần phải gỡ lỗi để thành công.

## Xác định sự cố CORS

Để hiểu vấn đề cơ bản với cấu hình CORS, bạn cần tìm ra yêu cầu nào đang gặp sự cố và tại sao. Các bước sau có thể giúp bạn làm điều đó:

1. Điều hướng đến trang web hoặc ứng dụng web được hỏi và mở [Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html).
2. Bây giờ hãy thử tái tạo giao dịch thất bại và kiểm tra [bảng điều khiển](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html) xem bạn có thấy thông báo lỗi vi phạm CORS không. Nó trông có thể như thế này:

![Bảng điều khiển Firefox hiển thị lỗi CORS](cors-error2.png)

Văn bản của thông báo lỗi sẽ tương tự như sau:

```plain
Cross-Origin Request Blocked: The Same Origin Policy disallows
reading the remote resource at https://some-url-here. (Reason:
additional information here).
```

> [!NOTE]
> Vì lý do bảo mật, thông tin cụ thể về điều gì xảy ra sai với yêu cầu CORS _không có sẵn cho code JavaScript_. Tất cả những gì code biết là đã xảy ra lỗi. Cách duy nhất để xác định chính xác điều gì xảy ra sai là xem bảng điều khiển của trình duyệt để biết thêm chi tiết.

## Cân nhắc phía client

Hầu hết các lỗi CORS chỉ có thể được giải quyết trên máy chủ, vì máy chủ kiểm soát liệu truy cập xuyên nguồn gốc có được phép hay không. Tuy nhiên, có một số điều bạn có thể làm ở phía client:

### Tránh kích hoạt preflight

Trình duyệt gửi [yêu cầu preflight](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests) trước yêu cầu thực tế khi một số điều kiện được đáp ứng (header tùy chỉnh, phương thức khác `GET`/`HEAD`/`POST`, hoặc loại nội dung không đơn giản). Nếu máy chủ không xử lý yêu cầu preflight, bạn có thể cấu trúc lại yêu cầu của mình để đủ điều kiện là [yêu cầu đơn giản](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests):

- Chỉ sử dụng các phương thức `GET`, `HEAD` hoặc `POST`.
- Chỉ đặt các [header yêu cầu CORS được đưa vào danh sách an toàn](/en-US/docs/Glossary/CORS-safelisted_request_header) (như {{HTTPHeader("Accept")}}, {{HTTPHeader("Content-Language")}} hoặc {{HTTPHeader("Content-Type")}}).
- Chỉ sử dụng `application/x-www-form-urlencoded`, `multipart/form-data` hoặc `text/plain` cho {{HTTPHeader("Content-Type")}}.

Các yêu cầu đơn giản hoàn toàn bỏ qua bước preflight, tránh một loại lỗi CORS liên quan đến xử lý preflight.

### Sử dụng chế độ `no-cors` cho phản hồi mờ

Nếu bạn không cần đọc body hoặc header phản hồi — ví dụ: khi gửi beacon phân tích hoặc tải tài nguyên vào cache qua service worker — bạn có thể đặt {{domxref("Request/mode", "mode")}} thành `"no-cors"` trong lời gọi {{domxref("Window/fetch", "fetch()")}}:

```js
fetch("https://api.example.com/log", {
  method: "POST",
  mode: "no-cors",
  body: data,
});
```

Phản hồi sẽ [mờ](/en-US/docs/Web/API/Response/type): trạng thái của nó là `0`, các header trống và body không thể đọc được bởi JavaScript. Đây là theo thiết kế - `no-cors` vô hiệu hóa kiểm tra CORS, nhưng đổi lại bạn mất tất cả quyền truy cập vào nội dung phản hồi.

### Sử dụng máy chủ proxy

Nếu bạn không kiểm soát máy chủ từ xa và nó không đặt CORS header, bạn có thể định tuyến các yêu cầu qua máy chủ bạn kiểm soát. Máy chủ của bạn tải tài nguyên thay mặt bạn và trả về nó với các CORS header thích hợp. Cách tiếp cận này thêm độ trễ và tạo ra sự phụ thuộc vào proxy của bạn, nhưng nó hoạt động khi các tùy chọn khác không khả dụng.

## Thông báo lỗi CORS

Bảng điều khiển của Firefox hiển thị thông báo trong bảng điều khiển khi các yêu cầu thất bại do CORS. Một phần của văn bản lỗi là thông báo "reason" cung cấp thêm thông tin về những gì đã xảy ra sai. Các thông báo lý do được liệt kê bên dưới; nhấp vào thông báo để mở bài viết giải thích lỗi chi tiết hơn và đưa ra các giải pháp khả thi.

- [Reason: CORS disabled](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSDisabled)
- [Reason: CORS request did not succeed](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSDidNotSucceed)
- [Reason: CORS header 'Origin' cannot be added](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSOriginHeaderNotAdded)
- [Reason: CORS request external redirect not allowed](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSExternalRedirectNotAllowed)
- [Reason: CORS request not http](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSRequestNotHttp)
- [Reason: CORS header 'Access-Control-Allow-Origin' missing](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSMissingAllowOrigin)
- [Reason: CORS header 'Access-Control-Allow-Origin' does not match 'xyz'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSAllowOriginNotMatchingOrigin)
- [Reason: Credential is not supported if the CORS header 'Access-Control-Allow-Origin' is '\*'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSNotSupportingCredentials)
- [Reason: Did not find method in CORS header 'Access-Control-Allow-Methods'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSMethodNotFound)
- [Reason: expected 'true' in CORS header 'Access-Control-Allow-Credentials'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSMIssingAllowCredentials)
- [Reason: CORS preflight channel did not succeed](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSPreflightDidNotSucceed)
- [Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Methods'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSInvalidAllowMethod)
- [Reason: invalid token 'xyz' in CORS header 'Access-Control-Allow-Headers'](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSInvalidAllowHeader)
- [Reason: missing token 'xyz' in CORS header 'Access-Control-Allow-Headers' from CORS preflight channel](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSMissingAllowHeaderFromPreflight)
- [Reason: Multiple CORS header 'Access-Control-Allow-Origin' not allowed](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSMultipleAllowOriginNotAllowed)

Hầu hết các lỗi CORS chỉ có thể được giải quyết trên máy chủ, vì máy chủ kiểm soát liệu truy cập xuyên nguồn gốc có được phép hay không. Tuy nhiên, có một số điều bạn có thể làm ở phía client:

### Tránh kích hoạt preflight

Trình duyệt gửi [yêu cầu preflight](/en-US/docs/Web/HTTP/Guides/CORS#preflighted_requests) trước yêu cầu thực tế khi một số điều kiện được đáp ứng (header tùy chỉnh, phương thức khác `GET`/`HEAD`/`POST`, hoặc loại nội dung không đơn giản). Nếu máy chủ không xử lý yêu cầu preflight, bạn có thể cấu trúc lại yêu cầu của mình để đủ điều kiện là [yêu cầu đơn giản](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests):

- Chỉ sử dụng các phương thức `GET`, `HEAD` hoặc `POST`.
- Chỉ đặt các [header yêu cầu CORS được đưa vào danh sách an toàn](/en-US/docs/Glossary/CORS-safelisted_request_header) (như {{HTTPHeader("Accept")}}, {{HTTPHeader("Content-Language")}} hoặc {{HTTPHeader("Content-Type")}}).
- Chỉ sử dụng `application/x-www-form-urlencoded`, `multipart/form-data` hoặc `text/plain` cho {{HTTPHeader("Content-Type")}}.

Các yêu cầu đơn giản hoàn toàn bỏ qua bước preflight, tránh một loại lỗi CORS liên quan đến xử lý preflight.

### Sử dụng chế độ `no-cors` cho phản hồi mờ

Nếu bạn không cần đọc body hoặc header phản hồi — ví dụ: khi gửi beacon phân tích hoặc tải tài nguyên vào cache qua service worker — bạn có thể đặt {{domxref("Request/mode", "mode")}} thành `"no-cors"` trong lời gọi {{domxref("Window/fetch", "fetch()")}}:

```js
fetch("https://api.example.com/log", {
  method: "POST",
  mode: "no-cors",
  body: data,
});
```

Phản hồi sẽ [mờ](/en-US/docs/Web/API/Response/type): trạng thái của nó là `0`, các header trống và body không thể đọc được bởi JavaScript. Đây là theo thiết kế — `no-cors` vô hiệu hóa kiểm tra CORS, nhưng đổi lại bạn mất tất cả quyền truy cập vào nội dung phản hồi.

### Sử dụng máy chủ proxy

Nếu bạn không kiểm soát máy chủ từ xa và nó không đặt CORS header, bạn có thể định tuyến các yêu cầu qua máy chủ bạn kiểm soát. Máy chủ của bạn tải tài nguyên thay mặt bạn và trả về nó với các CORS header thích hợp. Cách tiếp cận này thêm độ trễ và tạo ra sự phụ thuộc vào proxy của bạn, nhưng nó hoạt động khi các tùy chọn khác không khả dụng.

## Xem thêm

- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [Cài đặt CORS phía máy chủ](/en-US/docs/Web/HTTP/Guides/CORS)
- [Hình ảnh kích hoạt CORS](/en-US/docs/Web/HTML/How_to/CORS_enabled_image)
- [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
