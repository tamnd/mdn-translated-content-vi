---
title: Tính minh bạch của chứng chỉ
slug: Web/Security/Defenses/Certificate_Transparency
page-type: guide
sidebar: security
---

**Certificate Transparency** là một khuôn khổ mở được thiết kế để bảo vệ chống lại và giám sát việc cấp chứng chỉ sai. Với certificate transparency, các chứng chỉ mới được cấp sẽ được "ghi nhật ký" vào các _CT logs_ do cộng đồng vận hành và thường độc lập, những nhật ký này duy trì một bản ghi bất biến, được đảm bảo bằng mật mã, về các chứng chỉ TLS đã được cấp.

Theo cách này, các tổ chức cấp chứng chỉ (CA) có thể chịu sự giám sát và xem xét của công chúng ở mức cao hơn nhiều. Các chứng chỉ có khả năng độc hại, chẳng hạn như những chứng chỉ vi phạm _Baseline Requirements_ của CA/B Forum, có thể được phát hiện và thu hồi nhanh hơn nhiều. Các nhà cung cấp trình duyệt và người duy trì kho gốc cũng có thể đưa ra các quyết định sáng suốt hơn đối với những CA có vấn đề mà họ có thể quyết định không còn tin cậy.

## Bối cảnh

CT logs được xây dựng trên nền tảng cấu trúc dữ liệu _Merkle tree_. Các nút được gắn nhãn bằng các _hàm băm mật mã_ của các nút con của chúng. Các nút lá chứa các hàm băm của dữ liệu thực tế. Vì vậy, nhãn của nút gốc phụ thuộc vào tất cả các nút khác trong cây.

Trong ngữ cảnh của certificate transparency, dữ liệu được các nút lá băm chính là những chứng chỉ đã được các CA khác nhau đang hoạt động ngày nay cấp ra. Việc bao gồm chứng chỉ có thể được xác minh thông qua một _audit proof_, có thể được tạo và xác minh hiệu quả trong thời gian O(log n) theo cấp số logarit.

Certificate transparency ban đầu xuất hiện vào năm 2013 trong bối cảnh các vụ xâm phạm CA (vụ tấn công DigiNotar năm 2011), các quyết định đáng ngờ (sự cố CA gốc phụ thuộc Trustwave năm 2012) và các vấn đề kỹ thuật trong việc cấp chứng chỉ (DigiCert Sdn Bhd của Malaysia cấp chứng chỉ yếu với độ dài khóa 512-bit).

## Triển khai

Khi chứng chỉ được gửi đến một CT log, một _signed certificate timestamp_ (SCT) sẽ được tạo và trả về. Điều này đóng vai trò như bằng chứng rằng chứng chỉ đã được gửi và sẽ được thêm vào nhật ký.

Đặc tả nêu rằng các máy chủ tuân thủ _phải_ cung cấp một số SCT này cho TLS client khi chúng kết nối. Việc này có thể được thực hiện qua một số cơ chế khác nhau:

- Phần mở rộng chứng chỉ X.509v3 nhúng trực tiếp các signed certificate timestamp vào chứng chỉ lá
- Phần mở rộng TLS có kiểu `signed_certificate_timestamp` được gửi trong quá trình bắt tay
- OCSP stapling (tức phần mở rộng TLS `status_request`) và cung cấp `SignedCertificateTimestampList` với một hoặc nhiều SCT

Với phần mở rộng chứng chỉ X.509, các SCT được đưa vào sẽ do CA phát hành quyết định. Kể từ tháng 6 năm 2021, phần lớn chứng chỉ công khai được tin cậy, đang được dùng tích cực và còn hiệu lực đều chứa dữ liệu minh bạch được nhúng trong phần mở rộng này. Phương pháp này không đòi hỏi phải sửa đổi web server.

Với các phương pháp còn lại, máy chủ cần được cập nhật để gửi dữ liệu bắt buộc. Ưu điểm là người vận hành máy chủ có thể tùy chỉnh các nguồn CT log cung cấp SCT được gửi qua phần mở rộng TLS hoặc phản hồi OCSP đã được stapling.

## Yêu cầu của trình duyệt

Google Chrome 107 trở lên yêu cầu CT log phải bao gồm mọi chứng chỉ được cấp với ngày notBefore sau ngày 30 tháng 4 năm 2018. Người dùng sẽ không thể truy cập các trang sử dụng chứng chỉ TLS không tuân thủ.
Trước đây Chrome chỉ yêu cầu CT bao gồm cho các chứng chỉ _Extended Validation_ (EV) và chứng chỉ do Symantec cấp.

Apple [yêu cầu](https://support.apple.com/en-gb/103214) một số lượng SCT thay đổi tùy trường hợp để Safari và các server khác tin cậy chứng chỉ máy chủ.

Firefox trên máy tính, bắt đầu từ phiên bản 135, và Firefox cho Android, bắt đầu từ phiên bản 145, yêu cầu CT log phải bao gồm mọi chứng chỉ được các tổ chức cấp chứng chỉ trong Chương trình Root CA của Mozilla cấp ra.

## Đặc tả

Các triển khai trình duyệt dựa trên đặc tả đã lỗi thời {{rfc("6962","Certificate Transparency")}} (tháng 1 năm 2025).
Đặc tả hiện tại là {{rfc("9162","Certificate Transparency Version 2.0")}}.

## Xem thêm

- [Chương trình CT log của Apple](https://support.apple.com/en-us/103703)
- [Chính sách CT log của Chrome](https://googlechrome.github.io/CertificateTransparency/log_policy.html)
