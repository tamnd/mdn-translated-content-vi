---
title: CDN
slug: Glossary/CDN
page-type: glossary-definition
sidebar: glossarysidebar
---

**CDN** (Content Delivery Network - Mạng phân phối nội dung) là một nhóm máy chủ trải rộng trên nhiều địa điểm. Các máy chủ này lưu trữ các bản sao trùng lặp của dữ liệu để các máy chủ có thể đáp ứng các yêu cầu dữ liệu dựa trên máy chủ nào gần nhất với người dùng cuối tương ứng. CDN đảm bảo dịch vụ nhanh hơn và ít bị ảnh hưởng bởi lưu lượng cao.

CDN được sử dụng rộng rãi để phân phối các stylesheet và tệp JavaScript (tài nguyên tĩnh) của các thư viện như Bootstrap, jQuery, v.v. Sử dụng CDN cho các tệp thư viện đó được ưa chuộng vì một số lý do:

- Phục vụ các tài nguyên tĩnh của thư viện qua CDN làm giảm gánh nặng yêu cầu trên các máy chủ của tổ chức.
- Hầu hết CDN có máy chủ trên khắp thế giới, vì vậy các máy chủ CDN có thể gần người dùng của bạn hơn về mặt địa lý so với máy chủ của chính bạn. Khoảng cách địa lý ảnh hưởng đến độ trễ tỷ lệ thuận.
- CDN đã được cấu hình sẵn với các cài đặt cache phù hợp. Sử dụng CDN giúp tiết kiệm việc cấu hình thêm cho tài nguyên tĩnh trên máy chủ của bạn.

Thực tế, toàn bộ trang web có thể được phục vụ từ CDN, đặc biệt là các trang web [tĩnh](/en-US/docs/Glossary/SSG) bao gồm hoàn toàn các tệp HTML, CSS và JavaScript tĩnh.

Cũng có những nhược điểm khi sử dụng CDN, so với tự lưu trữ tài nguyên tĩnh:

- CDN tạo ra sự phụ thuộc bổ sung vào dịch vụ của bên thứ ba. Nếu CDN ngừng hoạt động, bị chặn ở một khu vực, hoặc bị đóng cửa vĩnh viễn, trang web của bạn sẽ bị trục trặc.
- CDN tạo ra một vector tấn công bổ sung. Kẻ tấn công có thể xâm phạm CDN và phục vụ nội dung độc hại cho người dùng của bạn. Điều này đòi hỏi các biện pháp phòng ngừa như [Subresource Integrity (SRI)](/en-US/docs/Web/Security/Practical_implementation_guides/SRI).
- Trái với suy nghĩ phổ biến, CDN thực sự có thể _giảm_ hiệu suất. Bằng cách thiết lập kết nối với một trang web bên thứ ba, trình duyệt của người dùng phải trải qua nhiều vòng tra cứu DNS, đàm phán nội dung, v.v. Ngoài ra, các trình duyệt hiện đại không chia sẻ cache giữa các origin khác nhau cho cùng một tài nguyên vì lý do bảo mật, vì vậy người dùng phải tải xuống cùng một tài nguyên (ví dụ: jQuery) nhiều lần trên các trang web khác nhau.

## Xem thêm

- [Tự lưu trữ tài nguyên tĩnh của bạn](https://csswizardry.com/2019/05/self-host-your-static-assets/) bởi Harry Roberts (2019)
