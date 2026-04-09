---
title: "Giám sát hiệu năng: RUM so với giám sát tổng hợp"
short-title: RUM so với giám sát tổng hợp
slug: Web/Performance/Guides/Rum-vs-Synthetic
page-type: guide
sidebar: performancesidebar
---

**Giám sát tổng hợp** và **giám sát người dùng thực tế (RUM)** là hai cách tiếp cận để theo dõi và cung cấp thông tin chi tiết về hiệu năng web. RUM và giám sát tổng hợp cung cấp các góc nhìn khác nhau về hiệu năng và có những lợi ích, trường hợp sử dụng tốt và hạn chế riêng. RUM nói chung phù hợp nhất để hiểu xu hướng dài hạn, trong khi giám sát tổng hợp rất phù hợp cho kiểm thử hồi quy và giảm thiểu các vấn đề hiệu năng ngắn hạn trong quá trình phát triển. Bài viết này định nghĩa và so sánh hai cách giám sát hiệu năng này.

## Giám sát tổng hợp

Giám sát tổng hợp liên quan đến việc theo dõi hiệu năng của một trang trong môi trường "phòng thí nghiệm", thường với công cụ tự động hóa trong một môi trường nhất quán nhất có thể. Giám sát tổng hợp bao gồm việc triển khai các tập lệnh để mô phỏng hành trình mà người dùng cuối có thể đi qua một ứng dụng web, rồi báo cáo lại hiệu năng mà trình mô phỏng trải nghiệm. Lưu lượng được đo không phải từ chính người dùng thật của bạn, mà là lưu lượng được tạo tổng hợp để thu thập dữ liệu về hiệu năng trang.

Một ví dụ về giám sát tổng hợp là [WebPageTest.org](https://www.webpagetest.org/). Nó được thực hiện trong một môi trường được kiểm soát, nơi các biến như địa lý, mạng, thiết bị, trình duyệt và trạng thái bộ nhớ đệm đều được xác định trước. Nó cung cấp các biểu đồ waterfall cho từng tài nguyên do máy chủ và [CDN](/en-US/docs/Glossary/CDN) phục vụ, cũng như mọi tài nguyên của bên thứ ba và các yêu cầu tài nguyên được tạo bởi tất cả các script của bên thứ ba, chẳng hạn như quảng cáo và dịch vụ phân tích.

Kiểm soát các biến môi trường rất hữu ích để hiểu các điểm nghẽn hiệu năng đã xảy ra ở đâu và xác định nguồn gốc của bất kỳ vấn đề hiệu năng nào. Ví dụ, điều đó không phản ánh trải nghiệm thực tế của người dùng, đặc biệt là ở phần đuôi dài.

Giám sát tổng hợp có thể là một thành phần quan trọng của kiểm thử hồi quy và giám sát trang web trong môi trường sản xuất. Kiểm thử trang web ở mọi giai đoạn phát triển và thường xuyên trong môi trường sản xuất. Các thay đổi so với mức hiệu năng cơ sở như một phần của {{glossary("continuous integration")}} nên làm cho quá trình đẩy thất bại. Nếu một vấn đề phát sinh trong môi trường sản xuất, giám sát tổng hợp có thể cung cấp thông tin chi tiết, giúp xác định, cô lập và giải quyết vấn đề trước khi chúng ảnh hưởng xấu đến trải nghiệm người dùng.

## Giám sát người dùng thực tế

**Giám sát người dùng thực tế** hoặc RUM đo hiệu năng của một trang từ máy của người dùng thật. Thông thường, một script của bên thứ ba sẽ chèn một script trên mỗi trang để đo và báo cáo dữ liệu tải trang cho mọi yêu cầu được thực hiện. Kỹ thuật này theo dõi các tương tác thực tế của người dùng với ứng dụng. Trong giám sát người dùng thực tế, trình duyệt của người dùng thật báo lại các chỉ số hiệu năng mà họ trải nghiệm. RUM giúp xác định cách một ứng dụng đang được sử dụng, bao gồm phân bố địa lý của người dùng và tác động của phân bố đó đối với trải nghiệm người dùng cuối.

Không giống giám sát tổng hợp, RUM ghi nhận hiệu năng của người dùng thực tế bất kể thiết bị, trình duyệt, mạng hay vị trí địa lý. Khi người dùng tương tác với một ứng dụng, mọi mốc thời gian hiệu năng đều được ghi nhận, bất kể họ thực hiện hành động gì hoặc xem trang nào. RUM theo dõi các trường hợp sử dụng thực tế, không phải các trường hợp sử dụng tổng hợp, giả định, được xác định trước bởi kỹ sư, PM hoặc đội marketing. Điều này đặc biệt quan trọng với các trang lớn hoặc ứng dụng phức tạp, nơi chức năng hoặc nội dung thay đổi liên tục, và nơi nhóm người truy cập ứng dụng có thể rất khác với những người tạo ra nó về trải nghiệm sống.

Nhờ tận dụng RUM, doanh nghiệp có thể hiểu người dùng của mình tốt hơn và xác định những khu vực trên trang cần được chú ý nhiều nhất. Hơn nữa, RUM có thể giúp hiểu các xu hướng phân bố theo địa lý hoặc theo kênh của người dùng. Biết các xu hướng người dùng giúp bạn xác định tốt hơn kế hoạch kinh doanh của mình và, từ góc nhìn giám sát, cho phép xác định các khu vực trọng yếu để nhắm tới tối ưu hóa và cải thiện hiệu năng.

## RUM so với giám sát tổng hợp

Giám sát tổng hợp rất phù hợp để phát hiện hồi quy trong các chu kỳ phát triển, đặc biệt là với {{glossary('network throttling')}}. Nó khá dễ, rẻ và tuyệt vời để kiểm tra nhanh hiệu năng trong quá trình phát triển như một cách hiệu quả để đo tác động của các thay đổi mã, nhưng nó không phản ánh những gì người dùng thực tế đang trải nghiệm và chỉ cung cấp một góc nhìn hẹp về hiệu năng.

Ngược lại, RUM cung cấp các chỉ số thực từ người dùng thực tế đang sử dụng trang web hoặc ứng dụng. Mặc dù cách này tốn kém hơn và có thể kém tiện lợi hơn, nó cung cấp dữ liệu trải nghiệm người dùng rất quan trọng.

## API hiệu năng

Có rất nhiều dịch vụ giám sát. Nếu bạn muốn tự xây dựng hệ thống giám sát của riêng mình, hãy xem các API hiệu năng, chủ yếu là {{domxref("PerformanceNavigationTiming")}} và {{domxref("PerformanceResourceTiming")}}, nhưng cũng có {{domxref("PerformanceMark")}}, {{domxref("PerformanceMeasure")}}, và {{domxref("PerformancePaintTiming")}}.
