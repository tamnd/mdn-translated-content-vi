---
title: Hiệu năng web
short-title: Performance
slug: Web/Performance
page-type: landing-page
sidebar: performancesidebar
---

Hiệu năng web là các phép đo khách quan và trải nghiệm cảm nhận của người dùng về thời gian tải và thời gian chạy.
Hiệu năng web là khoảng thời gian một trang web mất để tải xong, trở nên tương tác và phản hồi được, cũng như mức độ mượt mà của nội dung trong quá trình người dùng tương tác.
Các vấn đề về hiệu năng bao gồm những câu hỏi như: việc cuộn có mượt không? Các nút bấm có phản hồi không? Các cửa sổ bật lên có tải nhanh và hoạt ảnh có trôi chảy không?
Các phép đo khách quan bao gồm thời gian tải, số khung hình mỗi giây và thời gian để trở nên tương tác, còn trải nghiệm chủ quan là cảm giác nội dung mất bao lâu để tải xong.

Trang web càng lâu phản hồi thì người dùng càng có xu hướng rời đi.
Điều quan trọng là phải giảm thiểu thời gian tải và thời gian phản hồi, đồng thời thêm các tính năng phụ để che giấu độ trễ bằng cách làm cho trải nghiệm sẵn sàng và tương tác nhiều nhất có thể, càng sớm càng tốt, trong khi các phần ít quan trọng hơn của trải nghiệm được tải không đồng bộ ở phía sau.

Có nhiều công cụ, API và thực hành tốt giúp chúng ta đo lường và cải thiện hiệu năng web.
Chúng ta sẽ đề cập đến chúng trong các trang sau.

## Hướng dẫn về hiệu năng web

[Các hướng dẫn về hiệu năng](/en-US/docs/Web/Performance/Guides) là những tài nguyên mô tả cách trình duyệt hoạt động, những yếu tố ảnh hưởng đến hiệu năng, và cách đo lường, tối ưu hóa, cũng như giám sát hiệu năng trên nhiều khía cạnh của ứng dụng.

- [Kiến thức nền tảng về hiệu năng](/en-US/docs/Web/Performance/Guides/Fundamentals)
  - : Hiệu năng nghĩa là tính hiệu quả. Trong bối cảnh các ứng dụng Open Web, tài liệu này giải thích một cách tổng quát hiệu năng là gì, nền tảng trình duyệt giúp cải thiện nó như thế nào, và bạn có thể dùng những công cụ cùng quy trình nào để kiểm thử và cải thiện nó.
- [Đổ nội dung cho trang: trình duyệt hoạt động như thế nào](/en-US/docs/Web/Performance/Guides/How_browsers_work)
  - : Người dùng muốn trải nghiệm web có nội dung tải nhanh và tương tác mượt. Vì vậy, nhà phát triển nên nỗ lực đạt được hai mục tiêu này.
    Để hiểu cách cải thiện hiệu năng và hiệu năng cảm nhận, điều hữu ích là hiểu trình duyệt hoạt động như thế nào.
- [Hiểu về độ trễ](/en-US/docs/Web/Performance/Guides/Understanding_latency)
  - : **Độ trễ** là thời gian một gói dữ liệu đi từ nguồn đến đích. Về mặt tối ưu hóa hiệu năng, điều quan trọng là tối ưu để giảm các nguyên nhân gây độ trễ và kiểm thử hiệu năng trang web bằng cách mô phỏng độ trễ cao để tối ưu cho người dùng có kết nối chậm hoặc không ổn định.
- [Các mốc thời gian hiệu năng web được khuyến nghị: bao lâu là quá lâu?](/en-US/docs/Web/Performance/Guides/How_long_is_too_long)
  - : Không có quy tắc cố định rõ ràng nào về việc thế nào là tốc độ chậm khi tải trang, nhưng có những hướng dẫn cụ thể để chỉ ra thời điểm nội dung sẽ tải (1 giây), thời gian nhàn rỗi (50ms), hoạt ảnh (16.7ms) và phản hồi đầu vào của người dùng (50 đến 200ms).
- [Dùng dns-prefetch](/en-US/docs/Web/Performance/Guides/dns-prefetch)
  - : **`DNS-prefetch`** là nỗ lực phân giải tên miền trước khi tài nguyên được yêu cầu. Đó có thể là một tệp sẽ được tải sau hoặc đích của một liên kết mà người dùng cố truy cập.
- [Điều hướng và thời gian tài nguyên](/en-US/docs/Web/Performance/Guides/Navigation_and_resource_timings)
  - : **Định thời điều hướng** là các số đo đo lường sự kiện điều hướng tài liệu của trình duyệt. **Định thời tài nguyên** là các phép đo thời gian mạng chi tiết liên quan đến việc tải tài nguyên của một ứng dụng. Cả hai đều cung cấp cùng các thuộc tính chỉ đọc, nhưng định thời điều hướng đo thời gian của tài liệu chính, còn định thời tài nguyên cung cấp thời gian cho mọi tài nguyên hoặc tài sản mà tài liệu chính đó gọi tới và các tài nguyên mà những tài nguyên đó yêu cầu.
- [Tối ưu hóa hiệu năng khởi động](/en-US/docs/Web/Performance/Guides/Optimizing_startup_performance)
  - : Cải thiện hiệu năng khởi động thường là một trong những tối ưu hóa mang lại giá trị cao nhất có thể thực hiện.
    Trải nghiệm người dùng tốt bao gồm việc bảo đảm ứng dụng tải nhanh. Bài viết này cung cấp các mẹo và gợi ý về hiệu năng cho cả việc viết ứng dụng mới lẫn chuyển ứng dụng từ các nền tảng khác lên web.
- [Đường dẫn kết xuất quan trọng](/en-US/docs/Web/Performance/Guides/Critical_rendering_path)
  - : Đường dẫn kết xuất quan trọng là chuỗi các bước mà trình duyệt đi qua để chuyển HTML, CSS và JavaScript thành các pixel trên màn hình. Tối ưu đường dẫn kết xuất quan trọng sẽ cải thiện hiệu năng hiển thị.
    Đường dẫn kết xuất quan trọng bao gồm [Document Object Model](/en-US/docs/Web/API/Document_Object_Model) (DOM), [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) (CSSOM), cây hiển thị và bố cục.
- [Tải lười](/en-US/docs/Web/Performance/Guides/Lazy_loading)
  - : **Tải lười** là một chiến lược đánh dấu tài nguyên là không chặn (không quan trọng) và chỉ tải chúng khi cần. Đây là cách rút ngắn độ dài của [critical rendering path](/en-US/docs/Web/Performance/Guides/Critical_rendering_path), từ đó giảm thời gian tải trang.
- [Tải suy đoán](/en-US/docs/Web/Performance/Guides/Speculative_loading)
  - : **Tải suy đoán** là thực hành thực hiện các hành động điều hướng, như tra cứu DNS, tìm nạp tài nguyên hoặc dựng tài liệu, trước khi các trang liên quan thực sự được truy cập, dựa trên dự đoán về trang nào người dùng có khả năng truy cập tiếp theo cao nhất.
- [Ngân sách hiệu năng](/en-US/docs/Web/Performance/Guides/Performance_budgets)
  - : Ngân sách hiệu năng là một giới hạn để ngăn chặn thoái hóa. Nó có thể áp dụng cho một tệp, một loại tệp, toàn bộ tệp được tải trên một trang, một chỉ số cụ thể, ví dụ [Time to Interactive](/en-US/docs/Glossary/Time_to_interactive), một chỉ số tùy chỉnh, ví dụ Time to Hero Element, hoặc một ngưỡng trong một khoảng thời gian.
- [Giám sát hiệu năng: RUM so với giám sát tổng hợp](/en-US/docs/Web/Performance/Guides/Rum-vs-Synthetic)
  - : **Giám sát tổng hợp** và **giám sát người dùng thực (RUM)** là hai cách tiếp cận để giám sát và cung cấp thông tin chi tiết về hiệu năng web. RUM và giám sát tổng hợp cung cấp những góc nhìn khác nhau về hiệu năng và có các lợi ích, trường hợp sử dụng tốt và hạn chế riêng. RUM thường phù hợp nhất để hiểu xu hướng dài hạn, còn giám sát tổng hợp rất phù hợp cho kiểm thử hồi quy và giảm thiểu các vấn đề hiệu năng ngắn hạn trong quá trình phát triển. Trong bài viết này, chúng ta định nghĩa và so sánh hai cách tiếp cận giám sát hiệu năng này.
- [Hiệu năng hoạt ảnh CSS và JavaScript](/en-US/docs/Web/Performance/Guides/CSS_JavaScript_animation_performance)
  - : Hoạt ảnh là yếu tố quan trọng đối với trải nghiệm người dùng dễ chịu trong nhiều ứng dụng. Có nhiều cách triển khai hoạt ảnh trên web, chẳng hạn hoạt ảnh CSS {{cssxref("transition","transitions")}}/{{cssxref("animation","animations")}} hoặc hoạt ảnh dựa trên JavaScript (dùng {{domxref("Window.requestAnimationFrame","requestAnimationFrame()")}}). Trong bài viết này, chúng ta phân tích sự khác biệt về hiệu năng giữa hoạt ảnh dựa trên CSS và dựa trên JavaScript.
- [Hiệu năng hoạt ảnh và tốc độ khung hình](/en-US/docs/Web/Performance/Guides/Animation_performance_and_frame_rate)
  - : Hoạt ảnh trên web có thể được tạo bằng {{domxref('SVGAnimationElement', 'SVG')}}, {{domxref('Window.requestAnimationFrame','JavaScript')}}, bao gồm {{htmlelement('canvas')}} và {{domxref('WebGL_API', 'WebGL')}}, CSS {{cssxref('animation')}}, {{htmlelement('video')}}, GIF động và thậm chí cả PNG động cùng các loại hình ảnh khác.
    Chi phí hiệu năng của việc tạo hoạt ảnh cho một thuộc tính CSS có thể khác nhau giữa các thuộc tính, và việc tạo hoạt ảnh cho các thuộc tính CSS đắt đỏ có thể dẫn đến {{glossary('Jank')}} khi trình duyệt phải cố gắng đạt được {{glossary("FPS", "tốc độ khung hình")}} mượt mà.

## Bài học cho người mới bắt đầu

Khu vực học tập [Hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance) của MDN chứa các bài học hiện đại, cập nhật về các yếu tố cốt lõi của hiệu năng. Hãy bắt đầu ở đây nếu bạn là người mới với hiệu năng:

- [Cái "vì sao" của hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance/why_web_performance)
  - : Bài viết này bàn về lý do hiệu năng web quan trọng đối với khả năng truy cập, trải nghiệm người dùng và mục tiêu kinh doanh của bạn.
- [Hiệu năng web là gì?](/en-US/docs/Learn_web_development/Extensions/Performance/What_is_web_performance)
  - : Bạn biết hiệu năng web là quan trọng, nhưng những yếu tố nào ảnh hưởng đến hiệu năng web và nó được đo như thế nào? Bài viết này giới thiệu các thành phần của hiệu năng, từ tải và hiển thị trang web, bao gồm cách nội dung của bạn đi vào trình duyệt của người dùng để được xem, đến những nhóm người nào chúng ta cần cân nhắc khi nghĩ về hiệu năng.
- [Người dùng cảm nhận hiệu năng như thế nào?](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance)
  - : Quan trọng hơn việc website của bạn nhanh đến mức nào tính bằng mili giây là việc người dùng cảm nhận nó nhanh đến đâu. Những cảm nhận này bị ảnh hưởng bởi thời gian tải trang thực tế, thời gian nhàn rỗi, độ phản hồi với tương tác người dùng, và mức độ mượt của việc cuộn cùng các hoạt ảnh khác. Trong bài viết này, chúng ta thảo luận các chỉ số tải, hoạt ảnh và phản hồi, cùng với các thực hành tốt nhất để cải thiện cảm nhận của người dùng, ngay cả khi thời gian thực tế không thay đổi.
- [Đo lường hiệu năng](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance)
  - : Giờ bạn đã hiểu một vài chỉ số hiệu năng, chúng ta sẽ đi sâu hơn vào các công cụ, chỉ số và API hiệu năng, và cách đưa hiệu năng vào quy trình phát triển web.
- [Đa phương tiện: hình ảnh](/en-US/docs/Learn_web_development/Extensions/Performance/Multimedia)
  - : Món lợi lớn nhất của hiệu năng web thường là tối ưu hóa media. Có thể phục vụ các tệp media khác nhau dựa trên khả năng, kích thước và mật độ điểm ảnh của từng user agent. Trong bài viết này chúng ta bàn về tác động của hình ảnh đến hiệu năng và các phương pháp giảm số byte được gửi cho mỗi hình ảnh.
- [Đa phương tiện: video](/en-US/docs/Learn_web_development/Extensions/Performance/video)
  - : Món lợi lớn nhất của hiệu năng web thường là tối ưu hóa media. Trong bài viết này chúng ta bàn về tác động của nội dung video đến hiệu năng, và đề cập các mẹo như gỡ track âm thanh khỏi video nền có thể cải thiện hiệu năng.
- [Tối ưu hóa hiệu năng JavaScript](/en-US/docs/Learn_web_development/Extensions/Performance/JavaScript)
  - : JavaScript, khi được dùng đúng cách, có thể cho phép tạo ra các trải nghiệm web tương tác và nhập vai hoặc cũng có thể làm hại đáng kể thời gian tải xuống, thời gian hiển thị, hiệu năng trong ứng dụng, thời lượng pin và trải nghiệm người dùng. Bài viết này nêu ra một số thực hành tốt nhất về JavaScript nên được cân nhắc để bảo đảm ngay cả nội dung phức tạp cũng đạt hiệu năng cao nhất có thể.
- [Tối ưu hóa hiệu năng HTML](/en-US/docs/Learn_web_development/Extensions/Performance/HTML)
  - : Một số thuộc tính và thứ tự nguồn của markup có thể ảnh hưởng đến hiệu năng của website. Bằng cách giảm số nút DOM, bảo đảm thứ tự và thuộc tính tốt nhất được dùng để đưa vào các nội dung như kiểu, script, media và script của bên thứ ba, bạn có thể cải thiện đáng kể trải nghiệm người dùng. Bài viết này xem xét chi tiết cách HTML có thể được dùng để bảo đảm hiệu năng tối đa.
- [Tối ưu hóa hiệu năng CSS](/en-US/docs/Learn_web_development/Extensions/Performance/CSS)
  - : CSS có thể là một trọng tâm tối ưu hóa ít quan trọng hơn để cải thiện hiệu năng, nhưng có một số tính năng CSS ảnh hưởng đến hiệu năng nhiều hơn các tính năng khác. Trong bài viết này chúng ta xem xét một số thuộc tính CSS có ảnh hưởng đến hiệu năng và các cách xử lý kiểu được đề xuất để bảo đảm hiệu năng không bị ảnh hưởng tiêu cực.
- [Lập luận kinh doanh cho hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance/business_case_for_performance)
  - : Có rất nhiều việc nhà phát triển có thể làm để cải thiện hiệu năng, nhưng nhanh đến mức nào là đủ nhanh? Làm sao bạn thuyết phục được những người có thẩm quyền về tầm quan trọng của các nỗ lực này? Khi đã tối ưu xong, làm sao bạn bảo đảm sự cồng kềnh không quay trở lại? Trong bài viết này chúng ta xem xét cách thuyết phục quản lý, xây dựng văn hóa hiệu năng và ngân sách hiệu năng, đồng thời giới thiệu các cách để bảo đảm các thoái hóa không lén vào mã nguồn của bạn.
- [Các thực hành và mẹo hay nhất về hiệu năng web](/en-US/docs/Learn_web_development/Extensions/Performance/Best_practices)
  - : Bài viết này bao quát một số chủ đề ở mức cơ bản và cung cấp liên kết đến các bài đi sâu hơn để cải thiện hiệu năng cho từng chủ đề. Ngoài các chủ đề front-end như HTML, CSS, JavaScript và tệp media, nó cũng đề cập đến API, công cụ dành cho nhà phát triển, thực hành tốt nhất và các thực hành xấu liên quan đến hiệu năng web.

## API hiệu năng

[Performance API](/en-US/docs/Web/API/Performance_API) là một nhóm tiêu chuẩn dùng để đo hiệu năng của các ứng dụng web.
Các trang sau cung cấp cái nhìn tổng quan về các API hiệu năng, bao gồm thông tin về cách sử dụng chúng:

- [Định thời chính xác cao](/en-US/docs/Web/API/Performance_API/High_precision_timing)
  - : Performance API cho phép đo lường chính xác cao dựa trên thời gian với độ phân giải có thể xuống dưới mili giây và một đồng hồ đơn điệu ổn định không bị ảnh hưởng bởi lệch hoặc điều chỉnh đồng hồ hệ thống.
    Bộ hẹn giờ độ phân giải cao là cần thiết cho việc benchmark chính xác thay vì các mốc thời gian {{jsxref("Date")}} kém chính xác và không đơn điệu.
- [Định thời khung hình hoạt ảnh dài](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
  - : **Khung hình hoạt ảnh dài** (LoAF) có thể ảnh hưởng đến trải nghiệm người dùng của một website.
    Chúng có thể gây ra các lần cập nhật giao diện người dùng (UI) chậm, dẫn đến các điều khiển có vẻ không phản hồi và các hiệu ứng hoạt ảnh cũng như cuộn bị {{glossary('Jank')}} (hoặc không mượt), làm người dùng khó chịu.
    [Long Animation Frames API](https://w3c.github.io/long-animation-frames/) cho phép nhà phát triển lấy thông tin về các khung hình hoạt ảnh dài và hiểu rõ hơn nguyên nhân gốc rễ của chúng. Bài viết này cho thấy cách dùng Long Animation Frames API.
- [Theo dõi các lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
  - : Thuộc tính {{domxref("PerformanceNavigationTiming.notRestoredReasons")}} báo cáo thông tin về lý do tại sao tài liệu hiện tại bị chặn không dùng được {{Glossary("bfcache")}} khi điều hướng.
    Nhà phát triển có thể dùng thông tin này để xác định các trang cần cập nhật nhằm tương thích với bfcache, qua đó cải thiện hiệu năng trang web.
- [Định thời điều hướng](/en-US/docs/Web/API/Performance_API/Navigation_timing)
  - : Định thời điều hướng cung cấp các chỉ số gắn với việc điều hướng từ trang này sang trang khác thông qua API [PerformanceNavigationTiming](/en-US/docs/Web/API/PerformanceNavigationTiming).
    Ví dụ, bạn có thể xác định mất bao lâu để tải hoặc dỡ tải một tài liệu, hoặc ghi lại thời gian cho đến khi việc xây dựng {{Glossary("DOM")}} hoàn tất và có thể tương tác với DOM.
- [Dữ liệu hiệu năng](/en-US/docs/Web/API/Performance_API/Performance_data)
  - : Performance API không cung cấp phân tích dữ liệu hiệu năng hay biểu đồ trực quan.
    Tuy nhiên, Performance API tích hợp tốt với công cụ dành cho nhà phát triển và dữ liệu của nó thường được gửi tới các điểm cuối phân tích cùng các thư viện để ghi lại các chỉ số hiệu năng giúp bạn đánh giá dữ liệu và tìm ra các nút nghẽn hiệu năng ảnh hưởng tới người dùng.
    Trang này cung cấp cái nhìn tổng quan về những loại dữ liệu Performance API tồn tại, cách chúng được thu thập và cách truy cập chúng.
- [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing)
  - : Định thời tài nguyên cho phép truy xuất và phân tích dữ liệu thời gian mạng chi tiết cho việc tải tài nguyên của một ứng dụng.
    Ứng dụng có thể dùng các chỉ số thời gian này để xác định, ví dụ, khoảng thời gian mất để tải một tài nguyên cụ thể như hình ảnh hoặc script, hoặc là một phần ngầm định của tải trang hoặc được gọi tường minh từ JavaScript, chẳng hạn dùng API {{domxref("Window/fetch", "fetch()")}}.
- [Server timing](/en-US/docs/Web/API/Performance_API/Server_timing)
  - : Server-Timing cho phép máy chủ truyền đạt các chỉ số về chu trình yêu cầu-phản hồi tới user agent.
    Bạn có thể thu thập thông tin này và xử lý các chỉ số phía máy chủ giống như các chỉ số khác được xử lý bằng Performance API.
- [User Timing API](/en-US/docs/Web/API/Performance_API/User_timing)
  - : Tạo các mốc thời gian dành riêng cho ứng dụng bằng các loại mục "mark" và "measure" của [User Timing API](/en-US/docs/Web/API/Performance_API/User_timing), sử dụng [high-precision timestamps](/en-US/docs/Web/API/DOMHighResTimeStamp) thuộc timeline hiệu năng của trình duyệt.

### API liên quan

Các API sau đây cũng hữu ích để đo lường và tác động đến hiệu năng trang:

- [Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
  - : Cung cấp các sự kiện mà bạn có thể theo dõi để biết khi nào một tài liệu trở nên hiển thị hoặc bị ẩn, cũng như các tính năng để xem trạng thái hiển thị hiện tại của trang.
- [Background Tasks API](/en-US/docs/Web/API/Background_Tasks_API)
  - : **Cooperative Scheduling of Background Tasks API** (còn được gọi là Background Tasks API hoặc API [`requestIdleCallback()`](/en-US/docs/Web/API/Window/requestIdleCallback)) cung cấp khả năng đưa tác vụ vào hàng đợi để user agent tự động thực thi khi nó xác định rằng có thời gian rảnh để làm vậy.
- [Beacon API](/en-US/docs/Web/API/Beacon_API)
  - : Giao diện [Beacon](/en-US/docs/Web/API/Beacon_API) lên lịch một yêu cầu không đồng bộ và không chặn tới máy chủ web.
- [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API)
  - : Intersection Observer API cung cấp cách quan sát không đồng bộ các thay đổi trong giao điểm giữa phần tử đích với phần tử tổ tiên hoặc với {{Glossary("Viewport")}} của tài liệu cấp cao nhất.
    Nó cho phép các trường hợp sử dụng như [định thời khả kiến của phần tử](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility) để nhận thông báo không đồng bộ khi các phần tử quan tâm trở nên hiển thị.
- [Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API/Using_the_Media_Capabilities_API)
  - : Hiển thị khả năng giải mã và mã hóa của thiết bị client, chẳng hạn media có được hỗ trợ hay không và việc phát có mượt và tiết kiệm điện hay không, với phản hồi theo thời gian thực về việc phát để hỗ trợ tốt hơn cho adaptive streaming và truy cập thông tin thuộc tính hiển thị.
- [Network Information API](/en-US/docs/Web/API/Network_Information_API)
  - : Thông tin về kết nối của hệ thống theo loại kết nối chung, ví dụ 'wifi', 'cellular', v.v.
    Nó có thể được dùng để chọn nội dung độ phân giải cao hoặc thấp dựa trên kết nối của người dùng.
- [Battery Status API](/en-US/docs/Web/API/Battery_Status_API)
  - : **Battery API** cung cấp thông tin về mức pin của hệ thống và cho phép bạn nhận thông báo bằng các sự kiện được gửi khi mức pin hoặc trạng thái sạc thay đổi.
    Nó có thể được dùng để điều chỉnh mức sử dụng tài nguyên của ứng dụng nhằm giảm hao pin khi pin yếu, hoặc lưu thay đổi trước khi pin cạn để tránh mất dữ liệu.
- [Navigator.deviceMemory](/en-US/docs/Web/API/Navigator/deviceMemory)
  - : Thuộc tính chỉ đọc **`deviceMemory`** của giao diện {{domxref("Navigator")}} trả về lượng bộ nhớ thiết bị ước tính tính bằng gigabyte.
- [FetchEvent.preloadResponse](/en-US/docs/Web/API/FetchEvent/preloadResponse)
  - : Thuộc tính chỉ đọc **`preloadResponse`** của giao diện {{domxref("FetchEvent")}} trả về một {{jsxref("Promise")}} được resolve thành navigation preload {{domxref("Response")}} nếu [navigation preload](/en-US/docs/Web/API/NavigationPreloadManager) đã được kích hoạt, hoặc `undefined` trong trường hợp ngược lại.

## Phân tích và công cụ

- [Firefox Profiler Performance Features](https://profiler.firefox.com/docs/#/)
  - : Trang web này cung cấp thông tin về cách dùng và hiểu các tính năng hiệu năng trong công cụ dành cho nhà phát triển của bạn, bao gồm [Call Tree](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-call-tree), [Flame Graph](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-flame-graph), [Stack Chart](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-stack-chart), [Marker Chart](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-marker-chart) và [Network Chart](https://profiler.firefox.com/docs/#/./guide-ui-tour-panels?id=the-network-chart).
- [Phân tích với profiler tích hợp sẵn](https://profiler.firefox.com/docs/#/./guide-getting-started)
  - : Tìm hiểu cách phân tích hiệu năng ứng dụng bằng profiler tích hợp sẵn của Firefox.

## Tham khảo

### HTML

- Phần tử [`<picture>`](/en-US/docs/Web/HTML/Reference/Elements/picture)
- Phần tử [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video)
- Phần tử [`<source>`](/en-US/docs/Web/HTML/Reference/Elements/source)
- Thuộc tính [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#attributes) như `srcset` cho hình ảnh đáp ứng
- Thuộc tính [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) để tải trước nội dung qua HTML

### CSS

- {{cssxref("will-change")}}

### JavaScript

- [DOMContentLoaded](/en-US/docs/Web/API/Document/DOMContentLoaded_event)
- [Garbage collection](/en-US/docs/Glossary/Garbage_collection)
- [requestAnimationFrame](/en-US/docs/Web/API/Window/requestAnimationFrame)

### HTTP

- [Content-encoding](/en-US/docs/Web/HTTP/Reference/Headers/Content-Encoding)
- Gợi ý tài nguyên qua [dns-prefetch](/en-US/docs/Web/HTTP/Reference/Headers/X-DNS-Prefetch-Control), [preconnect](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect), [prefetch](/en-US/docs/Glossary/Prefetch) và prerender
- [HTTP/2](/en-US/docs/Web/HTTP/Guides/Messages#http2_messages)
- [Client Hints](/en-US/docs/Web/HTTP/Guides/Client_hints)

## Xem thêm

- [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images) trong hướng dẫn HTML
- [Web Workers API](/en-US/docs/Web/API/Web_Workers_API), bao gồm [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers) và [Using Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Vận hành ngoại tuyến và nền](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation)
- [Caching](/en-US/docs/Web/HTTP/Guides/Caching)
- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- Thuật ngữ trong bảng chú giải:
  - {{glossary('Beacon')}}
  - {{glossary('Brotli compression')}}
  - {{glossary('CDN', 'Content Delivery Networks (CDN)')}}
  - {{glossary('CLS', 'Cumulative Layout Shifts (CLS)')}}
  - {{glossary('Code splitting')}}
  - {{glossary('CSSOM')}}
  - {{glossary('Domain sharding')}}
  - {{glossary('Effective connection type')}}
  - {{glossary('First contentful paint', 'First contentful paint (FCP)')}}
  - {{glossary('First CPU idle')}}
  - {{glossary('First paint')}}
  - {{glossary('gzip_compression')}}
  - {{glossary('HTTP_2', 'HTTP/2')}}
  - {{glossary('HTTP')}}
  - {{glossary('Interaction to next paint', 'Interaction to next paint (INP)')}}
  - {{glossary('Jank')}}
  - {{glossary('Largest contentful paint', 'Largest Contentful Paint (LCP)')}}
  - {{glossary('Latency')}}
  - {{glossary('Lazy load')}}
  - {{glossary('Long task')}}
  - {{glossary('Lossless compression')}}
  - {{glossary('Lossy compression')}}
  - {{glossary('Main thread')}}
  - {{glossary('Minification')}}
  - {{glossary('Network throttling')}}
  - {{glossary('Packet')}}
  - {{glossary('Page load time')}}
  - {{glossary('Page prediction')}}
  - {{glossary('Parse')}}
  - {{glossary('Perceived performance')}}
  - {{glossary('Prefetch')}}
  - {{glossary('Prerender')}}
  - {{glossary('QUIC')}}
  - {{glossary('RAIL')}}
  - {{glossary('Real User Monitoring', 'Real User Monitoring (RUM)')}}
  - {{glossary('Resource Timing')}}
  - {{glossary('Round Trip Time', 'Round Trip Time (RTT)')}}
  - {{glossary('Server Timing')}}
  - {{glossary('Speculative parsing')}}
  - {{glossary('Speed index')}} (và Perceptual Speed Index)
  - {{glossary('SSL')}}
  - {{glossary('Synthetic monitoring')}}
  - {{glossary('TCP handshake')}}
  - {{glossary('TCP slow start')}}
  - {{glossary('TCP', 'Transmission Control Protocol (TCP)')}}
  - {{glossary('Time to first byte', 'Time to first byte (TTFB)')}}
  - {{glossary('Time to interactive', 'Time to interactive (TTI)')}}
  - {{glossary('TLS')}}
  - {{glossary('Tree shaking')}}
  - {{glossary('Web performance')}}
- [Hiệu năng trong Firefox Developer Tools](https://profiler.firefox.com/docs/#/)
