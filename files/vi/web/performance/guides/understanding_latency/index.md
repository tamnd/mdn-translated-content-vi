---
title: Hiểu độ trễ
slug: Web/Performance/Guides/Understanding_latency
page-type: guide
sidebar: performancesidebar
---

**Độ trễ** là thời gian một gói dữ liệu đi từ nguồn đến đích. Về mặt tối ưu hiệu năng, điều quan trọng là tối ưu để giảm các nguyên nhân gây độ trễ và kiểm thử hiệu năng trang web bằng cách mô phỏng độ trễ cao để tối ưu cho những người dùng có kết nối tệ. Bài viết này giải thích độ trễ là gì, nó ảnh hưởng đến hiệu năng như thế nào, cách đo độ trễ và cách giảm nó.

## Độ trễ là gì?

Độ trễ thường được xem là khoảng thời gian từ lúc người dùng gửi yêu cầu đến lúc phản hồi quay trở lại người dùng đó. Trong một yêu cầu đầu tiên, với 14Kb byte đầu tiên, độ trễ dài hơn vì nó bao gồm tra cứu {{glossary('DNS')}}, bắt tay {{glossary('TCP handshake')}}, và thương lượng bảo mật {{glossary('TLS')}}. Các yêu cầu tiếp theo sẽ có độ trễ ít hơn vì kết nối tới máy chủ đã được thiết lập.

Độ trễ mô tả lượng chậm trễ trên mạng hoặc kết nối Internet. Độ trễ thấp hàm ý rằng không có hoặc gần như không có chậm trễ. Độ trễ cao hàm ý rằng có nhiều chậm trễ. Một trong những mục tiêu chính của việc cải thiện hiệu năng là giảm độ trễ.

Độ trễ gắn với một tài nguyên đơn lẻ, đặc biệt là một trang HTML cơ bản, có vẻ không đáng kể. Nhưng các trang web thường liên quan đến nhiều yêu cầu: HTML bao gồm các yêu cầu cho nhiều tệp CSS, script và media. Số lượng và kích thước của những yêu cầu này càng lớn, tác động của độ trễ cao lên trải nghiệm người dùng càng lớn.

Trên một kết nối có độ trễ thấp, các tài nguyên được yêu cầu sẽ xuất hiện gần như ngay lập tức. Trên một kết nối có độ trễ cao, sẽ có một khoảng trễ rõ ràng giữa thời điểm yêu cầu được gửi và thời điểm tài nguyên được trả về. Chúng ta có thể xác định mức độ trễ bằng cách đo tốc độ mà dữ liệu di chuyển từ một vị trí mạng sang vị trí khác.

Độ trễ có thể được đo theo một cách, ví dụ, thời gian cần để gửi một yêu cầu tài nguyên, hoặc toàn bộ vòng quay khứ hồi từ yêu cầu của trình duyệt tới tài nguyên cho đến khi tài nguyên được yêu cầu đến trình duyệt.

## Giới hạn mạng

Để mô phỏng độ trễ của một mạng băng thông thấp, bạn có thể dùng công cụ dành cho nhà phát triển và chuyển sang một kết nối mạng thấp hơn.

![Mô phỏng độ trễ bằng cách mô phỏng throttling](emulate_latency.png)

Trong công cụ dành cho nhà phát triển, ở bảng mạng, bạn có thể chuyển tùy chọn throttling sang 2G, 3G, v.v. Các công cụ nhà phát triển của trình duyệt khác nhau có các tùy chọn mặc định khác nhau, các đặc tính được mô phỏng bao gồm tốc độ tải xuống, tốc độ tải lên và độ trễ tối thiểu, hoặc thời gian tối thiểu cần để gửi một gói dữ liệu. Các giá trị gần đúng của một số thiết lập sẵn bao gồm:

| Lựa chọn       | Tốc độ tải xuống | Tốc độ tải lên | Độ trễ tối thiểu (ms) |
| -------------- | ---------------- | -------------- | --------------------- |
| GPRS           | 50 kbps          | 20 kbps        | 500                   |
| Regular 2G     | 250 kbps         | 50 kbps        | 300                   |
| Good 2G        | 450 kbps         | 150 kbps       | 150                   |
| Regular 3G     | 750 kbps         | 250 kbps       | 100                   |
| Good 3G        | 1.5 Mbps         | 750 kbps       | 40                    |
| Regular 4G/LTE | 4 Mbps           | 3 Mbps         | 20                    |
| DSL            | 2 Mbps           | 1 Mbps         | 5                     |
| Wi-Fi          | 30 Mbps          | 15 Mbps        | 2                     |

## Thời gian mạng

Cũng trong tab mạng, bạn có thể thấy mỗi yêu cầu mất bao lâu để hoàn tất. Chúng ta có thể xem một tài sản hình ảnh SVG kích thước 267,5Kb mất bao lâu để tải xuống.

![Thời gian cần để một tài sản SVG lớn tải xong.](latencymlw.png)

Khi một yêu cầu nằm trong hàng đợi, đang chờ một kết nối mạng, nó được xem là **bị chặn**. Việc chặn xảy ra khi có quá nhiều kết nối đồng thời đến một máy chủ duy nhất qua HTTP. Nếu tất cả kết nối đang được dùng hết, trình duyệt không thể tải thêm tài nguyên cho đến khi một kết nối được giải phóng, nghĩa là các yêu cầu và tài nguyên đó bị chặn.

**Phân giải DNS** là thời gian cần để thực hiện tra cứu {{glossary('DNS')}}. Số lượng [hostname](/en-US/docs/Web/API/URL/hostname) càng nhiều thì càng cần thực hiện nhiều tra cứu DNS hơn.

**Connecting** là thời gian cần để một {{glossary('TCP handshake')}} hoàn tất. Giống như DNS, số lượng kết nối máy chủ cần thiết càng lớn thì càng mất nhiều thời gian để tạo các kết nối máy chủ.

**{{glossary('TLS')}} handshake** là thời gian để thiết lập một kết nối an toàn. Mặc dù TLS handshake mất nhiều thời gian hơn so với kết nối không an toàn, nhưng thời gian bổ sung cần thiết cho một kết nối an toàn là xứng đáng.

**Sending** là thời gian cần để gửi yêu cầu HTTP tới máy chủ.

**Waiting** là độ trễ đĩa, thời gian để máy chủ hoàn tất phản hồi của nó. Độ trễ đĩa từng là khu vực đáng lo ngại chính về hiệu năng. Tuy nhiên, hiệu năng máy chủ đã được cải thiện khi bộ nhớ máy tính hoặc CPU cải thiện. Tùy thuộc vào độ phức tạp của những gì cần từ máy chủ, đây vẫn có thể là một vấn đề.

**Receiving** là thời gian cần để tải xuống tài nguyên. Thời gian nhận được quyết định bởi sự kết hợp giữa năng lực mạng và kích thước tệp tài nguyên. Nếu hình ảnh đã được lưu trong bộ nhớ đệm, điều này sẽ gần như ngay lập tức. Nếu đã throttling, thời gian nhận có thể là 43 giây!

## Đo độ trễ

**Độ trễ mạng** là thời gian cần để một yêu cầu dữ liệu đi từ máy tính gửi yêu cầu đến máy tính phản hồi. Bao gồm cả thời gian cần để một byte dữ liệu đi từ máy tính phản hồi trở lại máy tính yêu cầu. Nó thường được đo như một độ trễ khứ hồi.

**Độ trễ đĩa** là thời gian từ lúc một máy tính, thường là máy chủ, nhận được yêu cầu, đến lúc máy tính trả về phản hồi.
