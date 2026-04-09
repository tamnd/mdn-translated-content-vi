---
title: Đăng ký Hộp cát quyền riêng tư
short-title: Đăng ký
slug: Web/Privacy/Guides/Privacy_sandbox/Enrollment
page-type: guide
sidebar: privacy
---

> [!WARNING]
> Một số tính năng yêu cầu quy trình enrollment này hiện đang bị phản đối bởi một hoặc nhiều nhà cung cấp trình duyệt.
> Xem các điểm vào API cụ thể để biết thêm chi tiết.

Để truy cập một số tính năng của privacy sandbox, trình duyệt yêu cầu nhà phát triển hoàn tất quy trình **enrollment**.

Enrollment cung cấp một cơ chế để xác minh các thực thể gọi các tính năng của privacy sandbox, và để thu thập dữ liệu dành riêng cho nhà phát triển cần thiết nhằm cấu hình và sử dụng chúng đúng cách. Quy trình enrollment bổ sung một lớp bảo vệ nữa lên trên các ràng buộc cấu trúc được thực thi trong từng tính năng bằng cách tăng tính minh bạch về ai đang thu thập dữ liệu, đồng thời giảm thiểu các nỗ lực lạm dụng tính năng để thu thập nhiều dữ liệu hơn dự kiến.

Mục tiêu là thông tin về từng công ty hoàn tất enrollment sẽ được công khai, nhằm cung cấp tính minh bạch có thể kiểm chứng.

## Các tính năng yêu cầu enrollment

Những tính năng sau đây cần enrollment để có thể sử dụng:

- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) {{deprecated_inline}}
- [Fenced Frame API](/en-US/docs/Web/API/Fenced_frame_API)
- Protected Audience API
- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) {{deprecated_inline}}
- [Topics API](/en-US/docs/Web/API/Topics_API) {{deprecated_inline}}

Tài liệu của từng tính năng sẽ nêu chi tiết hơn chính xác những sub-feature nào sẽ thất bại nếu chưa hoàn tất enrollment, và cách thức thất bại đó.

## Thông tin enrollment của trình duyệt

### Chrome

- **Instructions**: [Enroll for the Privacy Sandbox](https://github.com/privacysandbox/attestation/blob/main/how-to-enroll.md).
- **Testing**: Bạn không cần enrollment để kiểm thử các tính năng privacy sandbox cục bộ. Để cho phép kiểm thử cục bộ, hãy bật cờ nhà phát triển `chrome://flags/#privacy-sandbox-enrollment-overrides`.

## Xem thêm

- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
