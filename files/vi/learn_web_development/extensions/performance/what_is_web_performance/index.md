---
title: Hiệu suất web là gì?
slug: Learn_web_development/Extensions/Performance/What_is_web_performance
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/why_web_performance", "Learn_web_development/Extensions/Performance/Perceived_performance", "Learn_web_development/Extensions/Performance")}}

Hiệu suất web là tất cả về việc làm cho website nhanh, bao gồm cả việc làm cho các quy trình chậm _có vẻ_ nhanh. Liệu trang web có tải nhanh không, cho phép người dùng bắt đầu tương tác với nó nhanh chóng, và cung cấp phản hồi đảm bảo nếu có điều gì đó đang mất thời gian để tải (ví dụ: vòng quay tải)? Cuộn trang và hoạt ảnh có mượt mà không? Bài viết này cung cấp giới thiệu ngắn gọn về hiệu suất web khách quan, có thể đo lường\*, xem xét các công nghệ, kỹ thuật và công cụ nào tham gia vào tối ưu hóa web.

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
        Để có sự quen thuộc cơ bản về những gì liên quan đến hiệu suất web.
      </td>
    </tr>
  </tbody>
</table>

_\* so với [hiệu suất cảm nhận](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance) mang tính chủ quan, được đề cập trong bài viết tiếp theo_

## Hiệu suất web là gì?

Hiệu suất web là phép đo khách quan và trải nghiệm người dùng được nhận thức của một trang web hoặc ứng dụng. Điều này bao gồm các lĩnh vực chính sau:

- **Giảm tổng thời gian tải**: Mất bao lâu để các tệp cần thiết để kết xuất trang web tải xuống máy tính của người dùng? Điều này thường bị ảnh hưởng bởi [độ trễ](/en-US/docs/Web/Performance/Guides/Understanding_latency), kích thước tệp của bạn lớn thế nào, có bao nhiêu tệp và các yếu tố khác. Một chiến lược chung là làm cho các tệp của bạn nhỏ nhất có thể, giảm số lượng yêu cầu HTTP được thực hiện càng nhiều càng tốt, và sử dụng các kỹ thuật tải thông minh (như [preload](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload)) để làm cho các tệp có sẵn sớm hơn.
- **Làm cho trang web có thể sử dụng càng sớm càng tốt**: Về cơ bản điều này có nghĩa là tải các tài nguyên trang web của bạn theo thứ tự hợp lý để người dùng có thể thực sự bắt đầu sử dụng nó rất nhanh. Bất kỳ tài nguyên nào khác có thể tiếp tục tải trong nền trong khi người dùng thực hiện các tác vụ chính, và đôi khi chúng ta chỉ tải tài nguyên khi chúng thực sự cần thiết (điều này được gọi là [tải lười](/en-US/docs/Web/Performance/Guides/Lazy_loading)). Phép đo thời gian cần thiết để trang web đạt đến trạng thái có thể sử dụng sau khi bắt đầu tải được gọi là [thời gian đến tương tác](/en-US/docs/Glossary/Time_to_interactive).
- **Độ mượt mà và tính tương tác**: Ứng dụng có cảm giác đáng tin cậy và thú vị để sử dụng không? Cuộn trang có mượt mà không? Các nút có thể nhấp được không? Các popup có mở nhanh không, và chúng có hoạt ảnh mượt mà khi mở không? Có nhiều phương pháp hay nhất cần xem xét để làm cho ứng dụng cảm thấy mượt mà, ví dụ sử dụng hoạt ảnh CSS thay vì JavaScript cho hoạt ảnh, và giảm thiểu số lần vẽ lại giao diện người dùng cần thiết do thay đổi trong DOM.
- **[Hiệu suất cảm nhận](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance)**: Website có vẻ nhanh đến mức nào đối với người dùng có tác động lớn hơn đến trải nghiệm người dùng so với tốc độ thực tế của trang web. Cách người dùng nhận thức hiệu suất của bạn cũng quan trọng, hoặc có lẽ quan trọng hơn, bất kỳ số liệu khách quan nào, nhưng nó mang tính chủ quan, và không dễ đo lường. Hiệu suất cảm nhận là quan điểm của người dùng, không phải là một số liệu. Ngay cả khi một hoạt động sẽ mất nhiều thời gian (vì độ trễ hoặc bất cứ điều gì), vẫn có thể giữ người dùng tham gia trong khi họ chờ bằng cách hiển thị vòng quay tải hoặc một loạt các gợi ý và mẹo hữu ích (hoặc trò đùa, hoặc bất cứ điều gì khác bạn cho là phù hợp). Cách tiếp cận như vậy tốt hơn nhiều so với việc không hiển thị gì, điều này sẽ khiến có cảm giác như mất nhiều thời gian hơn và có thể dẫn đến người dùng nghĩ rằng nó bị hỏng và bỏ cuộc.
- **[Các phép đo hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance)**: Hiệu suất web liên quan đến việc đo lường tốc độ thực tế và được cảm nhận của một ứng dụng, tối ưu hóa khi có thể, và sau đó theo dõi hiệu suất, để đảm bảo những gì bạn đã tối ưu hóa vẫn được tối ưu hóa. Điều này liên quan đến một số số liệu (các chỉ số có thể đo lường có thể chỉ ra thành công hoặc thất bại) và các công cụ để đo lường các số liệu đó, mà chúng ta sẽ thảo luận trong suốt mô-đun này.

Tóm lại, nhiều tính năng ảnh hưởng đến hiệu suất bao gồm độ trễ, kích thước ứng dụng, số lượng nút DOM, số lượng yêu cầu tài nguyên được thực hiện, hiệu suất JavaScript, tải CPU và nhiều hơn nữa. Điều quan trọng là giảm thiểu thời gian tải và phản hồi, và thêm các tính năng bổ sung để che giấu độ trễ bằng cách làm cho trải nghiệm có sẵn và tương tác nhất có thể, càng sớm càng tốt, trong khi tải không đồng bộ các phần dài hơn của trải nghiệm.

> [!NOTE]
> Hiệu suất web bao gồm cả các phép đo khách quan như thời gian tải, khung hình mỗi giây và [thời gian đến tương tác](/en-US/docs/Glossary/Time_to_interactive), và các trải nghiệm chủ quan về thời gian cảm giác như thế nào để nội dung tải xong.

## Cách nội dung được kết xuất

Để hiểu hiệu quả về hiệu suất web, các vấn đề đằng sau nó, và các lĩnh vực chủ đề chính mà chúng ta đã đề cập ở trên, bạn thực sự nên hiểu một số chi tiết cụ thể về cách trình duyệt hoạt động. Điều này bao gồm:

- **Cách trình duyệt hoạt động**. Khi bạn yêu cầu một URL và nhấn <kbd>Enter</kbd> / <kbd>Return</kbd>, trình duyệt tìm ra server đang giữ các tệp của trang web đó, thiết lập kết nối với nó, và yêu cầu các tệp. Xem [Điền vào trang: cách trình duyệt hoạt động](/en-US/docs/Web/Performance/Guides/How_browsers_work) để biết tổng quan chi tiết.
- **Thứ tự nguồn**. Thứ tự nguồn của tệp HTML index của bạn có thể ảnh hưởng đáng kể đến hiệu suất. Việc tải xuống các tài nguyên bổ sung được liên kết từ tệp index thường tuần tự, dựa trên thứ tự nguồn, nhưng điều này có thể được thao tác và chắc chắn nên được tối ưu hóa, nhận ra rằng một số tài nguyên chặn các tải xuống bổ sung cho đến khi nội dung của chúng được phân tích và thực thi.
- **Đường dẫn quan trọng**. Đây là quá trình mà trình duyệt sử dụng để xây dựng tài liệu web sau khi các tệp đã được tải xuống từ server. Trình duyệt tuân theo một bộ bước được xác định rõ ràng, và tối ưu hóa đường dẫn kết xuất quan trọng để ưu tiên hiển thị nội dung liên quan đến hành động người dùng hiện tại sẽ dẫn đến cải thiện đáng kể trong thời gian kết xuất nội dung. Xem [Đường dẫn kết xuất quan trọng](/en-US/docs/Web/Performance/Guides/Critical_rendering_path) để biết thêm thông tin.
- **Mô hình đối tượng tài liệu**. Mô hình đối tượng tài liệu, hay DOM, là cấu trúc cây đại diện cho nội dung và các phần tử của HTML của bạn dưới dạng cây nút. Điều này bao gồm tất cả các thuộc tính HTML và các mối quan hệ giữa các nút. Thao tác DOM rộng rãi sau khi trang đã tải (ví dụ: thêm, xóa hoặc di chuyển các nút) có thể ảnh hưởng đến hiệu suất, vì vậy đáng để hiểu cách DOM hoạt động và cách các vấn đề như vậy có thể được giảm thiểu. Tìm hiểu thêm tại [Mô hình đối tượng tài liệu](/en-US/docs/Web/API/Document_Object_Model).
- **Độ trễ**. Chúng ta đề cập điều này ngắn gọn ở trên, nhưng tóm lại, độ trễ là thời gian để các tài nguyên trang web của bạn di chuyển từ server đến máy tính của người dùng. Có chi phí liên quan đến việc thiết lập kết nối TCP và HTTP, và một số độ trễ không thể tránh khỏi trong việc đẩy các byte yêu cầu và phản hồi qua lại trên mạng, nhưng có một số cách để giảm độ trễ (ví dụ: giảm số lượng yêu cầu HTTP bạn thực hiện bằng cách tải xuống ít tệp hơn, sử dụng [CDN](/en-US/docs/Glossary/CDN) để làm cho trang web của bạn hoạt động tốt hơn trên toàn cầu, và sử dụng HTTP/2 để phục vụ tệp hiệu quả hơn từ server). Bạn có thể đọc tất cả về chủ đề này tại [Hiểu về Độ trễ](/en-US/docs/Web/Performance/Guides/Understanding_latency).

## Kết luận

Đó là tất cả cho bây giờ; chúng tôi hy vọng tổng quan ngắn gọn của chúng tôi về chủ đề hiệu suất web đã giúp bạn có ý tưởng về tất cả những gì liên quan, và khiến bạn háo hức muốn tìm hiểu thêm. Tiếp theo chúng ta sẽ xem xét hiệu suất cảm nhận, và cách bạn có thể sử dụng một số kỹ thuật thông minh để làm cho một số tác động hiệu suất không thể tránh khỏi xuất hiện ít nghiêm trọng hơn đối với người dùng, hoặc che giấu chúng hoàn toàn.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/why_web_performance", "Learn_web_development/Extensions/Performance/Perceived_performance", "Learn_web_development/Extensions/Performance")}}
