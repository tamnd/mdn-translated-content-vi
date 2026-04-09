---
title: Truyền phát âm thanh và video
slug: Web/Media/Guides/Streaming
page-type: guide
sidebar: mediasidebar
---

Trong hướng dẫn này, chúng ta sẽ xem xét các kỹ thuật được dùng để truyền phát media âm thanh và/hoặc video trên web, cũng như cách bạn có thể tối ưu mã nguồn, media, máy chủ và các tùy chọn sử dụng trong quá trình truyền phát để đạt được chất lượng và hiệu năng tốt nhất có thể.

## Giao thức

Ngoài cấu hình của máy chủ và mã truyền phát, đôi khi còn có những giao thức đặc biệt có thể được dùng để tối ưu hiệu năng.

### HTTPS Live Streaming

**HTTPS Live Streaming** (**HLS**) là giao thức do Apple phát triển và được Safari hỗ trợ trên mọi nền tảng của họ. HLS cũng có thể được hỗ trợ trong các môi trường khác, dù trong một số trường hợp sự hỗ trợ này là có điều kiện.

Ví dụ, vì nội dung dành riêng cho thiết bị di động của nhiều website giả định rằng trình duyệt di động hỗ trợ HLS, Firefox cho Android cũng hỗ trợ HLS để tránh những lỗi tương thích kỳ lạ do giả định đó sai. Tuy nhiên, phiên bản Firefox trên máy tính để bàn lại không hỗ trợ HLS.

HLS dùng danh sách phát để cho phép người dùng không chỉ chọn media để truyền phát mà còn chọn giữa các phiên bản hoặc dạng khác nhau của cùng một media. Ví dụ, HLS cho phép máy chủ truyền phát một video có nhiều luồng âm thanh để người dùng chọn ngôn ngữ của mình. Ngoài ra, các biến thể của luồng có thể được cung cấp để tối ưu cho các điều kiện mạng khác nhau. Nhờ vậy, các luồng trực tiếp có thể vừa linh hoạt vừa đạt hiệu năng cao.

Tính đến giữa năm 2017, HLS đã được tiêu chuẩn hóa thành {{RFC(8216)}}.

## Xem thêm

- [Công nghệ media trên web](/en-US/docs/Web/Media)
- [Hướng dẫn về loại và định dạng media trên web](/en-US/docs/Web/Media/Guides/Formats)
- {{HTMLElement("audio")}} và {{HTMLElement("video")}}
