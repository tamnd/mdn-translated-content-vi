---
title: Đo lường hiệu suất
slug: Learn_web_development/Extensions/Performance/Measuring_performance
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Perceived_performance", "Learn_web_development/Extensions/Performance/Multimedia", "Learn_web_development/Extensions/Performance")}}

Đo lường hiệu suất cung cấp một số liệu quan trọng để giúp bạn đánh giá sự thành công của ứng dụng, trang web hoặc dịch vụ web của mình.

Ví dụ, bạn có thể sử dụng các số liệu hiệu suất để xác định cách ứng dụng của bạn hoạt động so với đối thủ cạnh tranh hoặc so sánh hiệu suất ứng dụng của bạn qua các phiên bản. Các số liệu của bạn nên phù hợp với người dùng, trang web và mục tiêu kinh doanh của bạn. Chúng nên được thu thập, đo lường nhất quán và phân tích ở định dạng mà các bên liên quan không có kỹ thuật có thể sử dụng và hiểu.

Bài viết này giới thiệu các công cụ bạn có thể sử dụng để truy cập các số liệu hiệu suất web, có thể được sử dụng để đo lường và tối ưu hóa hiệu suất của trang web.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        <p>
          Cung cấp thông tin về các số liệu hiệu suất web mà bạn có thể thu thập thông qua các API hiệu suất web và các công cụ khác nhau mà bạn có thể sử dụng để trực quan hóa dữ liệu đó.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Công cụ hiệu suất

Có một số công cụ khác nhau có sẵn để giúp bạn đo lường và cải thiện hiệu suất. Chúng thường có thể được phân loại thành hai nhóm:

- Các công cụ chỉ ra hoặc đo lường hiệu suất, chẳng hạn như [PageSpeed Insights](https://pagespeed.web.dev/) hoặc Firefox [Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) và [Performance Monitor](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html). Các công cụ này cho bạn thấy trang web của bạn đang tải nhanh hay chậm như thế nào. Chúng cũng chỉ ra các khu vực có thể được cải thiện để tối ưu hóa ứng dụng web của bạn.
- [Các API hiệu suất](/en-US/docs/Web/API/Performance_API) mà bạn có thể sử dụng để xây dựng các công cụ đo lường hiệu suất tùy chỉnh.

## Công cụ báo cáo hiệu suất chung

Các công cụ như [PageSpeed Insights](https://pagespeed.web.dev/) có thể cung cấp các phép đo hiệu suất nhanh. Bạn có thể nhập URL và nhận báo cáo hiệu suất trong vài giây. Báo cáo chứa điểm số cho biết trang web của bạn hoạt động như thế nào trên thiết bị di động và máy tính. Đây là điểm khởi đầu tốt để hiểu những gì bạn đang làm tốt và những gì có thể được cải thiện.

Tại thời điểm viết bài, bản tóm tắt báo cáo hiệu suất của MDN trông tương tự như sau:

![Ảnh chụp màn hình của báo cáo PageSpeed Insights cho trang chủ Mozilla.](pagespeed-insight-mozilla-homepage.png)

Báo cáo hiệu suất chứa thông tin về những thứ như người dùng phải chờ bao lâu trước khi _bất cứ điều gì_ được hiển thị trên trang, cần tải xuống bao nhiêu byte để hiển thị một trang, và nhiều hơn nữa. Nó cũng cho bạn biết nếu các giá trị được đo là tốt hay xấu.

[webpagetest.org](https://www.webpagetest.org/) là một ví dụ khác về một công cụ tự động kiểm tra trang web của bạn và trả về các số liệu có giá trị.

Bạn có thể thử chạy trang web yêu thích của mình qua các công cụ này và xem điểm số.

## Công cụ giám sát mạng

Các trình duyệt hiện đại có các công cụ sẵn có mà bạn có thể sử dụng để chạy trên các trang đã tải và xác định hiệu suất của chúng; hầu hết chúng hoạt động tương tự nhau. Ví dụ, Firefox [Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) trả về thông tin chi tiết về tất cả các tài nguyên được tải xuống từ mạng, cùng với biểu đồ thời gian waterfall hiển thị thời gian tải xuống mỗi tài nguyên mất bao lâu.

![Firefox network monitor showing a list of assets that has loaded as well as load time per asset](network-monitor.png)

Bạn cũng nên xem [tài liệu Network Monitor của Chrome](https://developer.chrome.com/docs/devtools/network/).

## Công cụ theo dõi hiệu suất

Bạn cũng có thể sử dụng các công cụ hiệu suất trình duyệt như [Firefox Performance Monitor](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html) để đo lường hiệu suất giao diện người dùng của ứng dụng web hoặc trang web khi bạn thực hiện các hành động khác nhau. Điều này chỉ ra các tính năng có thể làm chậm ứng dụng web hoặc trang web của bạn.

![Developer tools performance panel showing the waterfall of recording #1.](perf-monitor.png)

Xem thêm [tài liệu công cụ Performance của Chrome](https://developer.chrome.com/docs/devtools/performance/).

## Các API hiệu suất

Khi viết mã cho Web, có nhiều [Web API](/en-US/docs/Web/API) sẵn có để tạo các công cụ đo lường hiệu suất của riêng bạn.

Bạn có thể sử dụng [Navigation Timing API](/en-US/docs/Web/API/Performance_API/Navigation_timing) để đo lường hiệu suất web phía client, bao gồm lượng thời gian cần thiết để hủy tải trang trước, thời gian tra cứu tên miền mất bao lâu, tổng thời gian dành cho việc thực thi trình xử lý tải của cửa sổ, và nhiều hơn nữa. Bạn có thể sử dụng API này cho các số liệu liên quan đến tất cả các sự kiện điều hướng trong sơ đồ dưới đây.

![The various handlers that the navigation timing API can handle including Navigation timing API metrics Prompt for unload redirect unload App cache DNS TCP Request Response Processing onLoad navigationStart redirectStart redirectEnd fetchStart domainLookupEnd domainLookupStart connectStart (secureConnectionStart) connectEnd requestStart responseStart responseEnd unloadStart unloadEnd domLoading domInteractive domContentLoaded domComplete loadEventStart loadEventEnd](navigationtimingapi.jpg)

[Performance API](/en-US/docs/Web/API/Performance_API), cung cấp quyền truy cập vào thông tin liên quan đến hiệu suất cho trang hiện tại, bao gồm một số API bao gồm [Navigation Timing API](/en-US/docs/Web/API/Performance_API/Navigation_timing), [User Timing API](/en-US/docs/Web/API/Performance_API/User_timing) và [Resource Timing API](/en-US/docs/Web/API/Performance_API/Resource_timing). Các giao diện này cho phép đo lường chính xác thời gian cần thiết để các tác vụ JavaScript hoàn thành.

Đối tượng [PerformanceEntry](/en-US/docs/Web/API/PerformanceEntry) là một phần của _timeline hiệu suất_. Một _mục nhập hiệu suất_ có thể được tạo trực tiếp bằng cách tạo một _{{domxref("PerformanceMark","mark")}}_ hoặc _{{domxref("PerformanceMeasure","measure")}}_ về hiệu suất (ví dụ bằng cách gọi phương thức {{domxref("Performance.mark","mark()")}}) tại một điểm rõ ràng trong ứng dụng. Các mục nhập hiệu suất cũng được tạo theo những cách gián tiếp, chẳng hạn như tải một tài nguyên như hình ảnh.

[PerformanceObserver API](/en-US/docs/Web/API/PerformanceObserver) có thể được sử dụng để quan sát các sự kiện đo lường hiệu suất và để thông báo cho bạn về các [mục nhập hiệu suất](/en-US/docs/Web/API/PerformanceEntry) mới khi chúng được ghi lại trong timeline hiệu suất của trình duyệt.

Mặc dù bài viết này không đi sâu vào việc sử dụng các API này, nhưng hữu ích khi biết chúng tồn tại. Tham khảo bài viết [Điều hướng và thời gian](/en-US/docs/Web/Performance/Guides/Navigation_and_resource_timings) để biết thêm ví dụ về việc sử dụng các API Web hiệu suất.

## Kết luận

Bài viết này tóm tắt ngắn gọn một số công cụ có thể giúp bạn đo lường hiệu suất trên ứng dụng web hoặc trang web. Trong bài viết tiếp theo, chúng ta sẽ xem cách bạn có thể tối ưu hóa hình ảnh trên trang web của mình để cải thiện hiệu suất.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Perceived_performance", "Learn_web_development/Extensions/Performance/Multimedia", "Learn_web_development/Extensions/Performance")}}
