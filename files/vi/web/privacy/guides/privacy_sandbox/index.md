---
title: Hộp cát quyền riêng tư
slug: Web/Privacy/Guides/Privacy_sandbox
page-type: guide
sidebar: privacy
---

**privacy sandbox** của Google là một loạt đề xuất nhằm đáp ứng các trường hợp sử dụng giữa các trang web mà không cần cookie bên thứ ba hoặc các cơ chế theo dõi khác, chuẩn bị cho một web tương lai nơi cookie bên thứ ba đã bị loại bỏ. Các chủ đề chính bao gồm danh tính và bảo vệ theo dõi, các giải pháp quảng cáo tôn trọng quyền riêng tư hơn, ngăn chặn theo dõi ẩn, và chia sẻ dữ liệu an toàn giữa các ngữ cảnh duyệt web.

> [!WARNING]
> Một số tính năng này hiện đang bị phản đối bởi một hoặc nhiều nhà cung cấp trình duyệt.
> Xem các điểm vào API cụ thể để biết thêm chi tiết.

## Các tính năng của privacy sandbox

- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) {{deprecated_inline}}
  - : Cho phép nhà phát triển đo lường chuyển đổi - ví dụ khi người dùng bấm vào một quảng cáo được nhúng trên một trang rồi sau đó mua sản phẩm trên trang của nhà cung cấp - và sau đó truy cập các báo cáo về những chuyển đổi đó. Điều này được thực hiện mà không dựa vào cookie theo dõi bên thứ ba.
- [Bounce tracking mitigations](/en-US/docs/Web/Privacy/Guides/Bounce_tracking_mitigations)
  - : Bounce tracking mitigations bảo vệ người dùng khỏi bounce tracking bằng cách xác định các trang theo dõi thông qua một heuristic và định kỳ xóa cookie cùng dữ liệu trạng thái liên quan đến chúng.
- [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies)
  - : Còn được gọi là **partitioned cookies**, CHIPS cho phép nhà phát triển đưa cookie vào bộ nhớ được phân vùng, với một cookie jar riêng cho mỗi trang cấp cao nhất.
- [Fenced Frame API](/en-US/docs/Web/API/Fenced_frame_API)
  - : Cung cấp chức năng để điều khiển nội dung được nhúng trong các phần tử {{htmlelement("fencedframe")}}, cho phép nhúng nội dung đồng thời giải quyết các vấn đề về quyền riêng tư của {{htmlelement("iframe")}}.
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
  - : Cung cấp một cơ chế để truyền đạt độ tin cậy về tính xác thực của người dùng từ một ngữ cảnh duyệt sang ngữ cảnh khác, mà không chia sẻ danh tính của người dùng hoặc cho phép hoạt động của họ trên các trang web bị theo dõi.
- [Related website sets](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets) {{deprecated_inline}}
  - : Một cơ chế để một công ty khai báo mối quan hệ giữa các site khác nhau. Các trình duyệt hỗ trợ sau đó sẽ cho phép truy cập cookie bên thứ ba có giới hạn trên các site đó cho các mục đích cụ thể, thông qua [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).
- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) {{deprecated_inline}}
  - : Một cơ chế lưu trữ phía client cho phép truy cập dữ liệu không phân vùng, giữa các trang web, đồng thời vẫn bảo toàn quyền riêng tư (tức là không dựa vào cookie theo dõi).
- [Topics API](/en-US/docs/Web/API/Topics_API) {{deprecated_inline}}
  - : Cung cấp một cơ chế để nhà phát triển triển khai các trường hợp sử dụng như **interest-based advertising (IBA)** dựa trên các chủ đề do trình duyệt thu thập khi người dùng điều hướng giữa các trang khác nhau, thay vì do nhà phát triển thu thập bằng cách theo dõi hành trình của người dùng trên nhiều site khác nhau thông qua cookie bên thứ ba.

## Các chủ đề khác

- [Privacy sandbox enrollment](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment)
  - : Để truy cập một số tính năng của privacy sandbox, nhà phát triển phải hoàn tất quy trình **enrollment**.

## Xem thêm

- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
