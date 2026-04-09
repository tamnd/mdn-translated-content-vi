---
title: Tối ưu hiệu năng khởi động
slug: Web/Performance/Guides/Optimizing_startup_performance
page-type: guide
sidebar: performancesidebar
---

Cải thiện hiệu năng khởi động thường là một trong những tối ưu hóa hiệu năng có giá trị cao nhất mà bạn có thể thực hiện. Ứng dụng của bạn mất bao lâu để khởi động? Nó có vẻ như làm treo thiết bị hoặc trình duyệt của người dùng trong lúc tải không? Điều đó khiến người dùng lo rằng ứng dụng của bạn đã bị treo hoặc có vấn đề khác. Trải nghiệm người dùng tốt bao gồm việc bảo đảm ứng dụng của bạn tải nhanh. Bài viết này cung cấp các mẹo và gợi ý hiệu năng cho cả việc viết ứng dụng mới lẫn chuyển ứng dụng từ các nền tảng khác lên web.

## Tải không đồng bộ nhanh

Bất kể nền tảng nào, việc khởi động càng **nhanh** càng tốt luôn là một ý hay. Vì đây là vấn đề phổ quát, chúng ta sẽ không tập trung quá nhiều vào nó ở đây. Thay vào đó, chúng ta sẽ xem xét một vấn đề quan trọng hơn khi xây dựng ứng dụng web: khởi động càng **không đồng bộ** càng tốt. Điều đó có nghĩa là không chạy toàn bộ mã khởi động của bạn trong một trình xử lý sự kiện duy nhất trên luồng chính của ứng dụng.

Thay vào đó, hãy tạo một [Web worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) làm càng nhiều càng tốt trong một luồng nền (ví dụ: tìm nạp và xử lý dữ liệu). Giao việc cho Web worker sẽ giải phóng luồng chính cho các nhiệm vụ cần nó, như sự kiện người dùng và kết xuất UI. Ngược lại, các sự kiện của luồng chính nên bao gồm nhiều tác vụ nhỏ, còn được gọi là [micro tasks](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide/In_depth), thay vì các tác vụ lớn tốn nhiều thời gian hơn.

Tải không đồng bộ giúp ngăn trang và giao diện người dùng trông như không phản hồi, hoặc thực sự trở nên không phản hồi. Bằng cách giảm thiểu thời gian cần cho từng tác vụ tải riêng lẻ, [event loop](/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide/In_depth#event_loops) của ứng dụng sẽ tiếp tục chạy trong khi nó khởi động. Điều này sẽ ngăn ứng dụng, trình duyệt và/hoặc thiết bị trông như bị treo.

Trong trường hợp xấu nhất, việc chặn luồng chính có thể khiến người dùng gỡ cài đặt ứng dụng của bạn; ví dụ, nếu ai đó khởi chạy ứng dụng của bạn do nhầm lẫn và họ không thể đóng ứng dụng, họ có thể muốn làm gì đó để sự cố đó không lặp lại.

## Nếu có ý chí…

Sẽ dễ hơn nhiều nếu viết mọi thứ theo cách "đúng" ngay từ đầu thay vì phải cải tạo lại để phục vụ hiệu năng (và khả năng truy cập). Khi bạn bắt đầu từ đầu, việc làm cho các phần mã phù hợp trở nên bất đồng bộ có nghĩa là không cần một đợt cải tạo sau đó. Tất cả các phép tính khởi động thuần túy nên được thực hiện trong các luồng nền, trong khi thời gian chạy của các sự kiện trên luồng chính phải càng ngắn càng tốt. Thay vì thêm một chỉ báo tiến trình để người dùng biết chuyện gì đang xảy ra và họ sẽ phải chờ bao lâu, hãy làm cho thanh tiến trình trở nên không cần thiết.

Mặt khác, việc chuyển một ứng dụng hiện có lên Web có thể đầy thách thức. Ứng dụng gốc không cần được viết theo cách bất đồng bộ vì hệ điều hành thường xử lý việc tải cho bạn. Ứng dụng nguồn có thể có một vòng lặp chính có thể dễ dàng được làm cho hoạt động bất đồng bộ (bằng cách chạy riêng từng vòng lặp chính); khởi động thường chỉ là một quy trình liên tục, nguyên khối có thể thỉnh thoảng cập nhật thước đo tiến trình.

Mặc dù bạn có thể dùng [Web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) để chạy ngay cả các khối mã [JavaScript](/en-US/docs/Web/JavaScript) rất lớn, kéo dài lâu một cách bất đồng bộ, nhưng có một lưu ý lớn: Web worker không thể trực tiếp thao tác [DOM](/en-US/docs/Web/API/Document_Object_Model) và có quyền truy cập hạn chế vào các phương thức và thuộc tính của đối tượng [window](/en-US/docs/Web/API/Window), bao gồm không có quyền truy cập vào [WebGL](/en-US/docs/Web/API/WebGL_API). Điều này có nghĩa là trừ khi bạn có thể dễ dàng tách các khối "tính toán thuần" trong quy trình khởi động của mình vào worker, bạn sẽ phải chạy phần lớn hoặc toàn bộ mã khởi động trên luồng chính.

Tuy nhiên, ngay cả loại mã đó cũng có thể được làm bất đồng bộ, nếu bỏ chút công sức.

## Làm bất đồng bộ

Dưới đây là một số gợi ý về cách xây dựng quy trình khởi động của bạn để nó càng bất đồng bộ càng tốt, bất kể đó là ứng dụng mới hay được chuyển port:

- Dùng thuộc tính [`defer`](/en-US/docs/Web/HTML/Reference/Elements/script#defer) hoặc [`async`](/en-US/docs/Web/HTML/Reference/Elements/script#async) trên các thẻ script mà ứng dụng web cần. Điều này cho phép trình phân tích HTML tiếp tục xử lý tài liệu thay vì phải chờ các script được tải xuống và thực thi xong mới tiếp tục.
- Nếu bạn cần giải mã các tệp tài nguyên (ví dụ: giải mã các tệp JPEG và biến chúng thành dữ liệu texture thô để dùng sau cho WebGL), thì đó là việc rất phù hợp để làm trong worker.
- Khi xử lý dữ liệu đã được trình duyệt hỗ trợ (ví dụ: giải mã dữ liệu hình ảnh), hãy dùng các bộ giải mã tích hợp sẵn trong trình duyệt hoặc thiết bị thay vì tự làm hoặc dùng bộ giải mã từ codebase gốc. Bộ được cung cấp gần như chắc chắn sẽ nhanh hơn đáng kể, và còn giảm kích thước ứng dụng của bạn. Ngoài ra, trình duyệt có thể tự động song song hóa các bộ giải mã này.
- Bất kỳ xử lý dữ liệu nào có thể song song hóa thì nên làm như vậy. Đừng xử lý từng khối dữ liệu lần lượt; hãy xử lý chúng cùng lúc khi có thể!
- Đừng đưa các script hoặc stylesheet không tham gia vào [critical rendering path](/en-US/docs/Web/Performance/Guides/Critical_rendering_path) vào tệp HTML khởi động của bạn. Chỉ tải chúng khi cần.
- Giảm kích thước các tệp JavaScript của bạn. Hãy cố gắng gửi phiên bản đã minify của tệp đến trình duyệt và dùng nén như Gzip hoặc Brotli.
- Tận dụng resource hints (như preconnect hoặc preload) bất cứ khi nào có thể để chỉ ra cho trình duyệt biết những tệp nào quan trọng hơn với ứng dụng của bạn.

Càng làm được nhiều việc bất đồng bộ, ứng dụng của bạn càng tận dụng tốt hơn các bộ xử lý đa nhân.

### Vấn đề khi chuyển port

Khi việc tải ban đầu đã xong và mã chính của ứng dụng bắt đầu chạy, có thể ứng dụng của bạn phải là đơn luồng, đặc biệt nếu đó là một bản chuyển port. Điều quan trọng nhất cần làm để hỗ trợ quy trình khởi động của mã chính là tái cấu trúc mã thành các phần nhỏ. Sau đó chúng có thể được thực thi theo từng khối xen kẽ qua nhiều lần gọi đến vòng lặp chính của ứng dụng (để luồng chính có thể xử lý đầu vào và những việc tương tự).

Emscripten cung cấp một API để giúp việc tái cấu trúc này; ví dụ, bạn có thể dùng `emscripten_push_main_loop_blocker()` để thiết lập một hàm sẽ được thực thi trước khi luồng chính được phép tiếp tục. Bằng cách thiết lập một hàng đợi các hàm được gọi theo trình tự, bạn có thể dễ dàng quản lý việc chạy từng phần mã mà không chặn luồng chính.

Tuy nhiên, điều đó vẫn để lại vấn đề phải tái cấu trúc mã hiện có của bạn để thực sự hoạt động theo cách đó. Việc đó có thể mất một chút thời gian.

### Tôi nên làm bất đồng bộ đến mức nào?

Trang web của bạn càng sớm có thể dùng được và càng phản hồi tốt hơn với đầu vào của người dùng, thì nó càng được cảm nhận là tốt hơn.
Một trang mất 1 hoặc 2 giây trước khi nội dung đầu tiên xuất hiện thường được xem là nhanh; nếu bạn quen với các trang mất 3 hoặc 4 giây, thì 7 hoặc 8 giây sẽ có cảm giác rất lâu.

Về khả năng phản hồi, người dùng sẽ không nhận thấy độ trễ 50ms hoặc ít hơn. Bất kỳ độ trễ nào trên 200ms, người dùng sẽ cảm nhận trang của bạn là chậm chạp. Khi làm việc để cải thiện khả năng tải và phản hồi của ứng dụng, hãy nhớ rằng nhiều người dùng của bạn có thể có máy tính cũ và chậm hơn bạn, họ có thể trải qua độ trễ lâu hơn bạn!

## Các gợi ý khác

Còn nhiều điều khác ngoài việc chuyển sang bất đồng bộ có thể giúp bạn cải thiện thời gian khởi động ứng dụng. Dưới đây là một vài điều:

- Thời gian tải xuống
  - : Hãy lưu ý người dùng sẽ mất bao lâu để tải xuống dữ liệu của ứng dụng. Nếu ứng dụng của bạn rất phổ biến, hoặc phải tải lại nội dung thường xuyên, bạn nên cố gắng có máy chủ lưu trữ nhanh nhất có thể. Luôn [nén](/en-US/docs/Glossary/gzip_compression) dữ liệu của bạn để làm nó nhỏ nhất có thể.
- Kích thước dữ liệu
  - : Hãy làm tốt nhất có thể để tối ưu kích thước dữ liệu; các tệp level nhỏ hơn sẽ tải xuống và được xử lý nhanh hơn các tệp lớn hơn.
- Yếu tố chủ quan
  - : Bất cứ điều gì bạn có thể làm để giữ người dùng gắn kết trong quá trình khởi động sẽ giúp họ cảm thấy thời gian trôi nhanh hơn. Hiển thị một màn hình splash giả có thể cải thiện [perceived performance](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance). Với các trang nặng, bất cứ điều gì bạn làm để giúp người dùng cảm thấy ứng dụng đang làm gì đó thay vì chỉ ngồi im lặng đều hữu ích.

## Xem thêm

- [Ứng dụng](/en-US/docs/Web/Progressive_web_apps)
- [Trò chơi](/en-US/docs/Games)
- [Trải nghiệm khởi động BananaBread (hoặc bất kỳ codebase biên dịch nào)](https://mozakai.blogspot.com/2012/07/bananabread-or-any-compiled-codebase.html) (2012)
