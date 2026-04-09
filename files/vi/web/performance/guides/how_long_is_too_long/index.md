---
title: "Khuyến nghị thời gian hiệu năng web: Bao lâu thì là quá lâu?"
short-title: Bao lâu thì là quá lâu?
slug: Web/Performance/Guides/How_long_is_too_long
page-type: guide
sidebar: performancesidebar
---

Không có quy tắc rõ ràng nào về việc thế nào là tốc độ chậm khi tải trang, nhưng có những hướng dẫn cụ thể để chỉ ra rằng nội dung sẽ tải trong 1 giây, trạng thái nhàn rỗi trong 50ms, hoạt ảnh trong 16,7ms và phản hồi đầu vào của người dùng trong 50 đến 200ms.

## Mục tiêu tải

Mốc "dưới một giây" thường được coi là tối ưu cho việc tải, nhưng điều đó có nghĩa là gì? Một giây nên được xem là giới hạn tối đa để báo cho người dùng rằng yêu cầu nội dung mới đã được gửi và sẽ được tải, chẳng hạn như trình duyệt hiển thị tiêu đề trang và màu nền của trang đang hiển thị.

Tài nguyên đầu tiên được lấy từ một yêu cầu thường là tài liệu HTML, sau đó tài liệu này sẽ gọi thêm các tài nguyên khác. Như đã nêu trong phần mô tả về [critical rendering path](/en-US/docs/Web/Performance/Guides/Critical_rendering_path), khi nhận được HTML, trình duyệt sẽ ngay lập tức bắt đầu xử lý HTML, hiển thị nội dung ngay khi nó được nhận thay vì chờ các tài nguyên bổ sung tải xong.

Đúng là một giây cho việc tải là một mục tiêu, nhưng đó là thứ ít trang web đạt được. Kỳ vọng thì khác nhau. Một "hello world" trên mạng nội bộ doanh nghiệp có thể được kỳ vọng tải trong vài mili giây, còn một người dùng đang tải video mèo trên một thiết bị 5 năm tuổi qua mạng biên ở phía bắc Siberia có thể sẽ thấy một lượt tải 20 giây là nhanh. Nếu bạn chờ ba hoặc bốn giây mà không cho người dùng biết rằng quá trình tải đang diễn ra và không hiển thị tiến độ nào, trang web thông thường sẽ mất đi những khách truy cập tiềm năng, và những người đó sẽ mất rất lâu mới quay lại nếu họ có quay lại.

Khi tối ưu hiệu năng, hãy đặt một mục tiêu tải đầu tiên đầy tham vọng, chẳng hạn 5 giây trên mạng di động 3G và 1,5 giây trên đường truyền văn phòng T1, với các mục tiêu tải trang sau đó còn tham vọng hơn nữa, tận dụng service worker và bộ nhớ đệm. Có các mốc thời gian được gợi ý khác nhau cho việc tải ban đầu, tải tài nguyên bổ sung, phản hồi tương tác của người dùng và bảo đảm hoạt ảnh mượt mà:

## Mục tiêu nhàn rỗi

Trình duyệt chỉ có một luồng chính (mặc dù có hỗ trợ các luồng nền cho web worker). Điều này có nghĩa là tương tác người dùng, vẽ và thực thi script đều nằm trên cùng một luồng. Nếu luồng đó đang bận thực thi JavaScript phức tạp, luồng chính sẽ không sẵn sàng phản hồi đầu vào của người dùng, chẳng hạn như nhấn nút. Vì lý do này, việc thực thi script nên được giới hạn phạm vi, chia thành các khối mã có thể thực thi trong 50ms hoặc ít hơn. Điều này giúp luồng sẵn sàng cho tương tác của người dùng.

## Mục tiêu hoạt ảnh

Để cuộn và các hoạt ảnh khác trông mượt và có cảm giác phản hồi tốt, việc vẽ lại nội dung nên xảy ra ở 60 khung hình mỗi giây (60fps), tức là mỗi 16,7ms một lần. 16,7 mili giây này bao gồm scripting, reflow và repaint. Hãy nhận ra rằng một tài liệu mất khoảng 6ms để dựng một khung hình, để lại khoảng 10ms cho phần còn lại. Bất cứ thứ gì thấp hơn 60fps, đặc biệt là tốc độ khung hình không đều hoặc thay đổi, sẽ trông giật.

## Mục tiêu phản hồi

Khi người dùng tương tác với nội dung, điều quan trọng là cung cấp phản hồi và xác nhận hành động hoặc tương tác của họ trong vòng 100ms, tốt nhất là trong 50ms. 50ms tạo cảm giác gần như tức thì. Việc xác nhận tương tác của người dùng thường nên có cảm giác ngay lập tức, chẳng hạn như hiệu ứng hover hoặc nhấn nút, nhưng điều đó không có nghĩa là phản hồi hoàn chỉnh phải xảy ra tức thì. Một phản hồi chậm hơn 100ms có thể tạo ra cảm giác ngắt quãng giữa tương tác và phản hồi, nhưng một chuyển đổi từ 100 đến 200ms cho phản hồi có thể giúp người dùng nhận ra rằng tương tác của họ đã kích hoạt phản hồi, chẳng hạn như một menu mở ra. Nếu một phản hồi mất hơn 100ms để hoàn tất, hãy cung cấp một hình thức phản hồi nào đó để cho người dùng biết rằng tương tác đã diễn ra.
